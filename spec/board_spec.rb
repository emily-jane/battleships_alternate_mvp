require 'board'

describe Board do
	let(:ship) { double :ship, length: 2 }
	let(:start_point) { double :start_point }


	it 'responds to place with 1 argument' do
		expect(subject).to respond_to(:place).with(3).argument
	end

	it "board should include ships" do
		subject.place(ship, "A1", :E)
		expect(subject.ships.keys).to include ship
	end

	it "should generate cell locations from start_point" do
		subject.place(ship, "A1", :E)
		expect(subject.ships.values).to include ["A1", "A2"]
	end

	it "should raise error when front of ship goes off board" do
		expect{ subject.place(ship, "J10", :E) }.to raise_error "Ship can't be placed off board"
	end

	it "should raise error if ships overlap" do
		east_ship = double :ship, length: 3
		subject.place(ship,"D6", :E)
		expect{ subject.place(east_ship,"D6", :E) }.to raise_error "Ships cannot overlap"
	end

	it "should have a default imaginary grid size" do
		expect(subject.size).to eq Board::DEFAULT_SIZE
	end

	# it "should have a default direction" do
	# 	expect(subject.direction).to eq Board::DEFAULT_DIRECTION
	# end

	it "direction should be N, E, W or S" do
		expect{ subject.place(ship,"D6", :K) }.to raise_error "Please enter :N, :S, :E or :W"
	end

end