# Write a function MyList.span(from, to) that returns a list
# of the numbers from from up to to.

defmodule Ex4 do
  def span(from, to) when from == to, do: [to]
  def span(h = from, to), do: [h | span(from + 1, to)]
end
