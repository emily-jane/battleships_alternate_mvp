require 'board'

describe Board do
	it 'responds to place with 1 argument' do
		expect(subject).to respond_to(:place).with(1).argument
	end
end