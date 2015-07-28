require_relative 'numeric'

class Board

	attr_reader :ships

	def initialize
		@ships = {}

	end

	def place(ship, start_point)
		start_array = start_point.scan(/\d+|\D+/)
		number = start_array[1].to_i
		letter = start_array[0].upcase
		location = [start_point.upcase]
		fail "Ship can't be placed off board" if number < 1
		(ship.length - 1).times do
			if ship.direction == :E 
				number += 1
				fail "Ship can't be placed off board" if number > 10
				location << "#{letter}#{number}"
			else
				letter = letter.next
				fail "Ship can't be placed off board" if letter > 10.alphabet.upcase
				location << "#{letter}#{number}"
			end
		end
		@ships.merge!(ship => location)
	end

	# 	cell_start = start_point[0] + ((start_point[1] - 1) * 10)
	# 	location = [cell_start]
	# 	(ship.length - 1).times do
	# 		ship.direction == :E ? (cell_start += 1) : (cell_start += 10)
	# 		location << cell_start
	# 	end
	# 	fail "Ship can't be placed off board" if location.any? { |x| x > 100 || x < 1 }
	# 	@ships.merge!(ship => location)
	# end
end


