# Write a function that takes three arguments. If the first two are zero, return “FizzBuzz.”
# If the first is zero, return “Fizz.” If the second is zero, return “Buzz.” Otherwise return the third argument.
# Do not use any language features that we haven’t yet covered in this book.

func = fn
  0, 0, c -> IO.write "FizzBuzz"
  0, b, c -> IO.write "Fizz"
  a, 0, c -> IO.write "Buzz"
  _, _, c -> IO.write "#{c}"
end

func.(0,0,123)
func.(0,"",{})
func.([],0,1.32)
func.(1,2,:bbb)
