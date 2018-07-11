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

	def lost_message
	  	puts "Better luck next time!"
	end 

	def remaining_guesses(guess)
		puts "(#{10-guess} guesses remaining)\n\n" 
	end

def show_instructions
    puts "Welcome to Mastermind! Your challenge is
to guess the secret four digit code in under 10 tries."
    puts ""
    puts "The code can include the following colors:
Red(r), Green(g), Orange(o), Blue(b), Yellow(y) and Purple(p)
Enter your guess by entering four color values from above, such as rgyb or pggy."
    puts ""
    puts "If you have a correct color in the right position, you get a red pin.
If you have a correct color in the wrong position, you get a white pin"
    puts ""
    puts 'type \'quit\' at any time to quit/restart, or hit enter to continue.'
  end

end