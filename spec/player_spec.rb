require 'player'
require 'ship'

describe Player do
	it "should respond to fire" do
		expect(subject).to respond_to(:fire).with(1).argument
	end
	it "should fire to a co-ordinate on the board" do
	end
	it "hits a ship if it's on the board" do
		ship = Ship.new
		board = Board.new
		board.place(ship,"A2", :E)
		subject.fire("A3")
		expect(subject.hits).to include "A3"
	end
	it "misses a ship if it's not on the board" do
	end
end