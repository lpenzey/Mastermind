require "mastermind"

RSpec.describe Welcome, "welcome user and show game commands" do
  let(:mastermind) { Welcome.new }

  it "greets the player with game instructions " do
    expect { mastermind.show_instructions }.to output(/Welcome/).to_stdout
  end
end

RSpec.describe Code, "creates and compares code with guess" do
  let(:code) { Code.new }
  let(:colors) { ["r", "g", "o", "y", "b", "p"] }

  describe "#generate_code" do
    it "generates a 4 digit code" do
      expect(code.generate_code.size).to eq 4
    end

    it "only guess values from available colors" do
      code.generate_code.each do |char|
        expect(["r", "g", "o", "b", "y", "p"].include?(char)).to eq(true)
      end
    end
  end

  describe "#red_counter" do
    it "returns number of red pins" do
      key   = ["r", "r", "r", "r"]
      input = ["r", "r", "r", "r"] 
      expect(code.red_counter(key, input)).to eq [1, 1, 1, 1]
    end

    it "returns number of red pins" do
      key   = ["r", "r", "y", "b"]
      input = ["r", "r", "p", "o"] 
      expect(code.red_counter(key, input)).to eq [1, 1]
    end
  end 

  describe "#trim" do 
    it "deletes input position if it is the same as key index" do
      key   = ["r", "g", "y", "r"]
      input = ["r", "o", "b", "r"] 
      expect(code.trim(key, input)).to eq ["", "o", "b", ""]
    end

    it "deletes input position if it is the same as key index" do
      key   = ["y", "b", "p", "o"]
      input = ["y", "b", "p", "r"] 
      expect(code.trim(key, input)).to eq ["", "", "", "r"]
    end
  end

  describe "#white_counter" do
    it "accurately counts white pins" do
      key   = ["y", "b", "y", "r"]
      input = ["", "y", "b", ""] 
      expect(code.white_counter(key, input)).to eq ["y", "b"]
    end

    it "accurately counts white pins with duplicates" do
      key   = ["b", "y", "y", "b"]
      input = ["b", "", "", ""] 
      expect(code.white_counter(key, input)).to eq ["b"]
    end

    it "accurately counts white pins with no matches" do
      key   = ["g", "g", "r", "r"]
      input = ["r", "r", "g", "g"] 
      expect(code.white_counter(key, input)).to eq ["g", "g", "r", "r"]
    end
  
    let(:key) { ["b", "g", "r", "g"] }
    let(:input) { ["r", "", "b", ""] }

    it "accurately counts white pins with duplicates" do
      expect(code.white_counter(key, input)).to eq ["b", "r"]
    end
  end

  describe "#feedback" do
    let(:key) { ["y", "b", "p", "o"] }
    let(:input) { ["y", "b", "p", "r"] }
    let(:white_pins) { [1, 1] }
    let(:red_pins) { [1, 1] }

    it "gives pin feedback to user" do
      expect { code.feedback(white_pins, red_pins)}.to output("You have #{red_pins.length} red pins and #{white_pins.length} white pins.\n").to_stdout
    end
  end
end

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

  it "returns invalid length message" do 
    expect { response.length_error }.to output(/Invalid length/).to_stdout
  end

  it "quits the game if \"quit\" is entered" do
    response = Response.new("quit")
    expect{ response.leave }.to output(/Are you sure you want to quit?/).to_stdout
  end
end