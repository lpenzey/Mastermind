require_relative './messages'
require_relative './play'

class Commands
include Messages

  def leave
    quit_options
      answer = gets.chomp.downcase
        case answer 
          when "y"
            abort("Thanks for playing!")
          when "r"
            system("clear && ruby execute.rb")
          when "s"
            save_game(turn, previous_gueses, secret)
          when "n"
            get_guess 
        end
  end

  def restart
    restart_options
      if gets.chomp.downcase == "r"
        system("clear && ruby execute.rb")
      else
        abort("Thanks for playing!")
      end
  end
end
