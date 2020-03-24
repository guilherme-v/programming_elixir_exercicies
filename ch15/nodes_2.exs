# When I introduced the interval server, I said it sent a tick
# “about every 2 seconds.” But in the receive loop, it has an explicit
# timeout of 2,000 ms. Why did I say “about” when it looks as
# if the time should be pretty accu- rate?

# When we are running both nodes on the same machine
# we are dealing with the same S.O Scheduler, and no remote
# connection delays. The scenario will be problably different
# when running on the web
