defmodule CompListener do
  use GenServer

  def init(init_arg) do
    {:ok, init_arg}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end

  def handle_info({:modules_compiled, info}, state) do
    IO.inspect(info, label: "modules_compiled")

    IO.inspect(Mix.Task.Compiler.diagnostics(), label: "diagnostics")

    {:noreply, state}
  end

  def handle_info({:dep_compiled, info}, state) do
    IO.inspect(info, label: "dep_compiled")

    {:noreply, state}
  end

  def handle_info(msg, state) do
    IO.inspect({msg, state}, label: "unknown message")

    {:noreply, state}
  end
end
