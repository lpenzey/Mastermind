
class Welcome
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
    puts 'press \'q\' to quit, or hit enter to continue.'
    quit if gets.chomp.downcase == "q"
  end

  def quit
    abort("It's been an honor serving with you. Farewell!")
  end
end

class Code
  attr_reader :red_pins, :white_pins

  def generate_code
    @colors = colors = ["r", "g", "o", "y", "b", "p"]
    @answer = (1..4).map { @colors[rand(6)] }
  end

  def red_counter(key, input)
    red_pins = []
    position = 0
    while input.length > position
      key.each do |match|
        red_pins << 1 if key[position] == input[position]
        position += 1
      end
    end
    red_pins
  end

  def trim(key, input)
   4.times do |n|
    if input[n] == key[n]
      input[n] = ""
      key[n] = ""
    end
  end
  input
  end

  def white_counter(key, input)
    white_pins = (key & input)
    .flat_map { |n| [n]*[key.count(n), input.count(n)].min }
    .reject { |c| c.empty? }
  end

  def feedback(white_pins, red_pins)
    puts "You have #{red_pins.length} red pins and #{white_pins.length} white pins."
  end

  def won
    puts "Congratulations, you've cracked the code!"
    puts "Press \"r\" to restart or anything else to quit"
    if gets.chomp.downcase == "r"
      load 'mastermind.rb' 
    else 
      abort("Thanks for playing!")
    end
  end
end

class Response
  attr_reader :player_input

  def initialize(new_input)
    @valid_guess = false
    @player_input = new_input
  end

  def get_input
    puts "Please enter a guess [****]"
    @player_input = gets.chomp.downcase.gsub(/[\W]/, "")
    get_input if length_error || color_error
    
    @player_input.split(//)
  end

  def valid_length?
    @player_input.length == 4
  end

  def length_error
    return false if valid_length?
    puts "Invalid length, please enter exactly 4 colors"
    true
  end

  def valid_colors?
    true if /\A[rgobyp][rgobyp][rgobyp][rgobyp]\z/.match(@player_input.to_s)
  end

  def color_error
    return false if valid_colors?
    puts "Invalid colors, please enter only available colors: r, g, o, y, b, p."
    true
  end
end

def main
  game = Welcome.new
  game.show_instructions
  code1 = Code.new
  secret = code1.generate_code
  guess = 1
  while guess <= 10 
    key = secret.clone
    input = Response.new(input).get_input
    red_pins = code1.red_counter(key, input)
    code1.won if red_pins == [1, 1, 1, 1]
    code1.trim(key, input)
    white_pins = code1.white_counter(key, input)
    code1.feedback(white_pins, red_pins)
    puts "(#{10-guess} guesses remaining)" 
    guess += 1 
  end
  print "Nice try, but the answer was " + secret.to_s + " better luck next time!"
end

if __FILE__ == $0
  main
end
