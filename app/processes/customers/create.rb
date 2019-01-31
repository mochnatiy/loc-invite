require File.expand_path('../../abstract_process.rb', __FILE__)
require File.expand_path('../../../../data/providers/file_data.rb', __FILE__)
require File.expand_path('../../../customer.rb', __FILE__)

module Customers #:nodoc:
  # Business process to create customers from data source
  class Create < ::AbstractProcess
    def call
      customers = []

      Providers::FileData.new.data.each do |object|
        customers << Customer.new(
          id: object[:user_id],
          name: object[:name],
          location: Point.new(object[:latitude], object[:longitude])
        )
      end

      customers
    end
  end
end
