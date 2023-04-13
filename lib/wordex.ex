defmodule Wordex do
  @moduledoc """
  Documentation for `Wordex`.
  """
  alias Wordex.Game.Server

  def new(name) do
    DynamicSupervisor.start_child(:dsup, {Wordex.Game.Server, name})
  end

  def guess(name, word) do
    Server.guess(name, word)
  end
end
