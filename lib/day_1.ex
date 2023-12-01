defmodule Aoc.Day1 do
  @behaviour Aoc

  @rxp ~r/([0-9])/
  @rxp_forward ~r/([0-9]|one|two|three|four|five|six|seven|eight|nine)/
  @rxp_backward ~r/([0-9]|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)/

  def part1(inputs) do
    inputs
    |> Enum.map(fn str -> [get(str, @rxp), get(String.reverse(str), @rxp)] end)
    |> Enum.map(&format/1)
    |> Enum.reduce(0, fn el, acc -> acc + el end)
  end

  def part2(inputs) do
    inputs
    |> Enum.map(fn str -> [get(str, @rxp_forward), get(String.reverse(str), @rxp_backward)] end)
    |> Enum.map(&format/1)
    |> Enum.reduce(0, fn el, acc -> acc + el end)
  end

  defp get(str, rxp), do: Regex.run(rxp, str, capture: :first)

  defp format([[first], [last]]) do
    [map(first), map(last)]
    |> Enum.join()
    |> String.to_integer()
  end

  defp map(str) do
    case str do
      v when v in ["one", "eno"] -> "1"
      v when v in ["two", "owt"] -> "2"
      v when v in ["three", "eerht"] -> "3"
      v when v in ["four", "ruof"] -> "4"
      v when v in ["five", "evif"] -> "5"
      v when v in ["six", "xis"] -> "6"
      v when v in ["seven", "neves"] -> "7"
      v when v in ["eight", "thgie"] -> "8"
      v when v in ["nine", "enin"] -> "9"
      other -> other
    end
  end
end
