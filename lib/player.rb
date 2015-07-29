require_relative 'board'

class Player

	attr_reader :hits, :misses

	def initialize
		@hits = []
		@misses = []
	end

	def fire(coordinates)
		@ships.each do |ship|
			if (ship & coordinates.to_a) == []
				@misses << coordinates
			else
				@hits << coordinates
			end
		end
	end
end