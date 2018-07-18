require_relative './get_input'

class ValidateInput

  def valid_length?
    @new_guess.length == 4
  end

  def length_error(new_guess)
    return false if valid_length?
    invalid_length_message
    true
  end

  def valid_colors?(new_guess)
    true if /\A[rgobyp][rgobyp][rgobyp][rgobyp]\z/.match(@new_guess.to_s)
  end

  def color_error(new_guess)
    return false if valid_colors?
    puts "Invalid colors, please enter only available colors: r, g, o, y, b, p."
    true
  end

end