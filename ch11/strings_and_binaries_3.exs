# Try the following in iex:
# iex> [ 'cat' | 'dog' ]
# ['cat',100,111,103]
# Why does iex print 'cat' as a string, but 'dog' as individual numbers?

# We split between HEAD and TAIL using Pipe '|'
# When doing it the HEAD will hold a 'VALUE'
# and the tail will hold a 'LIST'.
# iex tries to print the HEAD's value, but given it its a
# list of only printable characters code it prints its char codes
# instead of the integers representations
