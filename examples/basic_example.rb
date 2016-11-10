# Path setting slight of hand:
$: << File.expand_path("../../lib", __FILE__)
require 'vmstator'

parser = Vmstator::Parser.new

parser.active  
# => Vmstator::DiskSummary

parser.average  
# => Vmstator::DiskSummary

parser.disk_statistics  
# => Vmstator::DiskStatistics
 
parser.disk_summary  
# => Vmstator::DiskSummary

parser.event_counter_statistics  
# => Vmstator::EventCounterStatistics

parser.slab_info  
# => Vmstator::SlabInfo

parser.forks  
# => Integer

parser.parse("-a -S m")
# => Whatever the flags were will determine output.

parser.version
# => String containing vmstat's version number.
