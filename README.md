# Vmstator

Vmstator is a Ruby API for [vmstat](https://en.wikipedia.org/wiki/Vmstat). It provides an [OO](https://www.tutorialspoint.com/ruby/ruby_object_oriented.htm) interface to be able to parse the contents of the output of vmstat and access that infromation intuitively.

#### Note

This gem is still in development, but has more or less working code! :)

![screenshot](http://imgur.com/a/eMpO2 "Screen Shot")

## Installation

### Gemfile

Add this line to your application's Gemfile:

```ruby
gem 'vmstator'
```

And then execute:

    $ bundle

### Gem Install

Or install it yourself as:

    $ gem install vmstator

## Usage

Still working on this bit, but, for the mean time...

### Typical Use

```ruby
require 'vmstator'

parser = Vmstator::Parser.new

# Parse command-line arguments to vmstat.
parser.parse("-a")

# Access the command-line arguments directly as methods.
parser.active

# Other Vmstator methods for vmstat:
parser.active
parser.average  
parser.disk_statistics  
parser.disk_summary  
parser.event_counter_statistics  
parser.forks  
parser.parse  
parser.slab_info  
parser.version

# If returns a Vmstator object, for example, for active memory "-a" ...
active_memory = parser.active

# Example, the available methods to access data about Vmstator::ActiveMemory objects.
active_memory.blocks_recv  
active_memory.buffer  
active_memory.cntxt_swtchs  
active_memory.idle_time   
active_memory.kernel      
active_memory.runnable  
active_memory.swapped_in  
active_memory.uninter  
active_memory.used   
active_memory.blocks_sent  
active_memory.cache   
active_memory.free          
active_memory.interrupts  
active_memory.non_kernel  
active_memory.stolen    
active_memory.swapped_to  
active_memory.update   
active_memory.waiting

# Types of Vmstator objects:
ActiveMemory   
Cache  
DiskStatistics  
EventCounterStatistics  
Memory  
SlabInfo  
AverageMemory  
Disk   
DiskSummary     
Parser  
Stats     
VmstatError

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

