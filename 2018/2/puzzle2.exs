input = File.read!("input.txt") |> String.split
for id1 <- input do
  for id2 <- input do
    str1 = String.graphemes(id1)
    str2 = String.graphemes(id2)
    res = Enum.zip(str1, str2)
    |> Enum.count(fn {a,b} -> a != b end)

    if res == 1 do
      IO.puts id1
    end
  end
end
