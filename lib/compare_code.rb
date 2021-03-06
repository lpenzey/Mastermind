# frozen_string_literal: true

require_relative './messages'

class CompareCode
  include Messages

  def red_counter(key, input)
    red_pins = 0
    position = 0
    while input.length > position
      key.each do |_match|
        red_pins += 1 if key[position] == input[position]
        position += 1
      end
    end
    red_pins
  end

  def trim(key, input)
    4.times do |n|
      if input[n] == key[n]
        input[n] = ''
        key[n] = ''
      end
    end
    input
  end

  def white_counter(key, input)
    white_pins = (key & input)
                 .flat_map { |n| [n] * [key.count(n), input.count(n)].min }
                 .reject(&:empty?)
    white_pins = white_pins.size
  end

  def feedback(white_pins, red_pins, previous_guesses)
    feedback_message(white_pins, red_pins, previous_guesses)
  end

  def won?(red_pins)
    red_pins == 4
  end

  def white_pins(secret, guess)
    key = secret.clone
    input = guess.clone
    trim(key, input)
    white_pins = white_counter(key, input)
  end
end
