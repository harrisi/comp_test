defmodule CompListenerTest do
  use ExUnit.Case
  doctest CompListener

  test "greets the world" do
    assert CompListener.hello() == :world
  end
end
