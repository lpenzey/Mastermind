require "response"
require "commands"

RSpec.describe Response, "takes user input and gives feedback" do
  let(:response) { Response.new("rxopp") }

  it "validates color choices" do
    expect(response.valid_colors?).to be_nil
  end

  it "returns invalid color message" do
    expect { response.color_error }.to output(/Invalid colors/).to_stdout
  end

  it "validates choice of length" do 
    expect(response.valid_length?).to be false
  end
end