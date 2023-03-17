defmodule Wordex.Game.Board do
  defstruct [:scores, :answer]

  alias Wordex.Game.Score

  def new(words \\ ~w[happy patty mouse guess words hello]) do
    answer = Enum.random(words)

    %__MODULE__{scores: [], answer: answer}
  end

  def guess(%__MODULE__{} = board, guess) do
    score = Score.new(board.answer, guess) |> Score.show()
    %{board | scores: [score | board.scores]}
  end

  def show(%__MODULE__{scores: scores} = _board) do
    Enum.reverse(scores)
  end
end
