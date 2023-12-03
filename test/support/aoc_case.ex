defmodule Aoc.Case do
  use ExUnit.CaseTemplate

  @fixtures_path "test/support/fixtures"

  setup tags do
    {:ok, inputs: File.stream!("#{@fixtures_path}/#{tags[:filename]}")}
  end
end
