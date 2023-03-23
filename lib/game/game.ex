defmodule Wordex.Game.Game do
  @type guess() :: String.t()
  alias Wordex.Game.Board
  @spec valid_word?(guess) :: Boolean.t()

  def valid_word?(guess) do
    # TODO: check valid English word
    with true <- valid_length(guess),
         true <- valid_characters(guess) do
      true
    else
      false -> false
    end
  end

  @spec valid_length(guess) :: Boolean.t()
  defp valid_length(guess) do
    if String.length(guess) == 5, do: true, else: false
  end

  @spec valid_characters(guess) :: Boolean.t()
  defp valid_characters(guess) do
    String.match?(guess, ~r/^[[:alpha:][:lower:]]+$/)
  end

  def new(answer) do
    if valid_word?(answer) do {:ok, Board.new(answer)}

    else
      {:error, "INVALID INPUT"}

    end
  end

end
