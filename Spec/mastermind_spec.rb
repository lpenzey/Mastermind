require "mastermind"

RSpec.describe Mastermind, "welcome user and show game commands" do
  let(:mastermind) { Mastermind.new }

  it "greets the player with game instructions " do
    expect { mastermind.show_instructions }.to output(/Welcome/).to_stdout
  end
end

RSpec.describe Code, "creates a code" do
  let(:code) { Code.new }
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
  let(:response) { Response.new("rgo") }

  it "validates length" do
    expect(response.valid_length?).to eq(true)
  end

  it "returns invalid input message" do
    expect { response.length_error }.to output(/Invalid length/).to_stdout
  end
end