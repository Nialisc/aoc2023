defmodule Aoc.Day3 do
  @behaviour Aoc

  @rxp_numbers ~r/([0-9]+)/
  @rxp_symbols ~r/([^\d\.])/

  def part1(inputs) do
    inputs
    |> Stream.map(&format/1)
    |> Stream.map(&dbg/1)
  end

  def part2(_inputs) do
    dbg("toto")
  end

  defp format(input) do
    number_pos =
      Regex.scan(@rxp_numbers, input, capture: :first, return: :index)
      |> Enum.map(&format_pos/1)

    symbol_pos =
      Regex.scan(@rxp_symbols, input, capture: :first, return: :index)
      |> Enum.map(&format_pos/1)

    {number_pos, symbol_pos}
  end

  defp format_pos([{start_pos, length}]) do
    end_pos = start_pos + (length - 1)
    {start_pos, end_pos}
  end
end
