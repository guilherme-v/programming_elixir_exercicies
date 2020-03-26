# Implement the terminate callback in your stack handler.
# Use IO.puts to report the arguments it receives.
# Try various ways of terminating your server. For example, popping an empty
# stack will raise an exception. You might add code that calls System.halt(n)
# if the push handler receives a number less than 10. (This will let you generate
# different return codes.) Use your imagination to try different scenarios.

defmodule Stack.Server do
  use GenServer

  # External API
  def start_link(init_args) do
    GenServer.start_link(__MODULE__, init_args, name: __MODULE__)
  end

  def push(elem) do
    GenServer.cast(__MODULE__, {:push, elem})
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  # GenServer implementation
  def handle_cast({:push, elem}, _stack) when is_integer(elem) and elem < 10 do
    IO.puts "Halt!"
    System.halt()
  end

  def handle_call(:pop, _from, stack) do
    [e | t] = stack
    {:reply, e, t}
  end

  def handle_cast({:push, elem}, stack) do
    stack = stack ++ [elem]
    {:noreply, stack}
  end

  def terminate(reason, stack) do
    IO.puts "TERMINATE: #{inspect(reason)}"
  end
end
