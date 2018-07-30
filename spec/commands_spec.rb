# frozen_string_literal: true

require 'commands'

RSpec.describe Commands, 'lets user quit or restart or save' do
  let(:commands) { Commands.new }

  describe '#leave' do
    context 'when input is y' do
      it 'quits game' do
        allow(commands).to receive(:gets).and_return('y')
        expect(commands).to receive(:abort)
        commands.leave
      end
    end

    context 'when input is r' do
      it 'loads new game' do
        allow(commands).to receive(:gets).and_return('r')
        expect(commands).to receive(:system)
        commands.leave
      end
    end

    context 'when input is not y, r, or s' do
      it 'does not end the game' do
        allow(commands).to receive(:gets).and_return('home run derby')
        expect(commands).not_to receive(:abort)
        expect(commands).not_to receive(:system)
        commands.leave
      end
    end
  end

  describe '#restart' do
    context 'when input is r' do
      it 'loads new game' do
        allow(commands).to receive(:gets).and_return('r')
        expect(commands).to receive(:system)
        commands.restart
      end
    end

    context 'when input is not y, r, or s' do
      it 'does not end the game' do
        allow(commands).to receive(:gets).and_return('home run derby')
        expect(commands).to receive(:abort)
        commands.restart
      end
    end
  end
end
