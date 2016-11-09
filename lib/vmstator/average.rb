module Vmstator

  class AverageMemory
    # attrs for each attribute
    attr_reader :r,    :runnable     # number of runnable processes
    attr_reader :b,    :uninter      # number of processes in uninterruptible sleep
    attr_reader :swpd, :used         # amount of virtual memory used
    attr_reader :f,    :free         # amount of idle memory
    attr_reader :buff, :buffer       # amount of memory used as buffers
    attr_reader :c,    :cache        # amount of memory used as cache
    attr_reader :si,   :swapped_in   # amount of memory swapped in from disk (/s)
    attr_reader :so,   :swapped_to   # amount memory swapped to disk (/s)
    attr_reader :bi,   :blocks_recv  # blocks received from a device (blocks/s)
    attr_reader :bo,   :blocks_sent  # blocks sent to a block device (blocks/s)
    attr_reader :in,   :interrupts   # number of interrupts (/s)
    attr_reader :cs,   :cntxt_swtchs # number of context switches (/s)
    attr_reader :us,   :non_kernel   # time spent running non-kernel code
    attr_reader :sy,   :kernel       # time spent running kernel code
    attr_reader :id,   :idle_time    # time spent idle
    attr_reader :wa,   :waiting      # time spent waiting for IO
    attr_reader :st,   :stolen       # time stolen from a virtual machine

    def initialize(data=false)
      if data
        update(data)
      end
      true
    end

    def update(data)
      if data
        @r, @runnable      = data[:r], data[:r]       if data[:r]
        @b, @uninter       = data[:b], data[:b]       if data[:b]
        @c, @cache         = data[:c], data[:c]       if data[:c]
        @si, @swapped_in   = data[:si], data[:si]     if data[:si]
        @so, @swapped_to   = data[:so], data[:so]     if data[:so]
        @bi, @blocks_recv  = data[:bi], data[:bi]     if data[:bi]
        @bo, @blocks_sent  = data[:bo], data[:bo]     if data[:bo]
        @in, @interrupts   = data[:in], data[:in]     if data[:in]
        @cs, @cntxt_swtchs = data[:cs], data[:cn]     if data[:cs]
        @us, @non_kernel   = data[:us], data[:us]     if data[:us]
        @sy, @kernel       = data[:sy], data[:sy]     if data[:sy]
        @id, @idle_time    = data[:id], data[:id]     if data[:id]
        @wa, @waiting      = data[:wa], data[:wa]     if data[:wa]
        @st, @stolen       = data[:st], data[:st]     if data[:st]
        @swpd, @used       = data[:swpd], data[:swpd] if data[:swpd]
        @f, @free          = data[:free], data[:free] if data[:free]
        @buff, @buffer     = data[:buff], data[:buff] if data[:buff]
      else
        return false
      end
      true
    end
  end
end
