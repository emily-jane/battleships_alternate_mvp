require_relative 'board'
require_relative 'ship'

class Player

	attr_reader :hits, :misses, :prev_targets

	def initialize
		@hits = []
		@misses = []

		@prev_targets = []
		# @board
	end

	def fire(board, coordinates)
		fail "ALREADY TARGETED THERE" if @prev_targets.include?(coordinates)
		if board.check_on_board(coordinates) == true
			@hits << coordinates
			@prev_targets << coordinates
		else 
			@misses << coordinates
			@prev_targets << coordinates
		end
			board.check_game_won
	end
end