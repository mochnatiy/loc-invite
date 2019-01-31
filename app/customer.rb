# frozen_string_literal: true

# A class to represent customer and use object attributes instead of hash keys
class Customer
  attr_reader :id, :name, :location
  attr_accessor :distance

  def initialize(args)
    raise ArgumentError, 'Id should be present' if args[:id].to_i == 0

    @id = args[:id].to_i

    raise ArgumentError, 'Name should not be blank' if args[:name].empty?

    @name = args[:name]

    unless args[:location].is_a?(Point)
      raise ArgumentError, 'Location should be present'
    end

    @location = args[:location]
  end
end
