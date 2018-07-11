require "commands"

RSpec.describe Commands, "lets user quit or restart or save" do
	let(:commands) { Class.new { extend Commands } }

	describe "#leave" do 
	  xit "quits game when user enters \"y\"" do
	  	answer = "y"
	    expect(commands.leave).to eq 1
	  end
	end
end