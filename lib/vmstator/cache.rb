module Vmstator

  class Cache
    # attrs for each attribute
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
        @num   = data[:num]   if data[:num]
        @name  = data[:name]  if data[:name]
        @sec   = data[:size]  if data[:sec]
        @total = data[:total] if data[:total]
        @pages = data[:pages] if data[:sectors]
      else
        return false
      end
      true
    end

  end
end
