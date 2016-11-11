module Vmstator

  class Disk
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
        @ms      = data[:ms]      
        @cur     = data[:cur]     
        @sec     = data[:sec]
        @name    = data[:name]
        @total   = data[:total]   
        @merged  = data[:merged]  
        @sectors = data[:sectors] 
      else
        return false
      end
      true
    end

  end
end
