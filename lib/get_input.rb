require_relative './commands'
require_relative './messages'
require_relative './validate_input'

class GetInput
  include Commands, Messages
  attr_reader :new_guess

  def initialize(new_input)
    @new_guess = new_input
    @validator = ValidateInput.new
  end

  def get_guess
    get_input_message
    @new_guess = gets.chomp.downcase.gsub(/[\W]/, "")
    leave if @new_guess == "quit"
    get_guess if @validator.length_error(new_guess) || @validator.color_error(new_guess)
    @new_guess.split(//)
  end

end