defmodule Stack.SubSupervisor do
  use Supervisor

  def start_link(stash) do
    {:ok, _pid} = Supervisor.start_link(__MODULE__, stash)
  end

  def init(stash) do
    children = [worker(Stack.Server, [stash])]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
