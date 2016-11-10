module Vmstator
  class Stats
    attr_reader :data

    def initialize(data=false)
      if data
        update(data)
      end
      true
    end
  end
end
