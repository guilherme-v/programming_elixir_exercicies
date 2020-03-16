# We now have three different implementations of FizzBuzz.
#
# One uses cond, one uses case, and one uses separate functions with guard clauses.
# Take a minute to look at all three. Which do you feel best expresses the problem.
# Which will be easiest to maintain?

# The case style and the implementation using guard clauses are different from
# control structures in most other languages. If you feel that one of these
# was the best implementation, can you think of ways to remind yourself to
# investigate these options as you write Elixir code in the future?

# OP1
defmodule FizzBuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) do
    cond do
      rem(n, 3) == 0 and rem(n, 5) == 0 ->
        "FizzBuzz"
      rem(n, 3) == 0 ->
        "Fizz"
      rem(n, 5) == 0 ->
        "Buzz"
      true ->
        n
    end
  end
end

# OP2
defmodule FizzBuzz2 do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n)  when rem(n, 3) == 0 and rem(n, 5) == 0, do: "FizzBuzz"
  defp fizzbuzz(n)  when rem(n, 3) == 0, do: "Fizz"
  defp fizzbuzz(n)  when rem(n, 5) == 0, do: "Buzz"
  defp fizzbuzz(n), do:  n
end

# OP3
defmodule FizzBuzz3 do
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

#OP1 seems closer to usual Oriented Programming style, using the 'conventinal style'
#OP2 is probably the best one, it is all about make transformations and using matching pattern, not about checking conditions
#OP3 seems to be good to extract data from maps, not to transforming inputs
