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

	it "should have a default direction" do
		expect(subject.direction).to eq Ship::DEFAULT_DIRECTION
	end

	# it "direction should be N, E, W or S" do
	# 	invalid_direction = [:A, :B, :C, :D, :F, :G, :H, :I, :J, :K, :L, :M, :N, :O, :P, :Q, :R, :T, :U, :V, :W, :X, :Y, :Z]
	# 	expect{invalid_direction.include?(subject.direction)}.to raise_error "Invalid direction"
	# end

end