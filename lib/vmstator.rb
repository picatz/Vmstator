require "vmstator/errors"
require "vmstator/version"
require "vmstator/stats"
require "vmstator/memory"
require "vmstator/active"
require "vmstator/average"
require "vmstator/cache"
require "vmstator/disk"
require "vmstator/disk_statistics"
require "vmstator/disk_summary"
require "vmstator/errors"
require "vmstator/event_counter_statistics"
require "vmstator/forks"
require "vmstator/slab_info"
require "vmstator/version"

module Vmstator

  class Parser
    
    # parse() parses the the vmstat command 
    # with optional vmstat command-line flags
    # which is passed in as a string
    def parse(flags=false)
      if flags 
        if flags =~ /(-d|--disk)/
          # parse instances of disk_statistics
          return disk_statistics(flags)
        elsif flags =~ /(-D|--disk-sum)/
          # parse instances of disk summary
          return disk_summary(flags)
        elsif flags =~ /(-a|--active)/
          # parse instances of active memory
          return active(flags)
        elsif flags =~ /(-m|--slabs)/
          # parse instances of slab info
          return slab_info(flags)
        elsif flags =~ /(-f|--forks)/
          # parse instances of forks
          return forks
        elsif flags =~ /(-s|--stats)/
          # parse instances of event counter statistics
          return event_counter_statistics(flags)
        elsif flags =~ /(-V|--version)/
          # parse instances of version
          return version
        else
          # parse instances of the typical, average things
          return average(flags)
        end
      else
        return average
      end
    end

    def version
      `vmstat -V`.split.last
    end

    # average() will run the command normally and return the data
    def average(flags="")
      output = `vmstat #{flags}`.split("\n")
      labels = output[1]
      stats  = output[2]
      data   = Hash[labels.split.map(&:to_sym).zip stats.split.map(&:to_i)]
      Vmstator::AverageMemory.new(data)
    end

    # active() will run the -a flag and return the data
    def active(flags=false)
      flags  = "-a" unless flags
      output = `vmstat #{flags}`.split("\n")
      labels = output[1]
      stats  = output[2]
      data   = Hash[labels.split.map(&:to_sym).zip stats.split.map(&:to_i)]
      Vmstator::ActiveMemory.new(data)
    end

    # event_counter_statistics() will run the -s flag and return the data 
    def event_counter_statistics(flags=false)
      flags  = "-s" unless flags
      output = `vmstat #{flags}` 
      values = output.split(/[A-z]/).compact.join.split("\n").map(&:strip).map(&:to_i)
      keys   = output.split(/\d/).compact.join.split("\n").map(&:strip)
      keys   = keys.map(&:downcase).map { |s| 
                  s.gsub(" ", "_")}.map { |s| 
                  s.gsub("-", "_")}.map { |s| 
                  s.gsub(/\b(\w){1}_{1}/, "") }.map(&:to_sym)
      data = Hash[keys.zip values]
      Vmstator::EventCounterStatistics.new(data)
    end

    # disk_summary() will run the -D flag and return the data
    def disk_summary(flags=false)
      flags  = "-D" unless flags
      output = `vmstat #{flags}` 
      values = output.split(/[A-z]/).compact.join.split("\n").map(&:strip).map(&:to_i)
      keys   = output.split(/\d/).compact.join.split("\n").map(&:strip) 
      keys   = keys.map(&:downcase).map {|s| s.gsub(" ", "_")}.map(&:to_sym)
      data   = Hash[keys.zip values]
      Vmstator::DiskSummary.new(data)
    end 

    # forks() will run the -f flag and return that data.
    def forks
      `vmstat -f`.split.first.to_i
    end

    # disk_statistics() will run the -d flag and return that data.
    def disk_statistics(flags=false)
      flags      = "-d" unless flags
      disk_stats = Vmstator::DiskStatistics.new
      output     = `vmstat #{flags}`.split("\n")
      # remove first line of the output
      output.shift
      output.shift
      output.each do |line|
        name, total, merged, sectors, ms, total, merged, sectors, ms, cur, sec = line.split
        data = { :name => name, 
                 :totoal => total.to_i, 
                 :merged => merged.to_i, 
                 :sectors => sectors.to_i,
                 :ms => ms.to_i,     
                 :cur => cur.to_i,      
                 :sec => sec.to_i }
        disk_stats.update(data)
      end
      disk_stats
    end

    # slab_info() will run the -m flag and return that data
    def slab_info(flags=false)
      raise VmstatError("This must be run with root privileges!") unless Process.uid == 0
      flags     = "-m" unless flags
      slab_info = Vmstator::SlabInfo.new 
      `sudo vmstat #{flags}`.split("\n").each do |info|
        next if info == "Cache                       Num  Total   Size  Pages"
        name, num, total, size, pages = info.split
        data = { :name => name, 
                 :num => num.to_i, 
                 :total => total.to_i,
                 :size => size.to_i,  
                 :pages => pages.to_i }
        slab_info.update(data)
      end
      slab_info
    end

  end
end
