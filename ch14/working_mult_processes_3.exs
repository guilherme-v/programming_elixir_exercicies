# Use spawn_link to start a process, and have that process send a
# message to the parent and then exit immediately. Meanwhile,
# sleep for 500 ms in the parent, then receive as many messages
# as are waiting. Trace what you receive. Does it matter that you
# weren’t waiting for the notification from the child when it exited?

# Short answer: no
# iex(2)> Link.run
# ** (EXIT from #PID<0.112.0>) shell process exited with reason: :any_reason

defmodule Link do
  import :timer, only: [sleep: 1]

  def handler(sender) do
    send(sender, "message from chield process!")
    exit(:any_reason)
  end

  def run do
    spawn_link(Link, :handler, [self()])

    sleep(500)

    receive do
      msg ->
        IO.puts(msg)
    end
  end
end
