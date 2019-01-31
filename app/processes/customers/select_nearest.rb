require File.expand_path('../calculate_distance.rb', __FILE__)

module Customers #:nodoc:
  # Business process to select nearest customers and sort them by id
  class SelectNearest < ::AbstractProcess
    def call
      customers = Customers::CalculateDistance.call(
        start_point: input[:start_point]
      )

      customers.
        select{ |customer| customer.distance <= input[:distance] }.
        sort_by{ |customer| customer.id }
    end
  end
end
