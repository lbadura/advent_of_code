defmodule Puzzle1 do
  def occurences_with_count?(data, count) do
    Puzzle1.occurences(data)
    |> Enum.any?(fn {_, occurences} -> occurences == count end)
  end

  def occurences(id) do
    id
    |> String.graphemes
    |> Enum.reduce(%{}, fn char, acc ->
      Map.put(acc, char, (acc[char] || 0) + 1)
    end)
  end
end

input = File.read!("input.txt") |> String.split

twos = input |> Enum.count(&Puzzle1.occurences_with_count?(&1, 2))
threes = input |> Enum.count(&Puzzle1.occurences_with_count?(&1, 3))

IO.puts(twos * threes)
