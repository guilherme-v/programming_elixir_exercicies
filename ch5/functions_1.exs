
# – list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]
# – sum.(1, 2, 3) #=> 6
# – pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]

list_concat = fn list1, list2 -> list1 ++ list2 end
IO.puts "list_concat> #{inspect(list_concat.([:a, :b], [:c, :d]))}"
IO.puts "list_concat> #{inspect(list_concat.([:x], [123, "bla"]))}"


sum = fn a,b,c -> a + b + c end
IO.puts "sum> #{inspect(sum.(1,2,3))}"


pair_tuple_to_list = fn { a, b } -> [a, b] end
IO.puts "pair_tuple_to_list> #{inspect(pair_tuple_to_list.( {1234, 5678} ) )}"
