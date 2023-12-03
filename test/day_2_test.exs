defmodule Aoc.Day2Test do
  use Aoc.Case

  @tag filename: "day2_part1.txt"
  test "part1/1 should return 8", %{inputs: inputs} do
    assert Aoc.Day2.part1(inputs) == 8
  end
end
