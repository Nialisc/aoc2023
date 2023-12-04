defmodule Aoc.Day3Test do
  use Aoc.Case

  @tag filename: "day3_part1.txt"
  test "part1/1 should return 4361", %{inputs: inputs} do
    assert Aoc.Day3.part1(inputs) == 4361
  end

  @tag filename: "day3_part2.txt"
  test "part2/1 should return 467835", %{inputs: inputs} do
    assert Aoc.Day3.part2(inputs) == 467_835
  end
end
