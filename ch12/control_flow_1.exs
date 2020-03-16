# Rewrite the FizzBuzz example using case.

# In the game of FizzBuzz, children count up from 1.
# If the number is a multiple of three, they say “Fizz.”
# For multiples of five, they say “Buzz.”
# For multiples of both, they say “FizzBuzz.”
# Otherwise, they say the number.

defmodule ControlFlow1 do
  def up_to(n) when n > 0 do
    _up_to(1, n, [])
  end

  defp _up_to(cur, n, result) when cur > n, do: Enum.reverse(result)

  defp _up_to(cur, n, result) do
    div_by = %{tree: rem(cur, 3) == 0, five: rem(cur, 5) == 0}

    case div_by do
      %{tree: true, five: true} -> _up_to(cur + 1, n, ["FizzBuzz" | result])
      %{tree: true, five: false} -> _up_to(cur + 1, n, ["Fizz" | result])
      %{tree: false, five: true} -> _up_to(cur + 1, n, ["Buzz" | result])
      _ -> _up_to(cur + 1, n, [cur | result])
    end
  end
end
