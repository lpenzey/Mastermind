require_relative './commands'
require_relative './code'
require_relative './response'

class Play
  include Commands
   MAX_GUESS_COUNT ||= 10

  def show_instructions
    puts "Welcome to Mastermind! Your challenge is
to guess the secret four digit code in under 10 tries."
    puts ""
    puts "The code can include the following colors:
Red(r), Green(g), Orange(o), Blue(b), Yellow(y) and Purple(p)
Enter your guess by entering four color values from above, such as rgyb or pggy."
    puts ""
    puts "If you have a correct color in the right position, you get a red pin.
If you have a correct color in the wrong position, you get a white pin"
    puts ""
    puts 'type \'quit\' at any time to quit/restart, or hit enter to continue.'
    leave if gets.chomp.downcase == "quit"
  end

  def loop
    code1 = Code.new
    secret = code1.generate_code
    guess = 1
    while guess <= MAX_GUESS_COUNT
      key = secret.clone
      input = Response.new(input).get_input
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


