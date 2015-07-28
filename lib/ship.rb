class Ship
	DEFAULT_LENGTH = 2
	DEFAULT_DIRECTION = :E
	
	attr_reader :length, :direction

	def initialize(length = DEFAULT_LENGTH, direction = DEFAULT_DIRECTION)
		fail 'Length must be between 2 and 5' unless length > 1 && length < 6
		@length = length
		@direction = direction
	end



end