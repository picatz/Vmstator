# Path setting slight of hand:
$: << File.expand_path("../../lib", __FILE__)
require 'vmstator'
require 'pry'

binding.pry
