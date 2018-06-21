class Mastermind
  def show_instructions
    puts 'Welcome to Mastermind! Your challenge is
to guess the secret four digit code in under 10 tries.

The code can include the following colors:
Red(r), Green(g), Orange(o), Blue(b), Yellow(y) and Purple(p)
Enter your guess by entering four color values from above, such as rgyb or pggy.

If you have a correct color in a correct position, you get a white pin.
If you have a correct color in a different position, you get a black pin
press \'q\' to quit, or enter your first guess.'
  end
end

class Code
  attr_reader :answer

  def generate_code
    @colors = ["r", "g", "o", "b", "y", "p"]
    answer = (1..4).map { @colors[rand(6)] }
  end
end

class Response
  attr_reader :player_input

  def initialize(new_input)
    @valid_guess = false
    @player_input = new_input
  end

  def get_input
    puts "Please enter a guess from the available colors: r, g, o, b, y, p"
    @player_input = gets.chomp.downcase.gsub(/[\W]/, "")
  end

  def valid_length?
    @player_input.length != 4
  end

  def length_error
    if valid_length?
      puts "Invalid length, please enter exactly 4 colors"
    end
  end
end

def main
  game = Mastermind.new
  game.show_instructions
  answer = Code.new.generate_code
  input = Response.new(input).get_input
end

if __FILE__ == $0
  main
end
