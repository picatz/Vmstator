module Vmstator

  class Disk
    # attrs for each attribute
    attr_reader :ms
    attr_reader :cur
    attr_reader :sec
    attr_reader :name
    attr_reader :total
    attr_reader :merged  
    attr_reader :sectors

    def initialize(data=false)
      if data
        update(data)
      end
      true
    end

    def update(data)
      if data
        @ms      = data[:ms]      if data[:ms]
        @cur     = data[:cur]     if data[:cur]
        @sec     = data[:sec]     if data[:sec]
        @name    = data[:name]    if data[:name]
        @total   = data[:total]   if data[:total]
        @merged  = data[:merged]  if data[:merged]
        @sectors = data[:sectors] if data[:sectors]
      else
        return false
      end
      true
    end

  end
end
