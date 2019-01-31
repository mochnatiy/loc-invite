require File.expand_path('../lib/hash.rb', __FILE__)
require File.expand_path('../app/point.rb', __FILE__)
require File.expand_path('../app/processes/customers/select_nearest.rb', __FILE__)

# Dublin office location
office_location = Point.new(53.339428, -6.257664)

# Required distance in kilometers
preferred_distance = 100

nearest_customers = Customers::SelectNearest.call(
  start_point: office_location,
  distance: preferred_distance
)

nearest_customers.each do |customer|
  puts "#{customer.id}, #{customer.name}"
end
