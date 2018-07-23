require_relative './commands'
require_relative './messages'
require_relative './validate_input'
require_relative './play'

class GetInput
  include Messages

  def initialize
    @commands = Commands.new
    @validator = ValidateInput.new
  end

  def get_guess
    new_guess = ""
    until @validator.valid_length?(new_guess) && @validator.valid_colors?(new_guess)
      get_input_message 
      new_guess = gets.chomp.downcase.gsub(/[\W]/, "")
      @commands.leave if new_guess == "quit"
      @validator.length_error(new_guess)
      @validator.color_error(new_guess)
    end
    new_guess.split(//)
  end
end