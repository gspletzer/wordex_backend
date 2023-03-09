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

    # test "returns error if guess is not valid" do
    #   assert {:error, "Guess is not valid. Try again."} == Score.new("happy", "invalid")
    # end
  end

  describe "match_greens/1" do
    test "returns list where tuples with matching x and y values are followed by :green" do
      result = [
        {"h", "p", :gray},
        {"a", "a", :green},
        {"p", "t", :gray},
        {"p", "t", :gray},
        {"y", "y", :green}
      ]

      assert result == Score.new("happy", "patty") |> Score.match_greens()
    end

    test "returns list where no tuples display :green if no x and y values match in the tuple" do
      result = [
        {"h", "m", :gray},
        {"a", "o", :gray},
        {"p", "u", :gray},
        {"p", "s", :gray},
        {"y", "e", :gray}
      ]

      assert result == Score.new("happy", "mouse") |> Score.match_greens()
    end
  end
end
