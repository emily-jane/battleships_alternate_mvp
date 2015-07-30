require_relative 'board'
require_relative 'ship'

class Player

	attr_reader :hits, :misses

	def initialize
		@hits = []
		@misses = []
	end

	def fire(coordinates)
		if Board.hits?(coordinates)
			@hits << coordinates
		else
			@misses << coordinates
		end
	end
end