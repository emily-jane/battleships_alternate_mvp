require_relative 'numeric'

class Board

	DEFAULT_SIZE = 10

	attr_reader :ships, :size, :location, :ship_key

	def initialize(size = DEFAULT_SIZE)
		@ships = {}
		@size = size
		@total_ships = 0
		@sunk_ships = 0
	end

	def place(ship, start_point, direction)
		if ships.keys.include?(ship)
			@ships.delete(ship)
		end
		all_positions(ship, start_point, direction)
		if ships == {}
			ships.merge!(ship => location)
			@total_ships += 1
		else
			count = 0
			ships.values.each do |co_ords|
				if (co_ords & location) != []
					count += 1
				end
			end
				if count == 0
						ships.merge!(ship => location)
						@total_ships += 1
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
				letter = prev_char(letter)
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

	def prev_char(letter)
		(letter.chr.ord - 1).chr
	end

	def check_on_board(coordinates)
		@ship_key = nil
		unless @ships.include?(coordinates)
			false
		else
				@ship_key = @ships.key(y)
				ship_damage(@ship_key)
			true
		end
	end

	# def hits?(coordinates)
		
	# 	if check_on_board(coordinates) == true
	# 		true
	# 	else
	# 		false
	# 	end
	# end

	 def ship_damage(ship_key)
	 	if ship_key != nil
	 	ship_key.reduce_health
	 		if ship_key.sunk?
	 			@sunk_ships +=1
	 		end
	 	end
	 end

	 def check_game_won
		 	if @sunk_ships == @total_ships && @total_ships != 0
		 		"YOU_WIN!!!!!!"
		 	else
		 		"Only #{@total_ships-@sunk_ships} ships to go, ya land-lubber!"
	 		end
 		end

end
