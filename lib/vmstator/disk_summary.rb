module Vmstator

  class DiskSummary
    attr_reader :disks
    attr_reader :partitions
    attr_reader :total_reads
    attr_reader :merged_reads
    attr_reader :read_sectors
    attr_reader :milli_reading
    attr_reader :writes
    attr_reader :merged_writes
    attr_reader :written_sectors
    attr_reader :milli_writing
    attr_reader :inprogress_io
    attr_reader :milli_spent_io
   
    def initialize(data=false)
      if data
        update(data)
      end
      true
    end

    def update(data)
      if data
        @disks           = data[:disks]
        @partitions      = data[:partitions]
        @total_reads     = data[:total_reads]
        @merged_reads    = data[:merged_reads] 
        @read_sectors    = data[:read_sectors]
        @milli_reading   = data[:milli_reading]
        @writes          = data[:writes]
        @merged_writes   = data[:merged_writes]
        @written_sectors = data[:written_sectors]
        @milli_writing   = data[:milli_writing]
        @inprogress_io   = data[:inprogress_io]
        @milli_spent_io  = data[:milli_spent_io]
      else
        return false
      end
      true
    end
    
  end
end
