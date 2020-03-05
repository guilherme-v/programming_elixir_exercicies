# The operator rem(a, b) returns the remainder after dividing a by b.
# Write a function that takes a single integer (n) and calls the function
# in the previous exercise, passing it rem(n,3), rem(n,5), and n. Call it
# seven times with the arguments 10, 11, 12, and so on.
# You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

func = fn
  0,0,_ -> "FizzBuzz"
  0,_,_ -> "Fizz"
  _,0,_ -> "Buzz"
  _,_,c -> "#{c}"
end

func3 = fn n ->
  func.(rem(n,3), rem(n,5), n)
end

IO.puts "#{func3.(10)}, #{func3.(11)}, #{func3.(12)}, #{func3.(13)}, #{func3.(14)}, #{func3.(15)}, #{func3.(16)}."
