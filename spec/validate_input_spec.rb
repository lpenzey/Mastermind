# frozen_string_literal: true

require 'validate_input'

RSpec.describe ValidateInput, 'takes user input and gives feedback' do
  let(:validator) { ValidateInput.new }

  describe '#valid_colors?' do
    it 'validates incorrect color choices' do
      new_guess = 'rxopp'
      expect(validator.valid_colors?(new_guess)).to be false
    end

    it 'validates correct color choices' do
      new_guess = 'ropp'
      expect(validator.valid_colors?(new_guess)).to be true
    end
  end

  describe '#valid_length?' do
    it 'validates incorrect choice of length' do
      new_guess = 'rrrrrrrr'
      expect(validator.valid_length?(new_guess)).to be false
    end

    it 'validates correct choice of length' do
      new_guess = 'rrrr'
      expect(validator.valid_length?(new_guess)).to be true
    end
  end
end
