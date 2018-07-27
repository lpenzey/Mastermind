require_relative "../lib/computer_player"

RSpec.describe ComputerPlayer, "determines correct answer in under 10 tries" do 
	let(:hal9000) {ComputerPlayer.new}

	describe "#play" do 
		context "when key is YYYY" do
			it "pins guessed is [0, 0, 4, 0, 0, 0]" do 				
				expect(hal9000('["y","y","y","y"]')).to eq('[0, 0, 4, 0, 0, 0]')
			end
		end
	end	
end