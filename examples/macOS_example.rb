# Path setting slight of hand:
$: << File.expand_path("../../lib", __FILE__)
require 'vmstator'
require 'pry'

parser = Vmstator::Parser.new
macos_pages = parser.parse

puts "                Active: " + macos_pages.active.to_s
puts "             Anonymous: " + macos_pages.anonymous.to_s
puts "          Compressions: " + macos_pages.compressions.to_s
puts "         Copy on Write: " + macos_pages.copy_on_write.to_s
puts "        Decompressions: " + macos_pages.decompressions.to_s
puts "           File Backed: " + macos_pages.file_backed.to_s
puts "            Pages Free: " + macos_pages.free.to_s
puts "              Inactive: " + macos_pages.inactive.to_s
puts "                   Ins: " + macos_pages.ins.to_s
puts "Occupied by Compressor: " + macos_pages.occupied_by_compressor.to_s
puts "                  Outs: " + macos_pages.outs.to_s
puts "             Purgeable: " + macos_pages.purgeable.to_s
puts "           Reactivated: " + macos_pages.reactivated.to_s
puts "  Stored in Compressor: " + macos_pages.stored_in_compressor.to_s
puts "              Swap Ins: " + macos_pages.swapins.to_s
puts "             Swap Outs: " + macos_pages.swapouts.to_s
puts "             Throttled: " + macos_pages.throttled.to_s
puts "    Translation Faults: " + macos_pages.translation_faults.to_s
puts "            Wired Down: " + macos_pages.wired_down.to_s
puts "           Zero Filled: " + macos_pages.zero_filled.to_s

