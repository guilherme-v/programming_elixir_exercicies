# Write a function that returns true if a single-quoted
# string contains only printable ASCII characters (space through tilde).

# iex(5)> StringsAndBinaries.is_printable?('asdf' ++ [0])
# false
# iex(6)> StringsAndBinaries.is_printable?('asdf0')
# true

defmodule StringsAndBinaries do

  def is_printable?(enumerable)
      when is_list(enumerable),
      do: _is_printable(enumerable)

  defp _is_printable([]), do: true
  defp _is_printable([char | t]) when char in ?\s..?~, do: _is_printable(t)
  defp _is_printable([not_printable_char | _]), do: false
end
