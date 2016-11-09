module Vmstator

  class EvenCounterStatistics
    attr_reader :total_memory
    attr_reader :used_memory
    attr_reader :active_memory
    attr_reader :inactive_memory
    attr_reader :free_memory
    attr_reader :buffer_memory
    attr_reader :swap_cache
    attr_reader :total_swap
    attr_reader :used_swap
    attr_reader :free_swap
    attr_reader :non_nice_user_cpu_ticks
    attr_reader :nice_user_cpu_ticks
    attr_reader :system_cpu_ticks
    attr_reader :idle_cpu_ticks
    attr_reader :io_wait_cpu_ticks
    attr_reader :irq_cpu_ticks
    attr_reader :softirq_cpu_ticks
    attr_reader :stolen_cpu_ticks
    attr_reader :pages_paged_in
    attr_reader :pages_paged_out
    attr_reader :pages_swapped_in
    attr_reader :pages_swapped_out
    attr_reader :interrupts
    attr_reader :cpu_context_switches
    attr_reader :boot_time
    attr_reader :forks

    def initialize(data=false)
      if data
        update(data)
      end
      true
    end

    def update(data)
      if data
        @total_memory            = data[:total_memory]
        @used_memory             = data[:used_memory]
        @active_memory           = data[:active_memory]
        @inactive_memory         = data[:inactive_memory]
        @free_memory             = data[:free_memory]
        @buffer_memory           = data[:buffer_memory]
        @swap_cache              = data[:swap_cache]
        @total_swap              = data[:total_swap]
        @used_swap               = data[:used_swap]
        @free_swap               = data[:free_swap]
        @non_nice_user_cpu_ticks = data[:non_nice_user_cpu_ticks]
        @nice_user_cpu_ticks     = data[:nice_user_cpu_ticks]
        @system_cpu_ticks        = data[:system_cpu_ticks]
        @idle_cpu_ticks          = data[:idle_cpu_ticks]
        @io_wait_cpu_ticks       = data[:io_wait_cpu_ticks]
        @irq_cpu_ticks           = data[:irq_cpu_ticks]
        @softirq_cpu_ticks       = data[:softirq_cpu_ticks]
        @stolen_cpu_ticks        = data[:stolen_cpu_ticks]
        @pages_paged_in          = data[:pages_paged_in]
        @pages_paged_out         = data[:pages_paged_out]
        @pages_swapped_in        = data[:pages_swapped_in]
        @pages_swapped_out       = data[:pages_swapped_out]
        @interrupts              = data[:interrupts]
        @cpu_context_switches    = data[:cpu_context_switches]
        @boot_time               = data[:boot_time]
        @forks                   = data[:forks]
      else
        return false
      end
      true
    end

  end
end
