defmodule CompUserTest do
  use ExUnit.Case
  doctest CompUser

  test "greets the world" do
    assert CompUser.hello() == :world
  end
end
