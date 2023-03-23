defmodule Wordex.Game.Score do
  defstruct [:answer, :guess]
  @type answer() :: String.t()
  @type guess() :: Game.guess()
  @type color() :: :gray | :green | :yellow
  @type scored() :: {String.t(), color()}
  @type t :: %__MODULE__{answer: answer(), guess: guess()}

  @spec new(answer, guess) :: t | {:error, String.t()}
  def new(answer, guess) do
    %__MODULE__{answer: answer, guess: guess}
  end

  @spec show(score :: t) :: [result :: scored()]
  def show(%{answer: answer, guess: guess} = _score) do
    a_list = String.graphemes(answer)
    g_list = String.graphemes(guess)
    matched_letters = match_greens(a_list, g_list)

    missed_letters = g_list -- a_list

    mark_remaining_letters(missed_letters, matched_letters, [])
  end

  defp match_greens(answer_list, guess_list) do
    answer_list
    |> Enum.zip(guess_list)
    |> Enum.map(fn {x, y} ->
      {x, y, :yellow}
    end)
    |> Enum.map(fn {x, y, c} ->
      if x == y, do: {y, :green}, else: {y, c}
    end)
  end

  defp mark_remaining_letters(_letters, [], acc), do: Enum.reverse(acc)

  defp mark_remaining_letters(letters, [{y, z} = _match | matched_letters], acc) do
    if z == :green || Enum.empty?(letters) || not (y in letters) do
      mark_remaining_letters(letters, matched_letters, [{y, z} | acc])
    else
      mark_remaining_letters(List.delete(letters, y), matched_letters, [{y, :gray} | acc])
    end
  end
end
