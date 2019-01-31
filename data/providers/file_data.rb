# frozen_string_literal: true

require 'json'
require File.expand_path('path.rb', __dir__)

module Providers
  # A class which responsibility is convert records to JSON, parse it and
  # return array of hashes with customer data
  class FileData
    def initialize
      @path = Path.info
    end

    # Returns array of hashes with customer data
    # ===== Examples:
    # customers = FileData.new.data
    def data
      parse(prepare)
    end

    private

    # Reads the file and converts records from file to JSON string
    def prepare
      begin
        raw_string = File.read(@path)
      rescue Errno::ENOENT
        # Notify developers
        raise StandardError, 'File with data does not exist'
      end

      raw_string.gsub!("\n", ",\n")
      "[#{raw_string.chomp.chomp(',')}]"
    end

    def parse(raw)
      JSON.parse(raw).map!(&:symbolize_keys)
    rescue JSON::ParserError
      # Notify developers
      raise StandardError, 'Data in file are corrupted'
    end
  end
end
