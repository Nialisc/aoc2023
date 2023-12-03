defmodule Aoc.Day1 do
  @behaviour Aoc

  @rxp ~r/([0-9])/
  @rxp_part2 ~r/(?=([0-9]|one|two|three|four|five|six|seven|eight|nine))/

  def part1(inputs) do
    inputs
    |> Stream.map(&get(&1, @rxp))
    |> Stream.map(&format/1)
    |> Enum.sum()
  end

  def part2(inputs) do
    inputs
    |> Stream.map(&get(&1, @rxp_part2))
    |> Stream.map(&format/1)
    |> Enum.sum()
  end

  defp get(str, rxp), do: Regex.scan(rxp, str, capture: :all_but_first)

  defp format(findings) do
    [List.first(findings), List.last(findings)]
    |> Enum.map(&List.first/1)
    |> Enum.map(&map/1)
    |> Enum.join()
    |> String.to_integer()
  end

  defp map("one"), do: "1"
  defp map("two"), do: "2"
  defp map("three"), do: "3"
  defp map("four"), do: "4"
  defp map("five"), do: "5"
  defp map("six"), do: "6"
  defp map("seven"), do: "7"
  defp map("eight"), do: "8"
  defp map("nine"), do: "9"
  defp map(other), do: other
end
