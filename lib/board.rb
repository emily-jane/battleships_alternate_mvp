require_relative 'numeric'

class Board

	DEFAULT_SIZE = 10

	attr_reader :ships, :size, :direction, :location

	def initialize(size = DEFAULT_SIZE)
		@ships = []
		@size = size
	end

	def place(ship, start_point, direction)

		all_positions(ship, start_point, direction)

		if ships == []
			ships << location
		else
			count = 0
			ships.each do |co_ords|
				if (co_ords & location) != []
					count += 1
				end
			end
				if count == 0
					ships << location
				else
					fail "Ships cannot overlap"
				end
			ships
		end
	end

	def all_positions(ship, start_point, direction)
		start_array = start_point.scan(/\d+|\D+/)
		number = start_array[1].to_i
		letter = start_array[0].upcase
		location = [start_point.upcase]
		fail "Ship can't be placed off board" if number < 1
		(ship.length - 1).times do
			if direction == :E
				number += 1
				fail "Ship can't be placed off board" unless on_grid?(number)
				location << "#{letter}#{number}"
			elsif direction == :S
				letter = letter.next
				fail "Ship can't be placed off board" unless on_grid?(letter)
				location << "#{letter}#{number}"
			elsif direction == :W
				number -= 1
				fail "Ship can't be placed off board" unless on_grid?(number)
				location << "#{letter}#{number}"
			elsif direction == :N
				#letter = letter.next NEEED TO FINISH THIS!!!!!!
				fail "Ship can't be placed off board" unless on_grid?(letter)
				location << "#{letter}#{number}"
			else fail "Please enter :N, :S, :E or :W"
			end
		end
		@location = location
	end

	def on_grid?(position)
		if position.is_a? String
			if ('A'..@size.alphabet.upcase).include?(position)
				true
			else
				false
			end
		elsif position.is_a? Integer
			if (1..@size).include?(position)
				true
			else
				false
			end
		end
	end

end


