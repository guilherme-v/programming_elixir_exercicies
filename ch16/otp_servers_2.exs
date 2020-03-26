# Extend your stack server with a push interface that adds a single value to the top of the stack. This will be implemented as a cast.
# Experiment in iex with pushing and popping values.

defmodule Stack.Service do
  use GenServer

  def handle_call(:pop, _from, stack) do
    [top | tail] = stack
    {:reply, top, tail}
  end

  def handle_cast({:push, elem}, stack) do
    stack = stack ++ [elem]
    {:noreply, stack}
  end
end
