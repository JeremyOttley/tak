# clock states
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# time consuming operation
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
elapsed = ((ending - starting) * 100).round / 100.0 # round long float down to hundreths place
elapsed # => time in seconds
