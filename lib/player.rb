require_relative 'board'
require_relative 'ship'

class Player

	attr_reader :hits, :misses

	def initialize
		@hits = []
		@misses = []

		@prev_targets = []
		# @board
	end

	def fire(board, coordinates)
		fail "ALREADY TARGETED THERE" if @prev_targets.include?(coordinates)
		if board.hits?(coordinates)
			@hits << coordinates
			@prev_targets<<coordinates
			else @misses << coordinates
				@prev_targets<<coordinates
			end
	end
end