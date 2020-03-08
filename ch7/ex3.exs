# An Elixir single-quoted string is actually a list of individual
# character codes. Write a caesar(list, n) function that adds n to
# each list element, wrapping if the addition results in a character
# greater than z.
# iex> MyList.caesar('ryvkve', 13)
# ?????? :)

defmodule Ex3 do
  def caesar([], _value), do: []

  # [a,z]
  def caesar([h | t], value)
      when h + value >= 65 and h + value <= 90,
      do: [h + value | caesar(t, value)]

  # [a,z] rotation
  def caesar([h | t], value)
      when h + value > 90 and h + value < 97,
      do: [64 + rem(h + value, 90) | caesar(t, value)]

  # [A,Z]
  def caesar([h | t], value)
      when h + value >= 97 and h + value <= 122,
      do: [h + value | caesar(t, value)]

  # [A,Z] rotation
  def caesar([h | t], value)
      when h + value > 122,
      do: [96 + rem(h + value, 122) | caesar(t, value)]
end
