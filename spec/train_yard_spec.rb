require './lib/car'
require './lib/train'
require './lib/train_yard'

RSpec.describe TrainYard do
  describe 'instantiation' do
    it 'exists' do
      train_yard = TrainYard.new({location: 'Brighton'})
      expect(train_yard).to be_a(TrainYard)
    end

    it 'has attributes' do
      train_yard = TrainYard.new({location: 'Brighton'})
      expect(train_yard.location).to eq('Brighton')
    end
  end

  describe 'methods' do
    it 'adds trains to yard' do
      train_yard = TrainYard.new({location: 'Brighton'})
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})
      car3 = Car.new({type: 'Cattle', weight: 3})
      car4 = Car.new({type: 'Dining', weight: 4})
      train1 = Train.new({name: 'Thomas', type: 'Tank'})
      train2 = Train.new({name: 'Emily', type: 'Tender'})
      train3 = Train.new({name: 'Nia', type: 'Tank'})
      train4 = Train.new({name: 'Gordon', type: 'Express'})
      train1.add_cars(car1, 5)
      train1.add_cars(car2, 2)
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 1)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)
      expect(train_yard.trains).to eq([train1, train2, train3, train4])
    end

    it 'lists types of trains' do
      train_yard = TrainYard.new({location: 'Brighton'})
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})
      car3 = Car.new({type: 'Cattle', weight: 3})
      car4 = Car.new({type: 'Dining', weight: 4})
      train1 = Train.new({name: 'Thomas', type: 'Tank'})
      train2 = Train.new({name: 'Emily', type: 'Tender'})
      train3 = Train.new({name: 'Nia', type: 'Tank'})
      train4 = Train.new({name: 'Gordon', type: 'Express'})
      train1.add_cars(car1, 5)
      train1.add_cars(car2, 2)
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 1)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)

      expect(train_yard.types_of_trains).to eq(['Express', 'Tank', 'Tender'])
    end

    it 'lists trains containing given train' do
      train_yard = TrainYard.new({location: 'Brighton'})
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})
      car3 = Car.new({type: 'Cattle', weight: 3})
      car4 = Car.new({type: 'Dining', weight: 4})
      train1 = Train.new({name: 'Thomas', type: 'Tank'})
      train2 = Train.new({name: 'Emily', type: 'Tender'})
      train3 = Train.new({name: 'Nia', type: 'Tank'})
      train4 = Train.new({name: 'Gordon', type: 'Express'})
      train1.add_cars(car1, 5)
      train1.add_cars(car2, 2)
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 1)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)

      expect(train_yard.trains_containing(car1)).to eq([train1, train2, train3])
    end

    it 'provides a sorted list of cargo' do
      train_yard = TrainYard.new({location: 'Brighton'})
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})
      car3 = Car.new({type: 'Cattle', weight: 3})
      car4 = Car.new({type: 'Dining', weight: 4})
      train1 = Train.new({name: 'Thomas', type: 'Tank'})
      train2 = Train.new({name: 'Emily', type: 'Tender'})
      train3 = Train.new({name: 'Nia', type: 'Tank'})
      train4 = Train.new({name: 'Gordon', type: 'Express'})
      train1.add_cars(car1, 5)
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 4)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)

      expect(train_yard.sorted_cargo_list).to eq(['Cattle', 'Dining', 'Mail'])
    end
    
    it 'reports total inventory of cars' do
      train_yard = TrainYard.new({location: 'Brighton'})
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})
      car3 = Car.new({type: 'Cattle', weight: 3})
      car4 = Car.new({type: 'Dining', weight: 4})
      train1 = Train.new({name: 'Thomas', type: 'Tank'})
      train2 = Train.new({name: 'Emily', type: 'Tender'})
      train3 = Train.new({name: 'Nia', type: 'Tank'})
      train4 = Train.new({name: 'Gordon', type: 'Express'})
      train1.add_cars(car1, 5)
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 4)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)
      expected = {
        car1 => 12,
        car3 => 10,
        car4 => 9
      }

      expect(train_yard.total_inventory).to eq(expected)
    end

    it 'reports overflow if car is carried by multiple trains w > 10 cars' do
      train_yard = TrainYard.new({location: 'Brighton'})
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})
      car3 = Car.new({type: 'Cattle', weight: 3})
      car4 = Car.new({type: 'Dining', weight: 4})
      train1 = Train.new({name: 'Thomas', type: 'Tank'})
      train2 = Train.new({name: 'Emily', type: 'Tender'})
      train3 = Train.new({name: 'Nia', type: 'Tank'})
      train4 = Train.new({name: 'Gordon', type: 'Express'})
      train1.add_cars(car1, 5)
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 4)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)

      expect(train_yard.overflow_cars).to eq([car1])
    end
  end
end