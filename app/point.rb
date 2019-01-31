# A responsibility of Point class is to store coords
# and convert them to radians for calculations
class Point
  RADIANS_PER_DEGREE = 0.01745329252

  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude.to_f * RADIANS_PER_DEGREE
    @longitude = longitude.to_f * RADIANS_PER_DEGREE
  end
end
