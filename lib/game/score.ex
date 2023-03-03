defmodule Wordex.Game.Score do
  defstruct [:answer, :guess]

  def new(answer, guess) do
    %__MODULE__{answer: answer, guess: guess}
  end

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
end
