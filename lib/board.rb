require_relative 'numeric'

class Board

	DEFAULT_SIZE = 10
	#DEFAULT_DIRECTION = :E

	attr_reader :ships, :size, :direction

	def initialize(size = DEFAULT_SIZE) #direction = DEFAULT_DIRECTION)
		@ships = {}
		@size = size
		#@direction = direction
	end

	def place(ship, start_point, direction)
		#@direction = direction
		start_array = start_point.scan(/\d+|\D+/)
		number = start_array[1].to_i
		letter = start_array[0].upcase
		location = [start_point.upcase]
		fail "Ship can't be placed off board" if number < 1
		(ship.length - 1).times do
			if direction == :E
				number += 1
				fail "Ship can't be placed off board" unless (1..@size).include?(number)
				location << "#{letter}#{number}"
			elsif direction == :S
				letter = letter.next
				fail "Ship can't be placed off board" unless ('A'..@size.alphabet.upcase).include?(letter)
				location << "#{letter}#{number}"
			elsif direction == :W
				number -= 1
				fail "Ship can't be placed off board" unless (1..@size).include?(number)
				location << "#{letter}#{number}"
			elsif direction == :N
				letter = letter.next
				fail "Ship can't be placed off board" unless ('A'..@size.alphabet.upcase).include?(letter)
				location << "#{letter}#{number}"
			else fail "Please enter :N, :S, :E or :W"
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
			@ships
		end
	end
end


