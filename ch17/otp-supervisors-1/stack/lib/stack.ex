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
  def init(init_arg) do
    {:ok, init_arg}
  end

  def handle_cast({:push, elem}, _stack) when is_integer(elem) and elem < 10 do
    IO.puts("Halt!")
    System.halt()
  end

  def handle_cast({:push, elem}, stack) do
    stack = stack ++ [elem]
    {:noreply, stack}
  end

  def handle_call(:pop, _from, stack) do
    [e | t] = stack
    {:reply, e, t}
  end

  def terminate(reason, _stack) do
    IO.puts("TERMINATE: #{inspect(reason)}")
  end
end
