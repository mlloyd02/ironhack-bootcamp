require "rspec"
require "./string_calculator"

RSpec.describe "add method" do

	before :each do
		@calc = StringCalculator.new
	end

	it "should return 0 for an empty string" do
		expect(@calc.add("")).to eq(0)	
	end

	it "returns 2 when only that number" do
		expect(@calc.add(2)).to eq(2)	
	end

	it "returns a Fixnum when a string is passed" do
		expect(@calc.add("John")).to be_a_kind_of(Fixnum)	
	end

	it "should retrun 10 when passing 4,1 and 5" do
		expect(@calc.add("4,1,5")).to eq(10)
	end

	it "should return 16 when passing 4, 4, 4 and 4" do
		expect(@calc.add("4,4,4,4")).to eq(16)
	end

end