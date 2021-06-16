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

    it 'has attributes and starts with no cargo' do
      train1 = Train.new({name: 'Thomas', type: 'Tank'})
      expect(train1.name).to eq('Thomas')
      expect(train1.type).to eq('Tank')
      expect(train1.cargo).to eq({})
    end
  end

  describe 'methods' do
  end
end