defmodule Mix.Tasks.Compile.Foo do
  use Mix.Task.Compiler

  @impl true
  def run(args) do
    IO.inspect(args, label: "compiling")

    IO.inspect(System.argv(), label: "argv")

    Mix.Task.Compiler.after_compiler(:foo, &my_after/1)

    {if("--warnings-as-errors" in System.argv(), do: :error, else: :ok), [
      %Mix.Task.Compiler.Diagnostic{
        compiler_name: "foo",
        details: "details",
        file: ".",
        message: "message",
        position: 0,
        severity: if("--warnings-as-errors" in args, do: :error, else: :warning),
        stacktrace: [{:foo, :bar, 2, 0}]
      }
    ]}
  end

  def my_after({status, diagnostics} = input) do
    IO.inspect(input, label: "my_after")

    # Mix.shell().error(inspect diagnostics)
    IO.warn(inspect diagnostics)

    # {:error, Enum.map(diagnostics, fn d -> put_in(d.severity, :error) end) |> IO.inspect(label: "mapped")}
    {status, diagnostics}
  end

  @impl true
  def diagnostics() do
    [
      %Mix.Task.Compiler.Diagnostic{
        compiler_name: "foo (from diagnostics/0)",
        details: "details (from diagnostics/0)",
        file: "file (from diagnostics/0)",
        message: "message (from diagnostics/0)",
        position: 0,
        severity: :warning,
        # severity: if("--warnings-as-errors" in args, do: :error, else: :warning),
        stacktrace: [{:foo, :bar, 2, 0}]
      }
    ]
  end
end

