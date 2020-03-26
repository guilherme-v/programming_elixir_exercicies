# You’re going to start creating a server that implements a stack. The call that initializes your stack will pass in a list of the initial stack contents.
# For now, implement only the pop interface. It’s acceptable for your server to crash if someone tries to pop from an empty stack.
# For example, if initialized with [5,"cat",9], successive calls to pop will return 5, "cat", and 9.

defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, stack) do
    [elem | t] = stack
    {:reply, elem, t}
  end
end
