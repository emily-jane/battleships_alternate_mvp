require 'board'

describe Board do
	let(:ship) { double :ship, length: 2, direction: :horizontal }
	let(:start_point) { double :start_point }


	it 'responds to place with 1 argument' do
		expect(subject).to respond_to(:place).with(2).argument
	end

	it "board should include ships" do
		start_point1 = "A1"
		subject.place(ship, start_point1)
		expect(subject.ships.keys).to include ship
	end

	it "should generate cell locations from start_point" do
		east_ship = double :ship, length: 3, direction: :horizontal
		subject.place(east_ship, "A1")
		expect(subject.ships.values).to include ["A1", "A2", "A3"]
	end

	it "should raise error when front of ship goes off board" do
		east_ship = double :ship, length: 3, direction: :horizontal
		expect{ subject.place(east_ship, "J10") }.to raise_error "Ship can't be placed off board"
	end

	it "should raise error if ships overlap" do
		east_ship = double :ship, length: 3, direction: :horizontal
		subject.place(ship,"D6")
		expect{ subject.place(east_ship,"D6") }.to raise_error "Ships cannot overlap"
	end

	it "should have a default imaginary grid size" do
		expect(subject.size).to eq Board::DEFAULT_SIZE
	end


end