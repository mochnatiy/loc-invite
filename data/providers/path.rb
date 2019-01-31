# frozen_string_literal: true

module Providers
  # A class to represent file path, separated for test purposes
  class Path
    class << self
      # Returns path of file that contains customer records
      # ==== Examples
      # Path.info
      def info
        File.expand_path('../../data/sources/customers.txt', __dir__)
      end
    end
  end
end
