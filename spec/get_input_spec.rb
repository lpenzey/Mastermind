require 'get_input'

RSpec.describe GetInput, "receives valid user input" do
  	let(:user) { GetInput.new }

  	describe "#get_guess" do 
  		context "when input is invalid" do
	  		it "loops back to #get_guess" do 
	  			allow(user).to receive(:gets).and_return('rroo')
			  	expect(user).to receive(:get_guess)
			  	user.get_guess
			end
		end

		context "when input is valid" do
	  		xit "converts input to array" do 
	  			allow(user).to receive(:gets).and_return('bbbb')
			  	expect(user).to eq(["b", "b", "b", "b"])
			  	user.get_guess
			end
		end
	end
end
