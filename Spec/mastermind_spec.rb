require "mastermind"

RSpec.describe Mastermind, "welcome user and show game commands" do
  mastermind = Mastermind.new

  it "greets the player with game instructions " do
    expect { mastermind.show_instructions }.to output(/Welcome/).to_stdout
  end
end

RSpec.describe Code, "creates a code" do
  code = Code.new

  let(:colors) { ["r", "g", "o", "b", "y", "p"] }

  it "generates a 4 digit code" do
    expect(code.generate_code.size).to eq 4
  end

  it "only uess values from available colors" do
    code.generate_code.each do |char|
      expect(["r", "g", "o", "b", "y", "p"].include?(char)).to eq(true)
    end
  end
end

RSpec.describe Response, "receive valid input" do
  response = Response.new

  it "ensures there are only 4 letters entered" do
    expect { response.validate_length("abcf") }.to output("Invalid response, please enter exactly 4 colors\n").to_stdout
  end
end
