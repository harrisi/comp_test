defmodule Mix.Tasks.Check.File do
  use Mix.Task

  # none of this will halt compilation, and we still see the warning from the
  # elixir compiler
  @impl true
  def run(_args) do
    Mix.shell().error("(shell) error from check.file")

    raise("error from check.file")

    System.halt(1)
  end
end
