# clock states
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# time consuming operation
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
elapsed = ((ending - starting) * 100).round / 100.0 # round long float down to hundreths place
elapsed # => time in seconds

###

module Clock
  def self.time
    starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    yield if block_given?
    ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    elapsed = ((ending - starting) * 100).round / 100.0
    elapsed
  end
end #=> Clock.time { sleep(2.545) }
