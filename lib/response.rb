require_relative './commands'

class Response
  include Commands
  attr_reader :player_input

  def initialize(new_input)
    @valid_guess = false
    @player_input = new_input
  end

  def get_input
    puts "Please enter a guess [****]"
    @player_input = gets.chomp.downcase.gsub(/[\W]/, "")
    leave if @player_input == "quit"
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