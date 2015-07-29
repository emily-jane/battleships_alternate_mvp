require_relative 'board'

class Player

	attr_reader :hits

	def initialize
		@hits = []
	end

	def fire(coordinates)
		@ships.values.each do |ship|
			if (ship & coordinates.to_a) == []
				@misses << coordinates
			else
				@hits << coordinates
			end
		end
	end
end