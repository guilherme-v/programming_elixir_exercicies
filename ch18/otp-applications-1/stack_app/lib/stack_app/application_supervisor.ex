defmodule StackApp.ApplicationSupervisor do
  use Supervisor

  # Client API
  def start_link(opts) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, :ok, opts)
    start_workers(sup)
    result
  end

  def start_workers(sup) do
    {:ok, stash} = Supervisor.start_child(sup, {StackApp.Stash, name: Stash})

    sup_spec = Supervisor.child_spec({StackApp.StackSupervisor, {stash, name: StackSupervisor}}, type: :supervisor)
    Supervisor.start_child(sup, sup_spec)
  end

  # Supervisor impl
  @impl true
  def init(:ok) do
    Supervisor.init([], strategy: :one_for_one)
  end
end
