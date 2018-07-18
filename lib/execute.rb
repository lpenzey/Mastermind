require_relative './play'

def main
  game = Play.new
  game.show_instructions
  game.game_loop
  game.end_game
end 

if __FILE__ == $0
  main
end