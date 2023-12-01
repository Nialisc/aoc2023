defmodule Aoc.Day1 do
  @behaviour Aoc

  def part1(inputs) do
    inputs
    |> Enum.map(&parse_numbers/1)
    |> Enum.reduce(0, fn el, acc -> acc + el end)
  end

  def part2(inputs) do
    inputs
    |> Enum.map(&parse_text_numbers/1)
    |> part1()
  end

  defp parse_numbers(str) do
    numbers =
      Regex.scan(~r/([0-9])/, str, capture: :first)
      |> Enum.map(&List.first/1)

    [first, last] = [List.first(numbers), List.last(numbers)]
    String.to_integer("#{first}#{last}")
  end

  defp parse_text_numbers(str) do
    Regex.replace(~r/(one|two|three|four|five|six|seven|eight|nine)/, str, fn _, x ->
      case x do
        "one" -> "1"
        "two" -> "2"
        "three" -> "3"
        "four" -> "4"
        "five" -> "5"
        "six" -> "6"
        "seven" -> "7"
        "eight" -> "8"
        "nine" -> "9"
      end
    end)
  end
end
