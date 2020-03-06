# Write a function gcd(x,y) that finds the greatest common divisor
# between two nonnegative integers. Algebraically, gcd(x,y) is x
# if y is zero; it’s gcd(y, rem(x,y)) otherwise.

defmodule GCD do
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x,y))
end
