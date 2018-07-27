require_relative './code'
require_relative './compare_code'

class ComputerPlayer

	def initialize(cc = CompareCode)
		@combos = Code::COLORS.repeated_permutation(4).to_a
		@compare = cc.new
		@secret = @combos.sample
	end

	# COMBOS = Code::COLORS.repeated_permutation(4).to_a

	# def initialize(key = COMBOS.sample, cc = CompareCode)
	# @possible_combos = COMBOS
	# @compare = cc.new
	# end

	def compare_code(key, guess)
		@compare.count_all(key, guess)
	end

	def play
		puts "Key: #{@key}"
		puts "Intial Length: #{@combos.length}"
		guesses = Code::COLORS.map { |c| Array.new(4, c) }
		pins_guessed = Array.new(6,0)
		guesses.length.times do |i|
			pins = compare_code(@secret, guesses[i])
			pins_guessed[i] = pins[0]
			update_combos_phase_one(guesses[i], pins[0])
			break if pins_guessed.sum == 4
		end
		guess = @combos[0]
		pins = compare_code(guess)
		update_combos_phase_two(guess,pins)
		puts "Updated Length: #{@combos.length}"
		puts "Pins Guessed: #{pins_guessed}"
		return @combos
	end

	def update_combos_phase_one(guess, red_pins)
		@combos.reject! { |code| compare_code(guess, code) != red_pins }
	end

	def update_combos_phase_two(guess, pins)
		if pins[0] == 0
			@combos.reject! do |code| 
				guess.length.times{ |i| @key[i] == code[i] }
			end
		elsif pins[0] == 1
			puts 'wrong'
		elsif pins[0] == 2
			puts 'bad'
		else
			abort 'You win!'
		end
	end
end

do_a_thing = ComputerPlayer.new
p do_a_thing.play