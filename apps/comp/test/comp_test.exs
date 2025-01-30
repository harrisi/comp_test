defmodule CompTest do
  use ExUnit.Case
  doctest Comp

  test "greets the world" do
    assert Comp.hello() == :world
  end
end
