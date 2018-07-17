require_relative './commands'
require_relative './code'
require_relative './response'
require_relative './messages'

class Play
  include Commands, Messages
   MAX_GUESS_COUNT ||= 10

   def initialize 
    @mastermind = Code.new
    @secret = @mastermind.generate_code
  end 

  def game_loop
    guess = 1
    previous_guesses = []
    while guess <= MAX_GUESS_COUNT
      input = Response.new(input).get_input
      previous_guesses << input.clone
      key = @secret.clone
      @red_pins = @mastermind.red_counter(key, input)
      break if @mastermind.won?(@red_pins)
      @mastermind.trim(key, input)
      white_pins = @mastermind.white_counter(key, input)
      @mastermind.feedback(white_pins, @red_pins)
      remaining_guesses(guess)
      guess += 1 
    end
  end

  def end_game
    if @mastermind.won?(@red_pins)
      won_message
    else 
      lost_message(@secret)
    end
    restart
  end
end