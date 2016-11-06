require "vmstator/errors"
require "vmstator/version"

module Vmstator

	# The Stats class does most of the work for this gem
	# by providing an interface to parse vmstat, process
	# flags for the vmstat command, and a way to access the
	# result of that data.
	class Stats
    # Comand-line Flags
		attr_accessor :flags
    # Output of command and all parsed data
		attr_reader :output, :data
    # Parsed Data
		attr_reader :r,    :runnable     # number of runnable processes
		attr_reader :b,    :uninter      # number of processes in uninterruptible sleep
		attr_reader :swpd, :used         # amount of virtual memory used
		attr_reader :free, :free         # amount of idle memory
		attr_reader :buff, :buffer       # amount of memory used as buffers
		attr_reader :c,    :cache        # amount of memory used as cache
		attr_reader :si,   :swapped_in   # amount of memory swapped in from disk (/s)
		attr_reader :so,   :swapped_to   # amount memory swapped to disk (/s)
		attr_reader :bi,   :blocs_recv   # blocks received from a block device (blocks/s)
		attr_reader :bo,   :blocks_sent  # blocks sent to a block device (blocks/s)
		attr_reader :in,   :interrupts   # number of interrupts (/s)
		attr_reader :cs,   :cntxt_swtchs # number of context switches (/s)
		attr_reader :us,   :non_kernel   # time spent running non-kernel code
		attr_reader :sy,   :kernel       # time spent running kernel code
		attr_reader :id,   :idle_time    # time spent idle
		attr_reader :wa,   :waiting      # time spent waiting for IO
		attr_reader :st,   :stolen       # time stolen from a virtual machine

		# initialize() handles the initialization of a new
		# Vmstator::Stats object which takes in an optional
		# set of arguments that can be passed in as a hash.
		#
		# == Example
		#
		#  # Typical use case:
		#  vmstats = Vmstator::Stats.new(:flags => "-S m", :parse => true )
		#  # => true
		#
		def initialize(args=false)
			unless vmstat_exists?
				Vmstator::VmstatError.new("Vmstat was not found on this system!")
			end
			if args
				process_flags(args[:flags]) if args[:flags]
				parse if args[:parse]
			end
			true
		end

		# dry_run() runs the vmstat command with the available flags or
		# will raise a custom Vmstator::VmstatError
		def dry_run
			binding.pry
      unless system("vmstat #{@flags} > /dev/null 2>&1")
				raise Vmstator::VmstatError.new("Vmstat ran into a problem with the flag(s): #{@flags}")
			end
		end

		# parse() is probably the main work horse of this class. It parses the
		# the vmstat command after a dry run is done to check the command. It
		# does quite few things: including parsing all of the vmstat information
		# into a hash stored in @data; and will then store the relevant information
		# into the appropriate attr_reader
		#
		# == Example
		#
		#  # Typical use case to parse a vmstat command.
		#  vmstats = Vmstator::Stats.new(:flags => "-S m")
		#  vmstats.parse
		#  # => true
		#
		def parse
			dry_run
			@output = `vmstat #{@flags}`.split("\n")
			labels  = @output[1]
			stats   = @output[2]
			@data = Hash[labels.split.map(&:to_sym).zip stats.split]
			@swpd, @used         = @data[:swpd],  @data[:swpd]
			@buff, @buffer       = @data[:buff],  @data[:buff]
			@r,    @runnable     = @data[:r],     @data[:r]
			@b,    @uninter      = @data[:b],     @data[:b]
			@si,   @swapped_in   = @data[:si],    @data[:si]
			@so,   @swapped_to   = @data[:so],    @data[:so]
			@bi,   @blocs_recv   = @data[:bi],    @data[:bi]
			@bo,   @blocks_sent  = @data[:bo],    @data[:bo]
			@in,   @interrupts   = @data[:in],    @data[:in]
			@cs,   @cntxt_swtchs = @data[:cs],    @data[:cs]
			@us,   @non_kernel   = @data[:us],    @data[:us]
			@sy,   @kernel       = @data[:sy],    @data[:sy]
			@id,   @idle_time    = @data[:id],    @data[:id]
			@wa,   @waiting      = @data[:wa],    @data[:wa]
			@st,   @stolen       = @data[:st],    @data[:st]
			@cache               = @data[:cache]
			@free                = @data[:free]
			true
		end

		private

		# vmstat_exists?() checks if vmstat exists
		# or not returning true or false for the command.
		def vmstat_exists?
			system("which vmstat > /dev/null 2>&1")
		end

		# process_flags() allows the flags argument that is passed
		# in to be either an array or a string. That way the flags
		# argument can be processed intuitively as either a string
		# of flags or simple an array of those flags.
		def process_flags(flags)
			if flags.is_a? String
				@flags = flags
			elsif flags.is_a? Array
				@flags = flags.join(" ")
			else
				false
			end
		end

	end

end
