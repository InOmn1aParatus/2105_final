class TrainYard
  attr_reader :location, :trains

  def initialize(info)
    @location = info[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    @trains.map do |train|
      train.type
    end.uniq.sort
  end

  def trains_containing(car)
    @trains.find_all do |train|
      train.cargo.keys.include?(car)
    end
  end

  def sorted_cargo_list
    cargo = []
    @trains.each do |train|
      train.cargo.keys.map do |car|
        cargo << car.type
      end
    end
    cargo.uniq.sort
  end

  def total_inventory
    total = Hash.new { |total, car| total[car] = 0 }
    @trains.each do |train|
      train.cargo.keys.each do |car|
        total[car] += train.count_cars(car)
      end
    end
    total
  end
end

# def total_inventory
#     total = Hash.new { |total, item| total[item] = { quantity: 0, vendors: nil } }
#     @vendors.each do |vendor|
#       vendor.inventory.each do |item, quantity|
#         total[item][:quantity] += quantity
#         total[item][:vendors] = vendors_that_sell(item)
#       end
#     end
#     total
#   end