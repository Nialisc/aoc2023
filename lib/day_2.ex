defmodule Aoc.Day2 do
  @behaviour Aoc

  def part1(inputs) do
    inputs
    |> Stream.map(&format/1)
    |> Stream.filter(&is_possible?(&1, %{"red" => 12, "green" => 13, "blue" => 14}))
    |> Stream.map(fn {id, _} -> id end)
    |> Enum.sum()
  end

  def part2(inputs) do
    inputs
    |> Stream.map(&format/1)
    |> Stream.map(&get_power/1)
    |> Enum.sum()
  end

  defp format(game) do
    [id, scores] =
      game
      |> String.replace(";", ",")
      |> String.replace("Game ", "")
      |> String.split(":", trim: true)

    scores =
      String.split(scores, ",", trim: true)
      |> Enum.map(&String.split(&1, " ", trim: true))
      |> Enum.map(fn [number, color] -> {color, String.to_integer(number)} end)

    {String.to_integer(id), scores}
  end

  defp is_possible?({_, scores}, max) do
    Enum.all?(scores, fn {color, number} -> number <= max[color] end)
  end

  defp get_power({_, scores}) do
    scores
    |> Enum.reduce(%{"red" => 0, "green" => 0, "blue" => 0}, fn {color, number}, max ->
      val = if max[color] >= number, do: max[color], else: number
      %{max | color => val}
    end)
    |> Map.values()
    |> Enum.product()
  end
end
