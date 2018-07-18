require_relative './commands'
require_relative './code'
require_relative './compare_code'
require_relative './messages'
require_relative './get_input'

class Play
  include Commands, Messages
   MAX_TURN_COUNT ||= 10

  def initialize 
    @pin_counter = CompareCode.new
  end 

  def game_loop(turn = 1, previous_guesses = [], secret = Code.new.generate_code )
    @secret = secret
    while turn <= MAX_TURN_COUNT
      guess = GetInput.new(guess).new_guess
      previous_guesses << guess.clone
      key = @secret.clone
      @red_pins = @pin_counter.red_counter(key, guess)
      break if @pin_counter.won?(@red_pins)
      @pin_counter.trim(key, guess)
      white_pins = @pin_counter.white_counter(key, guess)
      @pin_counter.feedback(white_pins, @red_pins)
      remaining_guesses(turn)
      turn += 1 
    end
  end

  def end_game
    if @pin_counter.won?(@red_pins)
      won_message
    else 
      lost_message(@secret)
    end
    restart
  end
end