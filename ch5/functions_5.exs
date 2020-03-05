# Use the &... notation to rewrite the following.
# – Enum.map [1,2,3,4], fn x -> x + 2 end
# – Enum.each [1,2,3,4], fn x -> IO.inspect x end

# map_add_two_2 = &(Enum.map(&1, fn x -> x + 2 end))
# OR
add_two = &(&1 + 2)
map_add_two = &(Enum.map(&1, add_two))
IO.puts "#{inspect(map_add_two.([1,2,3,4]))}"

# print_each = &(Enum.each(&1, fn x -> IO.inspect x end))
# OR
ins = &IO.inspect/1
print_each = &(Enum.each(&1, ins))
print_each.([1,2,3,4])

# 1 - Create a function that transform some input
# 2 - Plug that back in another
