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

  def show(
        %__MODULE__{
          scores:
            [[{_, :green}, {_, :green}, {_, :green}, {_, :green}, {_, :green}] | _tail] = _scores
        } = board
      ) do
    "Congratulations, you have guessed the answer for the board! #{board.answer}"
  end

  def show(%__MODULE__{scores: scores} = _board) do
    Enum.reverse(scores) |> color_code_scores()
  end

  def color_code_scores(scores) do
    Enum.map(scores, &color_code_score(&1))
    |> Enum.join("\n")
  end

  # color coding functions in progress using IO.ANSI
  def color_code_score(score) do
    for t <- score do
      color_code_letter(t)
    end
  end

  def color_code_letter({letter, color}) do
    case color do
      :green -> IO.ANSI.format([:green_background, letter])
      :yellow -> IO.ANSI.format([:yellow_background, letter])
      :gray -> IO.ANSI.format([:light_black_background, letter])
    end
  end
end
