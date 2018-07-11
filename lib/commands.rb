module Commands
  MASTERMIND = 'execute.rb'
  def leave
      puts "Are you sure you want to quit? Type \"y\" to quit or \"r\" to restart or \"s\" to save your game."
        answer = gets.chomp.downcase
        case answer 
          when "y"
            abort("Thanks for playing!")
          when "r"
            load MASTERMIND
          when "s"
            save
          else
            puts "I don't understand"
        end
  end

  def restart
    puts "Would you like to quit or restart? Type \"q\" to quit or \"r\" to restart."
        if gets.chomp.downcase == "r"
          load MASTERMIND
        else
          abort("Thanks for playing!")
        end
  end

 def show_instructions
    puts "
    Welcome to Mastermind! Your challenge is
    to guess the secret four digit code in under 10 tries.\n\n
    The code can include the following colors:
    Red(r), Green(g), Orange(o), Blue(b), Yellow(y) and Purple(p)
    Enter your guess by entering four color values from above, such as rgyb or pggy.\n\n
    If you have a correct color in the right position, you get a red pin.
    If you have a correct color in the wrong position, you get a white pin.\n\n
    type \'quit\' at any time to quit/restart, or hit enter to start."
    leave if gets.chomp.downcase == "quit"
    system "clear"
  end
end
