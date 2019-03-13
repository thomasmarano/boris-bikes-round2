require_relative 'bike.rb'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike

    x = 0
    while x <= @bikes.length
      fail "Dock is empty!" if empty?
      if @bikes[x].broken
      elsif
        @bikes.slice!(x)

      end
      x += 1
    end
  end

  def dock(bike)
    fail "Dock is full!" if full?
    @bikes.push(bike)
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
