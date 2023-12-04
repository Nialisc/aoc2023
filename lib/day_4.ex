defmodule Aoc.Day4 do
  @behaviour Aoc

  def part1(inputs) do
    inputs
    |> Stream.with_index()
    |> Stream.map(&format/1)
    |> Stream.map(&calculate/1)
    |> Enum.sum()
  end

  def part2(inputs) do
    inputs
    |> Stream.with_index()
    |> Stream.map(&format/1)
    |> Enum.map_reduce(%{}, &calculate_part2/2)
    |> Tuple.to_list()
    |> List.first()
    |> Enum.sum()
  end

  defp format({input, i}) do
    [_, card] = String.split(input, ":", trim: true)
    [winnings, numbers] = String.split(card, "|", trim: true)
    {i, format_numbers(winnings), format_numbers(numbers)}
  end

  defp format_numbers(str), do: String.split(str, " ", trim: true)

  defp calculate({_, winnings, numbers}) do
    intersection_length(winnings, numbers)
    |> attribute_points()
  end

  defp calculate_part2({index, winnings, numbers}, acc) do
    n = Map.get(acc, index, 0) + 1

    acc =
      case intersection_length(winnings, numbers) do
        0 ->
          acc

        w ->
          adds = (index + 1)..(index + w)

          Enum.reduce(adds, acc, fn next_i, acc ->
            Map.update(acc, next_i, n, &(&1 + n))
          end)
      end

    {n, acc}
  end

  defp intersection_length(winnings, numbers) do
    MapSet.intersection(Enum.into(winnings, MapSet.new()), Enum.into(numbers, MapSet.new()))
    |> MapSet.to_list()
    |> length()
  end

  defp attribute_points(0), do: 0
  defp attribute_points(n), do: attribute_points(n - 1, 1)
  defp attribute_points(0, acc), do: acc
  defp attribute_points(n, acc), do: attribute_points(n - 1, acc * 2)
end
