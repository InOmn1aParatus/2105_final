require './lib/car'

RSpec.describe Car do
  describe 'instantiation' do
    it 'exists' do
      car1 = Car.new
      expect(car1).to be_a(Car)
    end
  end

  describe 'methods' do
  end
end