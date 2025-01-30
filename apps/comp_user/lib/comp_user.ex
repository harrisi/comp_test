defmodule CompUser do
  @moduledoc """
  Documentation for `CompUser`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CompUser.hello()
      :world

  """
  def hello do
    :world_ex
  end

  def inc(val) do
    val + :foo
  end

  def foo, do: :bar
end
