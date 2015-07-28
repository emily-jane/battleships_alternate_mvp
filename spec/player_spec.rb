require 'player'

describe Player do
	it "should respond to fire" do
		expect(subject).to respond_to(:fire).with(1).argument
	end
end