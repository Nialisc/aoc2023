defmodule Aoc.Day4 do
  @behaviour Aoc

  def part1(inputs) do
    inputs
    |> Stream.map(&format/1)
    |> Stream.map(&calculate/1)
    |> Enum.sum()
  end

  def part2(_) do
    dbg("todo")
  end

  defp format(input) do
    [_, card] = String.split(input, ":", trim: true)
    [winnings, numbers] = String.split(card, "|", trim: true)
    {format_numbers(winnings), format_numbers(numbers)}
  end

  defp format_numbers(str), do: String.split(str, " ", trim: true)

  defp calculate({winnings, numbers}) do
    MapSet.intersection(Enum.into(winnings, MapSet.new()), Enum.into(numbers, MapSet.new()))
    |> MapSet.to_list()
    |> length()
    |> attribute_points()
  end

  defp attribute_points(0), do: 0
  defp attribute_points(n), do: attribute_points(n - 1, 1)
  defp attribute_points(0, acc), do: acc
  defp attribute_points(n, acc), do: attribute_points(n - 1, acc * 2)
end
