# I defined our sum function to carry a partial total as a second
# parameter so I could illustrate how to use accumulators to build
# values. The sum function can also be written without an accumulator.
# Can you do it?

defmodule MyList do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end
