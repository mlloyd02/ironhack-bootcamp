require "rspec"
require "./fizz_buzz"

RSpec.describe "add method" do

	before :each do
		@calc = FizzBuzz.new
	end

	it "should return FizzBuzz when passed 0" do
		expect(@calc.answer(0)).to eq("FizzBuzz")	
	end

	it "should return 1 when passed 1" do
		expect(@calc.answer(1)).to eq(1)
	end

	it "should return Fizz when passed 3" do
		expect(@calc.answer(3)).to eq("Fizz")
	end

	it "should return Buzz when passed 5" do
		expect(@calc.answer(5)).to eq("Buzz")
	end

	it "should return FizzBuzz when passed 15" do
		expect(@calc.answer(15)).to eq("FizzBuzz")
	end

end