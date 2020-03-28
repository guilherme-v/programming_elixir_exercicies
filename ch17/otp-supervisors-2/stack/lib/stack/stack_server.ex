defmodule Stack.Server do
  use GenServer

  # External API
  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def push(elem) do
    GenServer.cast(__MODULE__, {:push, elem})
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  # GenServer implementation
  def init(stash_pid) do
    stack = Stack.Stash.get_value(stash_pid)
    {:ok, {stack, stash_pid}}
  end

  def handle_cast({:push, elem}, {stack, stash_pid}) when is_integer(elem) and elem < 10 do
    IO.puts("Forced error!")
    raise RuntimeError
  end

  def handle_cast({:push, elem}, {stack, stash_pid}) do
    stack = stack ++ [elem]
    {:noreply, {stack, stash_pid}}
  end

  def handle_call(:pop, _from, {stack, stash_pid}) do
    [e | t] = stack
    {:reply, e, {t, stash_pid}}
  end

  def terminate(_reason, {stack, stash_pid}) do
    Stack.Stash.save_value(stash_pid, stack)
  end
end
