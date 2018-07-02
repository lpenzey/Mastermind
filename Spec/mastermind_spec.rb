require "mastermind"

RSpec.describe Welcome, "welcome user and show game commands" do
  let(:mastermind) { Welcome.new }

  it "greets the player with game instructions " do
    expect { mastermind.show_instructions }.to output(/Welcome/).to_stdout
  end
end

RSpec.describe Code, "creates a code" do
  let(:code) { Code.new }
  let(:colors) { ["r", "g", "o", "y", "b", "p"] }

  it "generates a 4 digit code" do
    expect(code.generate_code.size).to eq 4
  end

  it "only guess values from available colors" do
    code.generate_code.each do |char|
      expect(["r", "g", "o", "b", "y", "p"].include?(char)).to eq(true)
    end
  end
end

RSpec.describe Code, "compares guess with secret_key" do
  let(:code) { Code.new }
  let(:colors) { ["r", "g", "o", "y", "b", "p"] }
  let(:key) { ["r", "r", "r", "r"] }
  let(:input) { ["r", "r", "r", "r"] }

  it "returns number of red pins" do
    expect(code.red_counter(key, input)).to eq [1, 1, 1, 1]
  end
end

RSpec.describe Code, "compares guess with secret_key" do
  let(:code) { Code.new }
  let(:colors) { ["r", "g", "o", "y", "b", "p"] }
  let(:key) { ["r", "r", "y", "b"] }
  let(:input) { ["r", "r", "p", "o"] }

  it "returns number of red pins" do
    expect(code.red_counter(key, input)).to eq [1, 1]
  end
end

RSpec.describe Code, "trims code" do
  let(:code) { Code.new }
  let(:key) { ["r", "g", "y", "r"] }
  let(:input) { ["r", "o", "b", "r"] }

  it "deletes input position if it is the same as key index" do
    expect(code.trim(key, input)).to eq ["", "o", "b", ""]
  end
end

RSpec.describe Code, "trims code" do
  let(:code) { Code.new }
  let(:key) { ["y", "b", "p", "o"] }
  let(:input) { ["y", "b", "p", "r"] }

  it "deletes input position if it is the same as key index" do
    expect(code.trim(key, input)).to eq ["", "", "", "r"]
  end
end

RSpec.describe Code, "counts white pins" do
  let(:code) { Code.new }
  let(:key) { ["y", "b", "y", "r"] }
  let(:input) { ["", "y", "b", ""] }

  it "accurately counts white pins" do
    expect(code.white_counter(key, input)).to eq ["y", "b"]
  end
end

RSpec.describe Code, "counts white pins" do
  let(:code) { Code.new }
  let(:key) { ["b", "y", "y", "b"] }
  let(:input) { ["b", "", "", ""] }

  it "accurately counts white pins with duplicates" do
    expect(code.white_counter(key, input)).to eq ["b"]
  end
end

RSpec.describe Code, "counts white pins" do
  let(:code) { Code.new }
  let(:key) { ["g", "g", "r", "r"] }
  let(:input) { ["r", "r", "g", "g"] }

  it "accurately counts white pins with duplicates" do
    expect(code.white_counter(key, input)).to eq ["g", "g", "r", "r"]
  end
end

RSpec.describe Code, "counts white pins" do
  let(:code) { Code.new }
  let(:key) { ["b", "g", "r", "g"] }
  let(:input) { ["r", "", "b", ""] }

  it "accurately counts white pins with duplicates" do
    expect(code.white_counter(key, input)).to eq ["b", "r"]
  end
end

RSpec.describe Code, "feedback" do
  let(:code) { Code.new }
  let(:key) { ["y", "b", "p", "o"] }
  let(:input) { ["y", "b", "p", "r"] }
  let(:white_pins) { [1, 1] }
  let(:red_pins) { [1, 1] }

  it "gives pin feedback to user" do
    expect { code.feedback(white_pins, red_pins)}.to output("You have " + red_pins.length.to_s + " red pins and " + white_pins.length.to_s + " white pins. Keep going!").to_stdout
  end
end

RSpec.describe Response, "validate input length" do
  let(:response) { Response.new("rgo") }

  it "validates length" do
    expect(response.valid_length?).to eq(false)
  end

  it "returns invalid input message" do
    expect { response.length_error }.to output(/Invalid length/).to_stdout
  end
end

RSpec.describe Response, "validate input colors" do
  let(:response) { Response.new("rxop") }

  it "validates color choices" do
    expect(response.valid_colors?).to be_nil
  end

  it "returns invalid color message" do
    expect { response.color_error }.to output(/Invalid colors/).to_stdout
  end
end
