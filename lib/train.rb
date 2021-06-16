class Train
  attr_reader :name, :type, :cargo, :weight

  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @cargo = Hash.new(0)
    @weight = 0
  end

  def count_cars(car)
    @cargo[car]
  end

  def add_cars(car, quantity)
    cargo[car] += quantity
  end

  def weight
    @cargo.each do |car, quantity|
      @weight += car.weight * quantity
    end
    @weight
  end
end