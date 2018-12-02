defmodule Puzzle2 do
  def process([head | tail], acc, frequencies, original_input) do
    if MapSet.member?(frequencies, head + acc) do
      head + acc
    else
      frequencies = MapSet.put(frequencies, head + acc)
      process(tail, head + acc, frequencies, original_input)
    end
  end

  def process([], acc, frequencies, original_input) do
    process(original_input, acc, frequencies, original_input)
  end
end

input = File.read!("input.txt")
|> String.split
|> Enum.map(&String.to_integer/1)

Puzzle2.process(input, 0, MapSet.new, input)
|> IO.inspect
