defmodule Wordex.Game.Board do
  defstruct [:scores, :answer]
  @type answer :: Score.answer()
  @type score :: Score.scored()
  @type t :: %__MODULE__{scores: [score()], answer: answer()}

  alias Wordex.Game.Score
  alias Wordex.Game.Wordlist

  # @spec new(words :: List.t()) :: board :: t
  def new() do
    %__MODULE__{scores: [], answer: Wordlist.generate_word()}
  end

  @spec guess(board :: t, guess :: String.t()) :: updated_board :: t
  def guess(%__MODULE__{} = board, guess) do
    score = Score.new(board.answer, guess) |> Score.show()
    %{board | scores: [score | board.scores]}
  end

  @spec show(board :: t) :: [scores :: score()]

  def show(
        %__MODULE__{
          scores:
            [[{_, :green}, {_, :green}, {_, :green}, {_, :green}, {_, :green}] | _tail] = _scores
        } = board
      ) do
    IO.puts("Congratulations, you have guessed the answer for the board! #{board.answer}")
  end

  def show(%__MODULE__{scores: scores} = _board) do
    Enum.reverse(scores)
  end
end
