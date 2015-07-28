class Board

	attr_reader :ships

	def initialize
		@ships = {}

	end

	def place(ship, start_point)
		cell_start = start_point[0] + ((start_point[1] - 1) * 10)
		location = [cell_start]
		(ship.length - 1).times do
			ship.direction == :E ? (cell_start += 1) : (cell_start += 10)
			location << cell_start
		end
		fail "Ship can't be placed off board" if location.any? { |x| x > 100 || x < 1 }
		@ships.merge!(ship => location)
	end
end

def east

end