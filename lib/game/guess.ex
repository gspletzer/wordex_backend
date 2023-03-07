defmodule Wordex.Game.Guess do
  @type guess() :: String.t()

  @spec valid_guess?(guess) :: true | false
  def valid_guess?(guess) do
    # TODO: check valid English word
    with true <- valid_length(guess),
         true <- valid_characters(guess) do
      true
    else
      false -> false
    end
  end

  defp valid_length(guess) do
    if String.length(guess) == 5, do: true, else: false
  end

  defp valid_characters(guess) do
    String.match?(guess, ~r/^[[:alpha:][:lower:]]+$/)
  end
end
