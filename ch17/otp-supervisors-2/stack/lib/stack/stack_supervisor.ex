defmodule Stack.Supervisor do
  use Supervisor

  def start_link(initial_stack) do
    # https://hexdocs.pm/elixir/Supervisor.html#start_link/3
    # start_link/3 Starts a module-based supervisor process with the given module and init_arg.
    # init/1 callback will be invoked in the given module, with init_arg as its argument.
    # It must return a supervisor specification which can be created with the help of the init/2 function.
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_stack])
    start_workers(sup, initial_stack)
    result
  end

  def start_workers(sup, initial_stack) do
    {:ok, stash} = Supervisor.start_child(sup, worker(Stack.Stash, [initial_stack]))
    {:ok, _subsup} = Supervisor.start_child(sup, supervisor(Stack.SubSupervisor, [stash]))
  end

  def init(_) do
    children = [] # initially empty, we will fill it manually

    # https://hexdocs.pm/elixir/Supervisor.html#init/2
    # Receives a list of children to initialize and a set of options
    # :one_for_one - if a child process terminates, only that process is restarted.
    Supervisor.init(children, strategy: :one_to_one)
  end
end
