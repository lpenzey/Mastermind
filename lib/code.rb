class Code

CODE_LENGTH = 1..4
COLOR_BANK = 6
COLORS = ["r", "o", "y", "g", "b", "p"]
  
	def generate_code
    answer = (CODE_LENGTH).map { COLORS[rand(COLOR_BANK)] }
  end
end