# Find the library functions to do the following, and then use each in iex.
# (If the word Elixir or Erlang appears at the end of the challenge, then
# you’ll find the answer in that set of libraries.)

# – Convert a float to a string with two decimal digits. (Erlang)
# – Get the value of an operating-system environment variable. (Elixir)
# – Return the extension component of a file name (so return .exs if given
#   "dave/test.exs"). (Elixir)
# – Return the process’s current working directory. (Elixir)
# – Convert a string containing JSON into Elixir data structures. (Just
#   find; don’t install.)
# – Execute a command in your operating system’s shell.

defmodule Ex7 do
  def float_to_string(n), do: :io.format("~.2f~n", [n]) # ~F.P.PadModC. https://erlang.org/doc/man/io.html#fwrite-3

  def os_env(name), do: System.get_env(name) # https://hexdocs.pm/elixir/System.html#get_env/2

  def file_ext(file_path), do: Path.extname(file_path)

  def current_dir, do: System.cwd()

  def execute(cmd, args \\ []), do: System.cmd(cmd, args) # https://hexdocs.pm/elixir/System.html#cmd/3
end
