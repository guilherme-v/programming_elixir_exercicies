defmodule StackApp do
  use GenServer

  # Client API
  def start_link({stash, opts}) do
    GenServer.start_link(__MODULE__, {:ok, stash}, opts)
  end

  def push(stack_pid, value) do
    GenServer.cast(stack_pid, {:push, value})
  end

  def pop(stack_pid) do
    GenServer.call(stack_pid, :pop)
  end

  def print(stack_pid) do
    GenServer.call(stack_pid, :print)
  end

  def stop(stack_pid) do
    # If a process terminates with a reason different than :normal,
    # all linked processes receive an EXIT signal, causing the linked
    # process to also terminate unless it is trapping exits.
    # We can then trap the EXIT when testing: Process.flag(:trap_exit, true)
    GenServer.stop(stack_pid, :shutdown)
  end

  # GenServer implementations
  @impl true
  def init({:ok, stash}) do
    recovered_state = StackApp.Stash.read(stash)
    {:ok, {recovered_state, stash}}
  end

  @impl true
  def handle_call(:print, _from, state) do
    {:reply, inspect(state), state}
  end

  @impl true
  def handle_call(:pop, _from, {[top | rest], stash}) do
    {:reply, top, {rest, stash}}
  end

  @impl true
  def handle_cast({:push, value}, {cur_state, stash}) do
    {:noreply, {[value | cur_state], stash}}
  end

  @impl true
  def terminate(_reason, {cur_state, stash}) do
    StackApp.Stash.save(stash, cur_state)
  end
end
