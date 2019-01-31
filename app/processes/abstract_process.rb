# AbstractProcess needs to implement Command pattern and specify
# common interface to classes for business logic
# ==== Examples:
# class MySumCalculateProcess < AbstractProcess
#   def call
#     puts input[:a] + input[:b]
#   end
# end
#
# sum = MySumCalculateProcess.call(a: 5, b: 3)
class AbstractProcess
  class << self
    def call(input=nil)
      new(input).call
    end
  end

  attr_reader :input

  def initialize(input)
    @input = input
  end
end
