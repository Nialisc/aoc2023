defmodule Aoc.Case do
  use ExUnit.CaseTemplate

  @fixtures_path "test/support/fixtures"

  setup tags do
    {:ok,
     inputs:
       File.read!("#{@fixtures_path}/#{tags[:filename]}")
       |> String.split("\n")}
  end
end
