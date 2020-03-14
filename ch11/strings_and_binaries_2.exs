# Write an anagram?(word1, word2) that returns
# true if its parameters are anagrams.

defmodule StringsAndBinaries2 do

  def is_anagram_easy?(word1, word2) when is_list(word1) and is_list(word2) do
    length(word1 -- word2) == 0 && length(word2 -- word1) == 0
  end

  def is_anagram?(word1, word2)
      when is_list(word1) and is_list(word2) do
    freq_table = for c <- 0..128, into: Map.new(), do: {c, 0}

    freq_table
    |> _increment(word1)
    |> _decrement(word2)
    |> _has_only_zeros?
  end

  defp _increment(table, []), do: table
  defp _increment(table, [char | t]), do: _increment(%{table | char => table[char] + char}, t)

  defp _decrement(table, []), do: table
  defp _decrement(table, [char | t]), do: _decrement(%{table | char => table[char] - char}, t)

  defp _has_only_zeros?(table), do: Enum.all?(table, fn {_k, v} -> v == 0 end)

end
