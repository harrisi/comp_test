defmodule Mix.Tasks.Compile.FooTwo do
  use Mix.Task.Compiler

  @impl true
  def run(_args) do
    IO.inspect("compiling")

    Mix.Task.Compiler.after_compiler(:foo, &my_after/1)

    {:ok, [
      %Mix.Task.Compiler.Diagnostic{
        compiler_name: "foo_two",
        details: "details",
        file: ".",
        message: "message",
        position: 0,
        severity: :warning,
        stacktrace: [{:foo, :bar, 2, 0}]
      }
    ]}
  end

  def my_after({_status, _diagnostics} = input) do
    IO.inspect(input, label: "my_after (foo_two)")

    input
  end

  @impl true
  def diagnostics() do
    [
      %Mix.Task.Compiler.Diagnostic{
        compiler_name: "foo_two (from diagnostics/0)",
        details: "details (from diagnostics/0)",
        file: "file (from diagnostics/0)",
        message: "message (from diagnostics/0)",
        position: 0,
        severity: :warning,
        stacktrace: [{:foo, :bar, 2, 0}]
      }
    ]
  end
end

