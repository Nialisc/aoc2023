defmodule Aoc.Day2 do
  @behaviour Aoc

  def part1(inputs) do
    inputs
    |> Stream.map(&format_game/1)
    |> Stream.filter(&is_possible?(&1, %{red: 12, green: 13, blue: 14}))
    |> Stream.map(fn {id, _} -> id end)
    |> Enum.sum()
  end

  def part2(_inputs) do
    dbg("todo")
  end

  # Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
  defp format_game(game) do
    [id, scores] =
      game
      |> String.replace(";", ",")
      |> String.replace("Game ", "")
      |> String.replace("\n", "")
      |> String.split(":", trim: true)

    scores =
      String.split(scores, ",", trim: true)
      |> Enum.map(&String.split(&1, " ", trim: true))
      |> Enum.map(fn [number, color] -> {color, String.to_integer(number)} end)

    {String.to_integer(id), scores}
  end

  defp is_possible?({_, scores}, %{red: red, green: green, blue: blue}) do
    Enum.all?(scores, fn {color, number} ->
      case color do
        "blue" -> number <= blue
        "green" -> number <= green
        "red" -> number <= red
      end
    end)
  end
end
