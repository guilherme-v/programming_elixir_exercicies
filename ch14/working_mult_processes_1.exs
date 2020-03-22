defmodule ChainOfProcess do
  # (pid) works like a initial state configured by spawn/3 and being hold to be used latter
  def counter(pid) do
    receive do
      counter ->
        send(pid, counter + 1)
    end
  end

  def spawn_n_process(n) do
    last =
      Enum.reduce(
        # we will ignore it, we only need it to create process sequentially
        1..n,
        # the first process created will respond to this current running process
        self(),
        # return the PID of the process created as the accumulator
        fn _, pid ->
          spawn(ChainOfProcess, :counter, [pid])
        end
      )

    # send the message to last process created
    # it will start communicating with the previous process
    # incrementing each time
    # until it reachs the first process
    # that will send a msg to this current curring process
    # that will be received below
    send(last, 0)

    # wait for a response
    receive do
      n when is_integer(n) -> IO.puts("The result is: #{n}")
    end
  end

  def run(n) do
    IO.puts(inspect(:timer.tc(ChainOfProcess, :spawn_n_process, [n])))
  end
end
