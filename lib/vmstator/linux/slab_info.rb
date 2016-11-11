module Vmstator

  class SlabInfo
    # attrs for each attribute
    attr_reader :caches

    def initialize(data=false)
      @caches = []
      if data
        update(data)
      end
      true
    end

    def update(data)
      if data
        @caches << Cache.new(data)
      else
        return false
      end
      true
    end

  end
end
