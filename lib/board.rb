require_relative 'numeric'

class Board

	DEFAULT_SIZE = 10

	attr_reader :ships, :size

	def initialize(size = DEFAULT_SIZE)
		@ships = {}
		@size = size
	end

	def place(ship, start_point)
		start_array = start_point.scan(/\d+|\D+/)
		number = start_array[1].to_i
		letter = start_array[0].upcase
		location = [start_point.upcase]
		fail "Ship can't be placed off board" if number < 1
		(ship.length - 1).times do
			if ship.direction == :horizontal
				number += 1
				fail "Ship can't be placed off board" if number > @size
				location << "#{letter}#{number}"
			else
				letter = letter.next
				fail "Ship can't be placed off board" if letter > @size.alphabet.upcase
				location << "#{letter}#{number}"
			end
		end

		if @ships == {}
			@ships.merge!(ship => location)
		else
			@ships.values.each do |co_ords|
				if (co_ords & location) == []
					@ships.merge!(ship => location)
				else		
					fail "Ships cannot overlap"
				end
			end
		end
			
	end
end


