# Repeat the two, changing spawn_link to spawn_monitor.

# Link:
# When linking the parent was gone with it's chield, so it was unable to proccess the chield answer
# It happened both to Excepion as to Exit

# ➜  ch14 git:(master) ✗ elixir -r "working_mult_processes_5.exs" -e "Processes.run_link_with_exception()"
# Linking: #PID<0.98.0>
# #PID<0.98.0> -> Sending answer
# ** (EXIT from #PID<0.92.0>) an exception was raised:
#     ** (RuntimeError) runtime error
#         working_mult_processes_5.exs:18: Processes.func_that_throws/1

# ➜  ch14 git:(master) ✗ elixir -r "working_mult_processes_5.exs" -e "Processes.run_link_with_exit()"
# Linking: #PID<0.98.0>
# #PID<0.98.0> -> Sending answer
# ** (EXIT from #PID<0.92.0>) :any_reason


# Monitor:
# Both to Exception and Exit, the parent process get notified: :DOWN

# ➜  ch14 git:(master) ✗ elixir -r "working_mult_processes_5.exs" -e "Processes.run_monitor_with_exception()"
#PID<0.98.0> -> Sending answer
# Monitoring: {#PID<0.98.0>, #Reference<0.1396100127.1836843018.63062>}
#
# 22:28:21.073 [error] Process #PID<0.98.0> raised an exception
# ** (RuntimeError) runtime error
#     working_mult_processes_5.exs:18: Processes.func_that_throws/1
# MSG Received: "message from func_that_throws"
# MSG Received: {:DOWN, #Reference<0.1396100127.1836843018.63062>, :process, #PID<0.98.0>, {%RuntimeError{message: "runtime error"}, [{Processes, :func_that_throws, 1, [file: 'working_mult_processes_5.exs', line: 18]}]}}
#
# ➜  ch14 git:(master) ✗ elixir -r "working_mult_processes_5.exs" -e "Processes.run_monitor_with_exit()"
# #PID<0.98.0> -> Sending answer
# Monitoring: {#PID<0.98.0>, #Reference<0.1252774624.1299972110.43097>}
# MSG Received: "message from func_that_exits"
# MSG Received: {:DOWN, #Reference<0.1252774624.1299972110.43097>, :process, #PID<0.98.0>, :any_reason}

defmodule Processes do
  import :timer, only: [sleep: 1]

  def func_that_exits(sender) do
    send(sender, "message from func_that_exits")
    IO.puts("#{inspect(self())} -> Sending answer")
    exit(:any_reason)
  end

  def func_that_throws(sender) do
    send(sender, "message from func_that_throws")
    IO.puts("#{inspect(self())} -> Sending answer")
    raise RuntimeError
  end

  def run_monitor_with_exit do
    res = spawn_monitor(Processes, :func_that_exits, [self()])
    IO.puts("Monitoring: #{inspect(res)}")
    sleep(500)
    wait_answer()
  end

  def run_monitor_with_exception do
    res = spawn_monitor(Processes, :func_that_throws, [self()])
    IO.puts("Monitoring: #{inspect(res)}")
    sleep(500)
    wait_answer()
  end

  def run_link_with_exit do
    res = spawn_link(Processes, :func_that_exits, [self()])
    IO.puts("Linking: #{inspect(res)}")
    sleep(500)
    wait_answer()
  end

  def run_link_with_exception do
    res = spawn_link(Processes, :func_that_throws, [self()])
    IO.puts("Linking: #{inspect(res)}")
    sleep(500)
    wait_answer()
  end

  def wait_answer do
    receive do
      msg ->
        IO.puts("MSG Received: #{inspect(msg)}")
        wait_answer()
    end
  end
end
