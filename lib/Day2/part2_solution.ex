defmodule Day2Part2Solution do
  def read_input do
    {:ok, text} = File.read("lib/Day2/input_part_2.txt") 
      text |> String.split("\n") |> split_dimensions |> calculate  
  end

  def split_dimensions(dimensions) do
    dimensions |> Enum.reduce([], fn(x,acc) -> 
              dimensions = x |> String.split("x") |> convert_dimensions 
              [dimensions|acc]
              end )  
  end

  def convert_dimensions([a,b,c]) do
    {elem(Integer.parse(a),0), elem(Integer.parse(b),0), elem( Integer.parse(c),0)}
  end
 
  def convert_dimensions(_) , do: {} 

  def calculate(dimensions) do
    dimensions |> Enum.reduce(0, fn(x,acc) -> 
                  d = calculate_wrapping(x)
                  acc + d
                  end
                  )
  end

  def calculate_wrapping({l,w,h}) do 
   wrap = [l ,w ,h ] 
   result = l * w * h
   result + calculate_perimeter(wrap) 
  end
  def calculate_wrapping(_), do: 0

  def calculate_perimeter([l,w,h]) when l >= w and l >= h , do: w+w + h+h
  def calculate_perimeter([l,w,h]) when w >= l and w >= h , do: l+l+h+h
  def calculate_perimeter([l,w,h]) when h >= w and h >= l , do: w+w+l+l

end
