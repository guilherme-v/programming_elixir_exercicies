# Implement the following Enum functions using no library functions
# or list comprehensions: all?, each, filter, split, and take.
# You may need to use an if statement to implement filter.
# The syntax for this is

# if condition do expression(s)
# else
#       expression(s)
# end

defmodule ListAndRecursion5 do
  # all?
  def all?([], _), do: true
  def all?([h | t], func), do: _all?(t, func, func.(h))

  defp _all?(_, _func, false), do: false
  defp _all?([], _func, true), do: true
  defp _all?([h | t], func, true), do: _all?(t, func, func.(h))

  # each
  def each(enumerable, fun \\ fn x -> x end) when is_list(enumerable),
    do: _each(enumerable, fun)

  defp _each([], _), do: :ok

  defp _each([h | t], fun) do
    fun.(h)
    _each(t, fun)
  end

  # filter
  def filter(enumerable, fun \\ fn x -> x end) when is_list(enumerable),
    do: _filter(enumerable, fun)

  defp _filter([], _fun), do: []

  defp _filter([h | t], fun) do
    if fun.(h) do
      [h | _filter(t, fun)]
    else
      _filter(t, fun)
    end
  end

  # split
  def split(enumerable, size)
      when is_list(enumerable) and is_integer(size),
      do: _split(enumerable, [], size, [])

  defp _split([], cur_list, size, result)
       when length(cur_list) > 0 and length(cur_list) < size,
       do: result ++ [cur_list]

  defp _split([], cur_list, size, result)
       when length(cur_list) == 0,
       do: result

  defp _split([h | t], cur_list, size, result)
       when length(cur_list) < size,
       do: _split(t, cur_list ++ [h], size, result)

  defp _split(enumerable, cur_list, size, result)
       when length(cur_list) == size,
       do: _split(enumerable, [], size, result ++ [cur_list])
end
