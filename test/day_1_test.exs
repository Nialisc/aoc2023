defmodule Aoc.Day1Test do
  use Aoc.Case

  @tag filename: "day1_part1.txt"
  test "part1/1 should return 142 with the given inputs", %{inputs: inputs} do
    assert Aoc.Day1.part1(inputs) == 142
  end

  @tag filename: "day1_part2.txt"
  test "part2/1 should return 281 with the given inputs", %{inputs: inputs} do
    assert Aoc.Day1.part2(inputs) == 281
  end
end
