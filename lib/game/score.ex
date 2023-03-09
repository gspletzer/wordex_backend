defmodule Wordex.Game.Score do
  defstruct [:answer, :guess]
  @type answer() :: String.t()
  @type guess() :: String.t()
  @type color() :: :gray | :green | :yellow
  @type comparison_score() :: {String.t(), String.t(), color()}
  @type t :: %__MODULE__{answer: answer(), guess: guess()}

  alias Wordex.Game.Guess

  @spec new(answer, guess) :: t | {:error, String.t()}
  def new(answer, guess) do
    if Guess.valid_guess?(guess) == true,
      do: %__MODULE__{answer: answer, guess: guess},
      else: raise("Guess is not valid. Try again.")
  end

  @spec match_greens(score :: t) :: [comparison_score()]
  def match_greens(%{answer: answer, guess: guess} = _score) do
    a = String.graphemes(answer)
    g = String.graphemes(guess)

    a
    |> Enum.zip(g)
    |> Enum.map(fn {x, y} ->
      {x, y, :gray}
    end)
    |> Enum.map(fn {x, y, c} ->
      if x == y, do: {x, y, :green}, else: {x, y, c}
    end)
  end

  @spec match_yellows([comparison_score()]) :: [comparison_score()]
  def match_yellows(score) do
  end
end
