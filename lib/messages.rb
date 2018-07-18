module Messages
  
	def quit_options
	    puts "Are you sure you want to quit? Type \"y\" to quit or \"r\" to restart or \"s\" to save your game."
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

	def remaining_guesses(turn)
		puts "(#{10-turn} guesses remaining)\n\n" 
	end

	def invalid_length_message
		puts "Invalid length, please enter exactly 4 colors"
	end

	def get_input_message
	    puts "Please enter a guess from the available letters (rgobyp):"
	end

	def feedback_message(white_pins, red_pins)
    	puts "You have #{red_pins.length} red pins and #{white_pins.length} white pins."
  	end

	def show_instructions
	    puts "Welcome to Mastermind! Your challenge is
to guess the secret four digit code in under 10 tries.\n\n
The code can include the following colors:
Red(r), Green(g), Orange(o), Blue(b), Yellow(y) and Purple(p)\n\n
Enter your guess by entering four color values from above, such as rgyb or pggy.
If you have a correct color in the right position, you get a red pin.\n\n
If you have a correct color in the wrong position, you get a white pin
type \'quit\' at any time to quit/restart.\n\n"
	  end

end