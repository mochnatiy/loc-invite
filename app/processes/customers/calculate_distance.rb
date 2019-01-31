require File.expand_path('../../../distance.rb', __FILE__)
require File.expand_path('../../abstract_process.rb', __FILE__)
require File.expand_path('../create.rb', __FILE__)

module Customers #:nodoc:
  # Business process to calculate distance to each customer from preferred
  # location
  class CalculateDistance < ::AbstractProcess
    def call
      customers = Customers::Create.call

      customers.each do |customer|
        customer.distance = Distance.new(
          input[:start_point], customer.location
        ).calculate
      end

      customers
    end
  end
end
