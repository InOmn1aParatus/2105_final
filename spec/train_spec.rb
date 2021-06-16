require './lib/car'
require './lib/train'

RSpec.describe '' do
  describe 'instantiation' do
    it 'exists' do
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})
      train1 = Train.new({name: 'Thomas', type: 'Tank'})
      expect(train1).to be_a(Train)
    end
  end

  describe 'methods' do
  end
end