# frozen_string_literal: true

require File.expand_path('calculate_distance.rb', __dir__)

module Customers
  # Business process to select nearest customers and sort them by id
  class SelectNearest < ::AbstractProcess
    def call
      customers = Customers::CalculateDistance.call(
        start_point: input[:start_point]
      )

      customers.
        select { |customer| customer.distance <= input[:distance] }.
        sort_by(&:id)
    end
  end
end
