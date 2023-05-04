defmodule Wordex.Game.Board do
  defstruct [:scores, :answer]
  @type answer :: Score.answer()
  @type score :: Score.scored()
  @type t :: %__MODULE__{scores: [score()], answer: answer()}

  alias Wordex.Game.Score
  alias Wordex.Game.Wordlist

  @spec new() :: board :: t
  def new() do
    %__MODULE__{scores: [], answer: Wordlist.generate_word()}
  end

  @spec valid_word?(guess :: String.t()) :: boolean()
  def valid_word?(guess), do: Wordlist.in_list?(guess)

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

  # color coding functions in progress using IO.ANSI
  def color_code(%__MODULE__{scores: scores} = _board) do
    IO.inspect(scores)
  end

  def color_code_letter({letter, color}) do
    case color do
      :green -> IO.ANSI.format([:green_background, letter])
      :yellow -> IO.ANSI.format([:yellow_background, letter])
      :gray -> IO.ANSI.format([:light_black_background, letter])
    end
  end
end
