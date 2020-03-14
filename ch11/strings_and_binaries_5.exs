# Write a function that takes a list of dqs and prints each
# on a separate line, centered in a column that has the
# width of the longest string. Make sure it works with
# UTF characters.

# iex> center(["cat", "zebra", "elephant"])
#       cat
#      zebra
#     elephant

defmodule StringsAndBinaries5 do
  def center(words), do: _center(words)

  defp _center(words) do
    words_length = for w <- words, do: String.length(w)
    max_length = Enum.max(words_length)

    words
    |> Enum.zip(words_length)
    |> Enum.map(fn {w, len} -> String.pad_leading(w, len + div(max_length - len, 2)) end)
    |> Enum.map(fn w -> String.pad_trailing(w, max_length) end)
    |> Enum.each(&IO.puts/1)
  end
end
