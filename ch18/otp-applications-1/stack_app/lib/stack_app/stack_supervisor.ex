defmodule StackApp.StackSupervisor do
  use Supervisor

  # Client API
  def start_link({stash, otps}) do
    Supervisor.start_link(__MODULE__, {:ok, stash}, otps)
  end

  # Supervisor impl
  @impl true
  def init({:ok, stash}) do
    children = [
      {StackApp, {stash, [name: Stack]}}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
