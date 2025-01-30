defmodule CompTwoTest do
  use ExUnit.Case
  doctest CompTwo

  test "greets the world" do
    assert CompTwo.hello() == :world
  end
end
