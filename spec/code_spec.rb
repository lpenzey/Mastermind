# frozen_string_literal: true

require 'code'

RSpec.describe Code, 'creates and compares code with guess' do
  let(:code) { Code.new }
  let(:colors) { %w[r g o y b p] }

  describe '#generate_code' do
    it 'generates a 4 digit code' do
      expect(code.generate_code.size).to eq 4
    end

    it 'only guess values from available colors' do
      code.generate_code.each do |char|
        expect(%w[r g o b y p].include?(char)).to eq(true)
      end
    end
  end
end
