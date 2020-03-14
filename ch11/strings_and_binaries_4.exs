# (Hard) Write a function that takes a single-quoted string
# of the form number [+-*/] number and returns the result of
# the calculation. The indi- vidual numbers do not have leading
# plus or minus signs.

# calculate('123 + 27') # => 150

defmodule StringsAndBinaries4 do
  def calculate(enumerable)
      when is_list(enumerable),
      do: _calculate(enumerable, 0)

  defp _calculate([digit | t], result)
       when digit in '0123456789',
       do: _calculate(t, result * 10 + digit - ?0)

  defp _calculate([?\s | t], value), do: _calculate(t, value)
  defp _calculate([?+ | t], value), do: value + _calculate(t,0)
  defp _calculate([?- | t], value), do: value - _calculate(t,0)
  defp _calculate([?* | t], value), do: value * _calculate(t,0)
  defp _calculate([?/ | t], value), do: value / _calculate(t,0)
  defp _calculate([], value), do: value
end
