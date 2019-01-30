require File.expand_path('../../../app/point.rb', __FILE__)

RSpec.describe Point do
  # Take for test the coords of Guinness Storehouse
  let!(:lat) { 53.3465781 }
  let!(:long) { -6.2717992 }

  let!(:rads_in_degree) { 0.01745329252 }

  before do
    @point = Point.new(lat, long)
  end

  specify 'Coords are about to convert to radians during initialization' do
    expect(@point.latitude).to eql(lat * rads_in_degree)
    expect(@point.longitude).to eql(long * rads_in_degree)
  end
end
