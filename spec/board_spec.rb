require 'board'

describe Board do
	let(:ship) { double :ship, length: 2 }
	let(:start_point) { double :start_point }


	it 'responds to place with 3 arguments' do
		expect(subject).to respond_to(:place).with(3).argument
	end

	it "should raise error when front of ship goes off board" do
		expect{ subject.all_positions(ship, "J10", :E) }.to raise_error "Ship can't be placed off board"
	end

	it "can correctly calculate coordinates from size and direction" do
		expect(subject.all_positions(ship, "A1", :E)).to eq ["A1","A2"]
	end

	it "knows if a letter is not on the grid" do
		expect(subject.on_grid?("K")).to eq false
	end

	it "knows if a letter is on the grid" do
		expect(subject.on_grid?("A")).to eq true
	end

	it "knows if a number is not on the grid" do
		expect(subject.on_grid?(11)).to eq false
	end

	it "knows if a number is on the grid" do
		expect(subject.on_grid?(1)).to eq true
	end

	it "should raise error if ships overlap" do
		east_ship = double :ship, length: 3
		subject.place(ship,"D6", :E)
		expect{ subject.place(east_ship,"D6", :E) }.to raise_error "Ships cannot overlap"
	end

	it "should have a default imaginary grid size" do
		expect(subject.size).to eq Board::DEFAULT_SIZE
	end

	it "direction should be N, E, W or S" do
		expect{ subject.all_positions(ship,"D6", :K) }.to raise_error "Please enter :N, :S, :E or :W"
	end

	it "knows when the game is won" do
		b = Board.new
		ship = Ship.new
		b.place(ship,"A1",:E)
		player = Player.new
		player.fire(b,"A1")
		expect(player.fire(b,"A2")).to eq "YOU_WIN!!!!!!"
	end


end