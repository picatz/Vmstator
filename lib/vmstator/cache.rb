module Vmstator

  class Cache
    attr_reader :num
    attr_reader :name
    attr_reader :size
    attr_reader :total
    attr_reader :pages

    def initialize(data=false)
      if data
        update(data)
      end
      true
    end

    def update(data)
      if data
        @num   = data[:num].to_i
        @name  = data[:name]
        @sec   = data[:size].to_i 
        @total = data[:total].to_i
        @pages = data[:pages].to_i
      else
        return false
      end
      true
    end

  end
end
