defmodule Wordex.Game.Game do
  @type word() :: Board.answer()
  @type error_message :: String.t()
  @type game_board :: Board.board()
  @type score :: Board.score()

  alias Wordex.Game.Board

  @spec new(game_answer :: word) :: {:ok, game_board} | {:error, error_message}
  def new(game_answer) do
    answer = String.downcase(game_answer)

    if valid_word?(answer) do
      {:ok, Board.new(answer)}
    else
      {:error, "INVALID INPUT"}
    end
  end

  @spec guess(new_guess :: word, scored :: [score], answer :: word) ::
          {:ok, scores :: [score]} | {:error, error_message}
  def guess(new_guess, scored, answer) do
    # do we need to downcase and validate answer again? this might change depending
    # on how we handle tracking the answer for each board/game

    # do we need reverse scores since we reversed to send to UI?
    scores = Enum.reverse(scored)
    guess = String.downcase(new_guess)

    with true <- valid_word?(guess),
         %Board{} = board <- Board.new(answer, scores) |> Board.guess(guess) do
      {:ok, Board.show(board)}
    else
      _ -> {:error, "INVALID INPUT"}
    end
  end

  @spec valid_word?(word) :: Boolean.t()
  def valid_word?(word) do
    # TODO: check valid English word
    with true <- valid_length(word),
         true <- valid_characters(word) do
      true
    else
      false -> false
    end
  end

  @spec valid_length(word) :: Boolean.t()
  defp valid_length(word) do
    if String.length(word) == 5, do: true, else: false
  end

  @spec valid_characters(word) :: Boolean.t()
  defp valid_characters(word) do
    String.match?(word, ~r/^[[:alpha:]]+$/)
  end
end
