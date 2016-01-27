defmodule Day1Part1Solution do
  def read_input do
    {:ok, text} = File.read("lib/Day1/input_part_1.txt") 
    text |> String.replace(~r/[\.,\n]/, "")  |> String.split("") |> Enum.reduce(0, fn(x,acc) -> santa_step(x,acc) end ) 
  end

  defp santa_step("(", acc) do
    acc + 1
  end

  defp santa_step(")", acc) do
    acc - 1
  end
  
  defp santa_step(_,acc) do
    acc
  end

end
