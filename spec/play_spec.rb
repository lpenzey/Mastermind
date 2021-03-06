# frozen_string_literal: true

require 'play'

RSpec.describe Play, 'welcome user and show game commands' do
  let(:mastermind) { Play.new }

  xit 'greets the player with game instructions ' do
    expect { mastermind.show_instructions }.to output(/Welcome/).to_stdout
  end
end
