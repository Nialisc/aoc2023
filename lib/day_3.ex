defmodule Aoc.Day3 do
  @behaviour Aoc

  @rxp_numbers ~r/([0-9]+)/
  @rxp_symbols ~r/([^\d\.])/
  @rxp_gear ~r/([\*])/

  def part1(inputs) do
    Stream.concat([[nil], inputs, [nil]])
    |> Stream.map(&format(&1, @rxp_symbols))
    |> Stream.chunk_every(3, 1, :discard)
    |> Enum.reduce(%{}, &get_numbers/2)
    |> Map.values()
    |> Enum.sum()
  end

  def part2(inputs) do
    Stream.concat([[nil], inputs, [nil]])
    |> Stream.map(&format(&1, @rxp_gear))
    |> Stream.chunk_every(3, 1, :discard)
    |> Enum.reduce([], &get_ratios/2)
    |> Enum.sum()
  end

  defp format(nil, _), do: {[], []}

  defp format(input, rxp_symbols) do
    number_pos =
      Regex.scan(@rxp_numbers, input, capture: :first, return: :index)
      |> Enum.map(&format_pos(&1, input))
      |> Enum.reduce(%{}, fn el, acc -> Map.merge(el, acc) end)

    symbol_pos =
      Regex.scan(rxp_symbols, input, capture: :first, return: :index)
      |> Enum.map(fn [{start_pos, _length}] -> start_pos end)

    output =
      input
      |> String.split("", trim: true)
      |> Enum.with_index()
      |> Enum.map(fn {_, i} -> Map.get(number_pos, i) end)

    {output, symbol_pos}
  end

  defp format_pos([{start_pos, length}], input) do
    end_pos = start_pos + (length - 1)

    id = "id_#{System.unique_integer([:positive])}"

    number =
      String.slice(input, start_pos, length)
      |> String.to_integer()

    Enum.reduce(start_pos..end_pos, %{}, fn i, acc ->
      Map.put_new(acc, i, {id, number})
    end)
  end

  defp get_numbers([_, {_, []}, _], acc), do: acc

  defp get_numbers([{prev, _} = p, {items, [i | rest]}, {next, _} = n], acc) do
    acc =
      Enum.reduce(max(i - 1, 0)..(i + 1), acc, fn j, acc ->
        acc
        |> append_number(Enum.at(prev, j))
        |> append_number(Enum.at(items, j))
        |> append_number(Enum.at(next, j))
      end)

    get_numbers([p, {items, rest}, n], acc)
  end

  defp append_number(acc, nil), do: acc
  defp append_number(acc, {id, num}), do: Map.put(acc, id, num)

  defp get_ratios([_, {_, []}, _], acc), do: acc

  defp get_ratios([{prev, _} = p, {items, [i | rest]}, {next, _} = n], acc) do
    nums =
      Enum.reduce(max(i - 1, 0)..(i + 1), %{}, fn j, a ->
        a
        |> append_number(Enum.at(prev, j))
        |> append_number(Enum.at(items, j))
        |> append_number(Enum.at(next, j))
      end)
      |> Map.values()

    acc =
      case length(nums) do
        2 -> [Enum.product(nums) | acc]
        _ -> acc
      end

    get_ratios([p, {items, rest}, n], acc)
  end
end
