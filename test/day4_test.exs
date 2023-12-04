defmodule Aoc.Day4Test do
  use Aoc.Case

  @tag filename: "day4_part1.txt"
  test "part1/1 should return 13", %{inputs: inputs} do
    assert Aoc.Day4.part1(inputs) == 13
  end
end
