defmodule StackApp.Stash do
  use GenServer

  # Client API
  def start_link(otps \\ []) do
    GenServer.start_link(__MODULE__, :ok, otps)
  end

  def save(stash_pid, state) do
    GenServer.cast(stash_pid, {:save, state})
  end

  def read(stash_pid) do
    GenServer.call(stash_pid, :read)
  end

  def print(stash_pid) do
    GenServer.call(stash_pid, :print)
  end

  # GenServer implementations
  @impl true
  def init(:ok) do
    {:ok, []}
  end

  @impl true
  def handle_call(:read, _from, cur_state) do
    {:reply, cur_state, cur_state}
  end

  @impl true
  def handle_call(:print, _from, cur_state) do
    {:reply, inspect(cur_state), cur_state}
  end

  @impl true
  def handle_cast({:save, state}, _cur_state) do
    {:noreply, state}
  end
end
