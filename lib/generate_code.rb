require_relative './commands'

class Code
  include Commands
  attr_reader :red_pins, :white_pins
  
  CodeLength = 1..4
  ColorBank = 6
  
  def generate_code
    @colors = colors = ["r", "g", "o", "y", "b", "p"]
    @answer = (CodeLength).map { @colors[rand(ColorBank)] }
  end

  end