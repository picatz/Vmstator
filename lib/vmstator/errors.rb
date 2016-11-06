module Vmstator

  # VmstatError handles the custom error handling for this Gem
  #
  # == Example
  #
  #  # Typical use case
  #  raise VmstatError("This is a custom error!")
  #
  class VmstatError < StandardError
    attr_reader :problem
    def initialize(problem="Vmstat eems to have encountered a problem.")
      @problem = problem
      super(@problem)
    end
  end

end
