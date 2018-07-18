class CompareCode

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

  def won?(red_pins)
   true if red_pins == [1, 1, 1, 1]
  end

end