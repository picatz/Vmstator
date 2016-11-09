module Vmstator

  class DiskStatistics
    # attrs for each attribute
    attr_reader :disks

    def initialize(data=false)
      if data
        update(data)
      end
      true
    end

    def update(data)
      if data
        @disks << Disk.new(data)
      else
        return false
      end
      true
    end

  end
end
