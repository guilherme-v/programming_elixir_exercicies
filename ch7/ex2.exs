# Write a max(list) that returns the element with the
# maximum value in the list. (This is slightly trickier
# than it sounds.)

defmodule Ex2 do
  def maxelem([head | tail]), do: _maxelem([head | tail], head)

  def _maxelem([], current_max), do: current_max
  def _maxelem([head | tail], current_max) when head >= current_max, do: _maxelem(tail, head)
  def _maxelem([head | tail], current_max) when head < current_max, do: _maxelem(tail, current_max)
end
