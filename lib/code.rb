# frozen_string_literal: true

class Code
  CODE_LENGTH = 1..4
  COLOR_BANK = 6
  COLORS = %w[r o y g b p].freeze

  def generate_code
    answer = CODE_LENGTH.map { COLORS[rand(COLOR_BANK)] }
   end
end
