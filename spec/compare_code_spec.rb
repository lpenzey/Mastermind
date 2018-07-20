require "compare_code"

RSpec.describe CompareCode, "creates and compares code with guess" do
  let(:code) { CompareCode.new }

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

    it "accurately counts white pins with duplicates" do
      key   = ["b", "g", "r", "g"]
      input = ["r", "", "b", ""] 
      expect(code.white_counter(key, input)).to eq ["b", "r"]
    end
  end
end