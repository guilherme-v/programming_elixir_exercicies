# Set up two terminal windows, and go to a different directory in each.
# Then start up a named node in each. In one window, write a function
# that lists the contents of the current directory.

# fun = fn -> IO.puts(Enum.join(File.ls!, ",")) end

# Run it twice, once on each node.

# Nothing fancing here, but we have some highlights:

# - To set Nodes names: iex --name, and iex --sname
# - To show the list of known nodes: Node.list
# - To connect to a known node: Node.connect(:"...@...")
# - To get the nodes name: Node.self
# - We can spawn a process in a remote node: Node.spawn(:"...", fun)
# - But when we spawn a process locally Node.spawn DOES NOT work, we should use just 'spawn'
# - When we see a PID like PID<7393.48.0>, when the first number
# is different from 0, it is running on a different node
# - We can execute a function in a remote node, and the response
# will be back in the current one
