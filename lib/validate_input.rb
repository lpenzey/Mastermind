# frozen_string_literal: true

require_relative './get_input'
require_relative './messages'
require_relative './code'

class ValidateInput
  include Messages

  def valid_length?(new_guess)
    new_guess.length == 4
  end

  def length_error(new_guess)
    return false if valid_length?(new_guess)
    invalid_length_message
    true
  end

  def valid_colors?(new_guess)
    new_guess.chars.all? { |c| Code::COLORS.include?(c) }
  end

  def color_error(new_guess)
    return false if valid_colors?(new_guess)
    invalid_color_message
    true
  end
end
