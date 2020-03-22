# Change the ^pid in pmap to _pid. This means the receive block
# will take responses in the order the processes send them. Now
# run the code again. Do you see any difference in the output?
# If you’re like me, you don’t, but the program clearly contains
# a bug. Are you scared by this? Can you find a way to reveal the
# problem (perhaps by passing in a different function, by sleeping,
# or by increasing the number of processes)? Change it back to ^pid
# and make sure the order is now correct.

# With ^pid we would have something like:
# 1           -- 2           -- 3            -- 4
# P1          -- P2          -- P3           -- P4
# {P1, value} -- {P2, value} -- {P3, value}  -- {P4, value}

# With _pid we whould effectively ignore this param:
# so any receiver can receive the answer of any proccess
# 1           -- 2           -- 3            -- 4
# P1          -- P2          -- P3           -- P4
# {_, value} -- {_, value} -- {_, value}  -- {_, value}

# just make the time of the response variable and you will
# probably see a non deterministic answer
