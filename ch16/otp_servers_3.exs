# Give your stack server process a name, and make sure it is accessible by that name in iex.

# Result
# iex(2)> {:ok, pid} = Stack.Server.start_link([1,2,3])
# iex(5)> GenServer.cast(:'Elixir.Stack.Server', {:push, "asdf"})
# iex(6)> GenServer.call(:'Elixir.Stack.Server', :pop)

defmodule Stack.Server do
  use GenServer

  # External API
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  # GenServer implementation
  def init(init_args) do
    IO.puts "MODULE NAME: #{__MODULE__}"
    {:ok, init_args}
  end

  def handle_call(:pop, _from, stack) do
    [elem | t] = stack
    {:reply, elem, t}
  end

  def handle_cast({:push, elem}, stack) do
    stack = stack ++ [elem]
    {:noreply, stack}
  end
end
