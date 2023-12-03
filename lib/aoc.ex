defmodule Aoc do
  @callback part1(list(String.t())) :: any
  @callback part2(list(String.t())) :: any

  defp read_file(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
  end

  def run(day, part) do
    module = String.to_existing_atom("Elixir.Aoc.Day#{day}")
    function = String.to_existing_atom("part#{part}")
    inputs = read_file("inputs/day#{day}_part#{part}.txt")

    apply(module, function, [inputs])
  end
end
