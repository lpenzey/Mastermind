module Messages
  
	def quit_options
		puts "Are you sure you want to quit?(y/n). You can also enter \"r\" to restart. Your progress has been automatically saved"
 	end 

	def restart_options
  		puts "Would you like to quit or restart? Type \"q\" to quit or \"r\" to restart."
	end

	def won_message
		puts "Congratulations, you've cracked the code!"
	end

	def lost_message(secret)
	  	puts "Better luck next time! The secret code was #{secret.to_s}"
	end 

	def remaining_guesses_message(turn)
		puts "(#{10-turn} guesses remaining)\n\n" 
	end

	def invalid_length_message
		puts "Invalid length, please enter exactly 4 colors"
	end

	def invalid_color_message
		puts "Invalid colors, please enter only available colors: r, g, o, y, b, p."
	end

	def get_input_message
	  	puts "Please enter a guess from the available letters (rgobyp):"
	end

	def saved_game_message
		puts "There appears to be a saved game. Would you like to load? \"y\" for yes or \"n\" to start a fresh game"
	end

	def display_previous_guesses(previous_guesses, turn)
		system("clear")
		puts "Your previous guesses were:" 
		guess = 0
		red_pins = 1
		white_pins = 2
		(previous_guesses.length/3).times do
			puts "#{previous_guesses[guess].join} = #{previous_guesses[red_pins]} red pins and #{previous_guesses[white_pins]} white pins"
			guess += 3
			red_pins += 3
			white_pins += 3
		end
		remaining_guesses_message(turn)
	end

	def show_instructions
	  puts "Welcome to Mastermind! Your challenge is
to guess the secret four digit code in under 10 tries.\n\n
The code can include the following colors:
Red(r), Green(g), Orange(o), Blue(b), Yellow(y) and Purple(p)\n\n
Enter your guess by entering four color values from above, such as rgyb or pggy.
If you have a correct color in the right position, you get a red pin.\n\n
If you have a correct color in the wrong position, you get a white pin
type \'quit\' at any time to quit/restart. Your progress is automatically saved.\n\n"
	 end
end

