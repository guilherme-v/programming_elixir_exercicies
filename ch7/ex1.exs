# Write a mapsum function that takes a list and a function.
# It applies the function to each element of the list and
# then sums the result, so:

# iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
# 14

defmodule Ex1 do
  def mapsum([head|tail], func), do: _mapsum([head|tail], 0, func)

  defp _mapsum([], total, _func), do: total
  defp _mapsum([head|tail], total, func), do: _mapsum(tail, total + func.(head), func)
end
