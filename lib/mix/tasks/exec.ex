defmodule Mix.Tasks.Exec do
  use Mix.Task

  @impl Mix.Task
  def run(args) do
    [day, part] = args

    Aoc.run(day, part)
    |> IO.puts()
  end
end
