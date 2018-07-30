# frozen_string_literal: true

require 'compare_code'

RSpec.describe CompareCode, 'creates and compares code with guess' do
  let(:code) { CompareCode.new }

  describe '#red_counter' do
    it 'returns number of red pins' do
      key   = %w[r r r r]
      input = %w[r r r r]
      expect(code.red_counter(key, input)).to eq 4
    end

    it 'returns number of red pins' do
      key   = %w[r r y b]
      input = %w[r r p o]
      expect(code.red_counter(key, input)).to eq 2
    end
  end

  describe '#trim' do
    it 'deletes input position if it is the same as key index' do
      key   = %w[r g y r]
      input = %w[r o b r]
      expect(code.trim(key, input)).to eq ['', 'o', 'b', '']
    end

    it 'deletes input position if it is the same as key index' do
      key   = %w[y b p o]
      input = %w[y b p r]
      expect(code.trim(key, input)).to eq ['', '', '', 'r']
    end
  end

  describe '#white_counter' do
    it 'accurately counts white pins' do
      key   = %w[y b y r]
      input = ['', 'y', 'b', '']
      expect(code.white_counter(key, input)).to eq 2
    end

    it 'accurately counts white pins with duplicates' do
      key   = %w[b y y b]
      input = ['b', '', '', '']
      expect(code.white_counter(key, input)).to eq 1
    end

    it 'accurately counts white pins with no matches' do
      key   = %w[g g r r]
      input = %w[r r g g]
      expect(code.white_counter(key, input)).to eq 4
    end

    it 'accurately counts white pins with duplicates' do
      key   = %w[b g r g]
      input = ['r', '', 'b', '']
      expect(code.white_counter(key, input)).to eq 2
    end
  end
end
