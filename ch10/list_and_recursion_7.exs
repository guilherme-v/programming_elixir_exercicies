# In the last exercise of Chapter 7, Lists and Recursion, on page 61,
# you wrote a span funtion. Use it and list comprehensions to return
# a list of the prime numbers from 2 to n.

defmodule ListAndRecursion7 do
  def span(from, to) when is_integer(from) and is_integer(to),
    do: _span(from, to)

  defp _span(from, to) when from > to, do: []
  defp _span(from, to), do: [from | _span(from + 1, to)]

  def primes(n) when is_integer(n),
    do: _primes(2, n)

  # NOT efficient at all :)
  defp _primes(from, to) do
    divisors = for x <- span(from, to), n <- 2..x, n <= x, rem(x, n) == 0, do: x
    divisors
    |> Enum.frequencies()
    |> Enum.reject(fn {_, v} -> v > 1 end) # we could have used :map.filter -> https://stackoverflow.com/questions/44145893/efficient-way-to-filter-a-map-by-value-in-elixir
    |> Enum.map(fn {k, _} -> k end)
  end
end
