require_relative './messages'

class MastermindRunner
  include Messages

  def initialize(play, code)
    @play = play
    @code = code
  end

  def execute
    @play.show_instructions
      if @play.find_saved_games?
        saved_game_message
        answer = gets.chomp.downcase
          if answer == "y"
            saved_game_state = @play.load_saved_games
            display_previous_guesses(saved_game_state["previous_guesses"], saved_game_state["turn"])
            saved_game_state["turn"] += 1
            @play.game_loop(saved_game_state["turn"], saved_game_state["previous_guesses"], saved_game_state["secret"])
            @play.end_game
          else
            nil
          end
      end
    @play.game_loop(1, [], @code.generate_code)
    @play.end_game 
  end
end
