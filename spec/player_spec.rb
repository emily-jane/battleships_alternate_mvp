require 'player'
require 'ship'

describe Player do
	it "should respond to fire" do
		expect(subject).to respond_to(:fire).with(2).argument
	end

	it "hits a ship if it's on the board" do
		ship = Ship.new
		board = Board.new
		board.place(ship,"A2", :E)
		subject.fire(board, "A3")
		expect(subject.hits).to eq ["A3"]
	end

	it "misses a ship if it's not on the board" do
		ship = Ship.new
		board = Board.new
		board.place(ship,"A2", :E)
		subject.fire(board, "D3")
		expect(subject.misses).to eq ["D3"]
	end

	it "should raise error if firing at same target again" do
		ship = Ship.new
		board = Board.new
		board.place(ship,"A2", :E)
		subject.fire(board, "A2")
		expect{ subject.fire(board, "A2") }.to raise_error "ALREADY TARGETED THERE"
	end
end