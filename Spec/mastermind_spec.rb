require 'mastermind'

RSpec.describe Mastermind, "welcome user and show game commands" do
  mastermind = Mastermind.new
 
  it "greets the player with game instructions " do
    expect { mastermind.show_instructions }.to output(/Welcome/).to_stdout
  end
end 

RSpec.describe Code, "creates a code" do
  code = Code.new
 
let(:colors)  { ['r', 'g', 'o', 'b', 'y', 'p'] }

  it "generates a 4 digit code" do
    expect(code.generate_code.size).to eq 4
  end

   it "only generates code from available colors" do
    expect(code.generate_code).to include colors.sample(4)	
  end
end

RSpec.describe Response, "receive valid input" do
  response = Response.new
 
  it "prompts user to enter a guess" do
    expect { response.ask_for_input }.to output("Please enter a guess in the following format: ****\nRemember, the avialble colors are Red(r), Green(g), Orange(o), Blue(b), Yellow(y) and Purple(p)").to_stdout	
  end

  it "validates input" do
    expect { response.receive_valid_input }.to eq __	
  end
end