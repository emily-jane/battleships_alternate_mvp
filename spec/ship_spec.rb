require 'ship'

describe Ship do
	
	it "should have a default length of 2" do
		expect(subject.length).to eq Ship::DEFAULT_LENGTH
	end

	it "should not accept length below 2" do
		expect{Ship.new(1)}.to raise_error "Length must be between 2 and 5"
	end

	it "should not accept length above 5" do
		expect{Ship.new(6)}.to raise_error "Length must be between 2 and 5"
	end
end