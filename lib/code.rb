class Code

CodeLength = 1..4
ColorBank = 6
  
	def generate_code
    colors = ["r", "g", "o", "y", "b", "p"]
    answer = (CodeLength).map { colors[rand(ColorBank)] }
  end
end
