# Implement and run a function sum(n) that uses recursion to calculate
# the sum of the integers from 1 to n. You’ll need to write this function
# inside a module in a separate file. Then load up iex, compile that file,
# and try your function.

defmodule Sum do
  def of(0), do: 0
  def of(n), do: n + of(n-1)
end
