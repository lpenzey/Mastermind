require_relative './messages'

module Commands
  include Messages
  MASTERMIND = 'execute.rb'
  def leave
      quit_options
        answer = gets.chomp.downcase
        case answer 
          when "y"
            abort("Thanks for playing!")
          when "r"
            system "clear"
            load MASTERMIND
          when "s"
            save
          else
            puts "I don't understand"
        end
  end

  def restart
        restart_options
        if gets.chomp.downcase == "r"
          system "clear"
          load MASTERMIND
        else
          abort("Thanks for playing!")
        end
  end
  
  def save
    puts "Thanks for saving!"
  end 
end