defmodule Day1Part2Solution do
  def read_input do
    {:ok, text} = File.read("lib/Day1/input_part_2.txt") 
    text |> String.replace(~r/[\.,\n]/, "")  |> String.split("") |> Enum.reduce({0,0}, fn(x,acc) -> santa_step(x,acc) end ) 

  end

  defp santa_step(_, {pos,acc}) when acc <= -1  do
    { pos , acc}
  end

  defp santa_step("(", {pos,acc}) do
    { pos+1 , acc + 1}
  end

  defp santa_step(")", {pos , acc} ) do
    {pos + 1 , acc - 1}
  end
  

end
