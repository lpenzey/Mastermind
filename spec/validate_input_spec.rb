require "validate_input"
require "commands"

RSpec.describe ValidateInput, "takes user input and gives feedback" do
  let(:validator) { ValidateInput.new }
  let(:new_guess) { "rxopp" }

  it "validates color choices" do
    expect(validator.valid_colors?(new_guess)).to be_nil
  end

  it "returns invalid color message" do
    expect { validator.color_error(new_guess) }.to output(/Invalid colors/).to_stdout
  end

  it "validates choice of length" do 
    expect(validator.valid_length?(new_guess)).to be false
  end
end