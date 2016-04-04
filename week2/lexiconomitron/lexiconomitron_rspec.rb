require "rspec"
require "./lexiconomitron"

describe Lexiconomitron do

	before :each do
		@lexi = Lexiconomitron.new
	end

  describe "eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "shazam" do
    it "reverses the letters and returns first and last strings in an array" do
  	 expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
    end
  end

  describe "oompa" do
    it "returns an array with only words containing three or fewer characters" do
  	 expect(@lexi.oompa(["if", "you", "wanna", "be", "my", "lover"])).to eq(["if", "you", "be", "my"])
    end

    it "returns words with fewer than three characters, deleting all t's" do
  	 expect(@lexi.oompa(["if", "tot", "kit", "to", "my", "lover"])).to eq(["if", "o", "ki", "o", "my"])
    end
  end

end	

