defmodule Aoc.Day4Test do
  use Aoc.Case

  @tag filename: "day4_part1.txt"
  test "part1/1 should return 13", %{inputs: inputs} do
    assert Aoc.Day4.part1(inputs) == 13
  end

  @tag filename: "day4_part2.txt"
  test "part2/1 should return 30", %{inputs: inputs} do
    assert Aoc.Day4.part2(inputs) == 30
  end
end
