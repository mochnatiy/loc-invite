# A responsibility of Point class is to store coords
# and convert them to radians for calculations
# Usage: point = Point.new(lat, long)

class Point
  RADIANS_PER_DEGREE = 0.01745329252

  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude * RADIANS_PER_DEGREE
    @longitude = longitude * RADIANS_PER_DEGREE
  end
end
