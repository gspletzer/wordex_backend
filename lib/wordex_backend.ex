defmodule WordexBackend do
  @moduledoc """
  Documentation for `WordexBackend`.
  """
  alias WordexBackend.Game

  def new(name) do
    DynamicSupervisor.start_child(:dsup, {WordexBackend.Game, name})
  end

  def guess(name, word) do
    Game.guess(name, word)
  end
end
