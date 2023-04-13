defmodule Wordex.Game.Game do
  @type guess() :: String.t()
  alias Wordex.Game.Board
  alias Wordex.Game.Wordlist
  @spec valid_word?(guess) :: Boolean.t()


  def valid_word?(guess) do
    Wordlist.in_list?(guess)
  end

  def new() do
    {:ok, Board.new()}
  end

end
