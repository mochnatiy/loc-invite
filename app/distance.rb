# A responsibility of Distance class is to calculate great circle distance
# between two points
class Distance
  # Earth radius in kilometers
  EARTH_RADIUS = 6371

  attr_reader :lat1, :long1, :lat2, :long2

  def initialize(start_point, end_point)
    # Convert input data to variables more suitable for computations
    @lat1 = start_point.latitude
    @long1 = start_point.longitude

    @lat2 = end_point.latitude
    @long2 = end_point.longitude
  end

  # Calculate great circle distance between points
  # ==== Examples:
  # distance = Distance.new(point1, point2).calculate
  def calculate
    (central_angle * EARTH_RADIUS).round(1)
  end

  private

  # Calculate difference between longitudes
  def delta
    (long2 - long1).abs
  end

  # Create aliases for basic math functions
  def sqrt(value)
    Math.sqrt(value)
  end

  def sin(value)
    Math.sin(value)
  end

  def cos(value)
    Math.cos(value)
  end

  def arctan(value)
    Math.atan(value)
  end

  # Calculate central angle between points
  def central_angle
    arctan(
      sqrt(
        (cos(lat2) * sin(delta))**2 +
          (cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(delta))**2
      ) / (
        sin(lat1) * sin(lat2) + cos(lat1) * cos(lat2) * cos(delta)
      )
    )
  end
end
