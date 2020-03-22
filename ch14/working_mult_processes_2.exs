# Write a program that spawns two processes and then passes each a
# unique token (for example, “fred” and “betty”).
# Have them send the tokens back.
# – Is the order in which the replies are received deterministic in theory? In practice?
# – If either answer is no, how could you make it so?

# The replies are NOT deterministic, but in practice p1 respondes first
# p1 and p2 spawn/3 calls only CREATE new processes
# They will then wait for a arriving message into their mail boxes
# Once the message arrives they responde back to the original process
# In other words, there is a lot going on:
# - Multiple process running in parallel (3)
# - Inter process communication
# - S.O scheduler
# - and others
# all this can cause the order of the response be different

# To make it consistent we can:
# - Make the parent process coordinate the messages
# - Make one process communicate with each other, after processing the message
# - and others...

defmodule Eco do
  def eco do
    receive do
      {sender, token} ->
        IO.puts("Process received: #{token}")
        send(sender, token)
    end
  end

  def run() do
    spawn_processes()
    await_responses()
  end

  def spawn_processes() do
    p1 = spawn(Eco, :eco, [])
    p2 = spawn(Eco, :eco, [])

    send(p1, {self(), "fred"})
    send(p2, {self(), "betty"})
  end

  def await_responses() do
    receive do
      token ->
        IO.puts("Response is: #{token}")
        await_responses()
    after
      3000 ->
        IO.puts("Finish")
    end
  end
end
