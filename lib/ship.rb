class Ship
	DEFAULT_LENGTH = 2

	attr_reader :length, :hits, :sunk

	def initialize(length = DEFAULT_LENGTH)
		fail 'Length must be between 2 and 5' unless length > 1 && length < 6
		@length = length
    @hits = 0
    @sunk = false
	end

  def sunk?
    if @hits == @length
      @sunk=true
  end
  end

  def reduce_health
    @hits += 1
  end

end