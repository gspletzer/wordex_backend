defmodule WordexTest do
  use ExUnit.Case
  doctest Wordex

  test "greets the world" do
    assert Wordex.hello() == :world
  end
end
