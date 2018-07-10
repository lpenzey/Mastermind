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

  def save
    puts "Thanks for saving!"
  end 
end
