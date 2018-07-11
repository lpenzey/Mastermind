require_relative './commands'
require_relative './code'
require_relative './response'

class Play
  include Commands
   MAX_GUESS_COUNT ||= 10

  def loop
    code1 = Code.new
    secret = code1.generate_code
    guess = 1
    while guess <= MAX_GUESS_COUNT
      input = Response.new(input).get_input
      key = secret.clone
      red_pins = code1.red_counter(key, input)
      code1.won if red_pins == [1, 1, 1, 1]
      code1.trim(key, input)
      white_pins = code1.white_counter(key, input)
      code1.feedback(white_pins, red_pins)
      puts "(#{10-guess} guesses remaining)"
      puts ""
      guess += 1 
    end
    
    puts "Nice try, but the answer was #{secret} better luck next time!"
    restart
  end
end


