require 'json'

class DataProvider
  class << self
    def customers
      JSON.parse(
        File.read(path)
      )
    end

    def path
      File.expand_path('../../data/customers.txt', __FILE__)
    end
  end
end
