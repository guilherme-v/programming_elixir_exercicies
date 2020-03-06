# Add a quadruple function. (Maybe it could call the double function....)

defmodule Times do
  def double(n) do
    n * 2
  end

  def quadruple(n) do
    double(double(n))
  end
end
