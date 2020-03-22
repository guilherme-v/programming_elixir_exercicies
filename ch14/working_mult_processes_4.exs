# Do the same, but have the child raise an exception.
# What difference do you see in the tracing?

# Result:
# The chield dies and takes the parent with it
# It shows 2 logs because of the exception bubbles up from chield to parent

# Interactive Elixir (1.10.1) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> Link.run
# ** (EXIT from #PID<0.109.0>) shell process exited with reason: an exception was raised:
#     ** (RuntimeError) runtime error
#         working_mult_processes_4.exs:9: Link.chield/1

# Interactive Elixir (1.10.1) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)>
# 20:20:10.795 [error] Process #PID<0.111.0> raised an exception
# ** (RuntimeError) runtime error
#     working_mult_processes_4.exs:9: Link.chield/1

defmodule Link do
  import :timer, only: [sleep: 1]

  def chield(parent) do
    send(parent, "Msg from chield!")
    raise RuntimeError
  end

  def run do
    spawn_link(Link, :chield, [self()])
    sleep(500)
    receive do
      msg ->
        IO.puts "RECEIVING: #{msg}"
    end
  end
end
