# Vmstator

Vmstator is a Ruby API for [vmstat](https://en.wikipedia.org/wiki/Vmstat). It provides an [OO](https://www.tutorialspoint.com/ruby/ruby_object_oriented.htm) interface to be able to parse the contents of the output of vmstat and access that infromation intuitively.

#### Note

This gem is still in development, but has more or less working code! :)

![screenshot](http://i.imgur.com/spjIhpy.png "Screen Shot")

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

vmstats = Vmstator::Stats.new
vmstats.flags = "-S M"
vmstats.parse

puts vmstats.data
puts vmstats.buffer
puts vmstats.cache
puts vmstats.forks
puts vmstats.active
puts vmstats.disk_info
puts vmstats.event_counter_statistics
puts vmstats.slab_info
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

