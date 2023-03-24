defmodule Wordex.Game.ScoreTest do
  use ExUnit.Case

  alias Wordex.Game.Score

  # doctest Score

  describe "new/2" do
    test "returns Score that contains the answer and the guessed word" do
      answer = "happy"
      guess = "patty"
      result = %Score{answer: answer, guess: guess}

      assert result == Score.new(answer, guess)
    end
  end

  describe "show/1" do
    test "returns list with tuples labeled :green for correct guesses
      and :yellow for partially correct" do
      result = [
        {"p", :yellow},
        {"a", :green},
        {"t", :gray},
        {"t", :gray},
        {"y", :green}
      ]

      assert result == Score.new("happy", "patty") |> Score.show()
    end

    test "returns list where no tuples display :green or :yellow if no guess letters matched" do
      result = [
        {"m", :gray},
        {"o", :gray},
        {"u", :gray},
        {"s", :gray},
        {"e", :gray}
      ]

      assert result == Score.new("happy", "mouse") |> Score.show()
    end
  end
end
