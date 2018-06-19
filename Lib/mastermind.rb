


class Mastermind

	attr_reader :colors

	def initialize
		@colors = ['r', 'g', 'o', 'b', 'y', 'p']
	end	

	def show_instructions	
		puts 'Welcome to Mastermind! Your challenge is to guess the secret 
four digit code in under 10 tries.
The code can include the following colors:
Red(r), Green(g), Orange(o), Blue(b), Yellow(y) and Purple(p)
Enter your guess by entering four color values from above, such as rgvb
If you have a correct color in a correct position, you get a white pin.
If you have a correct color in a different position, you get a black pin
press \'q\' to quit, or enter your first guess.'
	
	end
end

class Code

	def generate_code
		code = []
		4.times do |inject| 
			code << @colors.sample
		end
		code
	end
end	

class Response

	def ask_for_input
		print "Please enter a guess in the following format: ****\n"
		print "Remember, the avialble colors are Red(r), Green(g), Orange(o), Blue(b), Yellow(y) and Purple(p)"
	end	

	def receive_valid_input
		input = gets.chomp
		if input != :r
			puts "Invalid response, please "
		end
	end

end


