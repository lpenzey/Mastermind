require_relative './code'
require_relative './play'
require_relative './response'
require_relative './commands'

def main
  game = Play.new
  game.show_instructions
  game.loop
end 

if __FILE__ == $0
  main
end