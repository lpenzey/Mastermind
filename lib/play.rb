require_relative './commands'
require_relative './code'
require_relative './compare_code'
require_relative './messages'
require_relative './get_input'
require 'json'

class Play
  include Messages
  MAX_TURN_COUNT = 10

  def initialize(compare_code, get_input)
    @pin_counter = compare_code
    @commands = Commands.new
    @get_input = get_input
    code = Code.new()
  end 

  def find_saved_games?
    !File.stat('saved_games.json').zero?
  end 

  def load_saved_games
    file = File.read('saved_games.json')
    game_1 = JSON.parse(file)
  end

  def save_game(turn, previous_guesses, secret)
    game_1 = {
      :turn => turn, 
      :previous_guesses => previous_guesses,
      :secret => secret
    }

    File.open("saved_games.json","w") do |f|
      f.write(game_1.to_json)
    end
  end

  def delete_saved_game
    File.open("saved_games.json","w") do |f|
      f.write("")
      end
  end

  def game_loop(turn, previous_guesses, secret)
    @secret = secret
    while turn <= MAX_TURN_COUNT
      guess = @get_input.get_guess
      @red_pins = @pin_counter.red_counter(secret, guess)
      white_pins = @pin_counter.white_pins(secret, guess)
      break if @pin_counter.won?(@red_pins)
      create_previous_guesses(previous_guesses, guess, white_pins, @red_pins)
      display_previous_guesses(previous_guesses, turn)
      save_game(turn, previous_guesses, secret)
      turn += 1
    end
  end

  def create_previous_guesses(previous_guesses, guess, white_pins, red_pins)
    previous_guesses << guess
    previous_guesses << red_pins
    previous_guesses << white_pins
  end

  def end_game
    delete_saved_game
      if @pin_counter.won?(@red_pins)
        won_message
      else 
        lost_message(@secret)
      end
       @commands.restart
  end
end