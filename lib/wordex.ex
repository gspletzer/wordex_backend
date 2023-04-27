defmodule Wordex do
  @moduledoc """
  Documentation for `Wordex`.
  """
  alias Wordex.Game

  def new(name) do
    DynamicSupervisor.start_child(:dsup, {Wordex.Game, name})
  end

  def guess(name, word) do
    Game.guess(name, word)
  end
end
