module Vmstator

  class Memory < Stats
    attr_reader :runnable     # number of runnable processes
    attr_reader :uninter      # number of processes in uninterruptible sleep
    attr_reader :used         # amount of virtual memory used
    attr_reader :free         # amount of idle memory
    attr_reader :buffer       # amount of memory used as buffers
    attr_reader :cache        # amount of memory used as cache
    attr_reader :swapped_in   # amount of memory swapped in from disk (/s)
    attr_reader :swapped_to   # amount memory swapped to disk (/s)
    attr_reader :blocks_recv  # blocks received from a device (blocks/s)
    attr_reader :blocks_sent  # blocks sent to a block device (blocks/s)
    attr_reader :interrupts   # number of interrupts (/s)
    attr_reader :cntxt_swtchs # number of context switches (/s)
    attr_reader :non_kernel   # time spent running non-kernel code
    attr_reader :kernel       # time spent running kernel code
    attr_reader :idle_time    # time spent idle
    attr_reader :waiting      # time spent waiting for IO
    attr_reader :stolen       # time stolen from a virtual machine

    def update(data)
      if data
        @runnable     = data[:r]
        @uninter      = data[:b]
        @cache        = data[:c]
        @swapped_in   = data[:si] 
        @swapped_to   = data[:so] 
        @blocks_recv  = data[:bi] 
        @blocks_sent  = data[:bo] 
        @interrupts   = data[:in] 
        @cntxt_swtchs = data[:cs] 
        @non_kernel   = data[:us] 
        @kernel       = data[:sy] 
        @idle_time    = data[:id] 
        @waiting      = data[:wa] 
        @stolen       = data[:st] 
        @used         = data[:swpd] 
        @free         = data[:free] 
        @buffer       = data[:buff] 
      else
        return false
      end
      true
    end

  end
end
