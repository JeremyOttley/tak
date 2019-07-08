# clock states
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# time consuming operation
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
elapsed = ending - starting
elapsed # => 9.183449000120163 seconds