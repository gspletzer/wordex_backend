defmodule Wordex.Game.BoardTest do
  use ExUnit.Case

  alias Wordex.Game.Board

  describe "new/1" do
    test "returns a new board with an empty list of scores" do
      answer = "party"
      board = Board.new(answer)

      assert board.scores == []
      assert board.answer == "party"
    end
  end

  describe "guess/2" do
    # would this be a good scenario to utlize "expect"
    # to verify we only call to Score.new() and Score.show() once each
    test "calculates the score of most recent guess and adds it to the board" do
      board = %Board{scores: [], answer: "party"}
      guess_1 = "stale"
      guess_2 = "patty"
      guess_3 = "party"

      result_1 = %Board{
        answer: "party",
        scores: [
          [{"s", :gray}, {"t", :yellow}, {"a", :yellow}, {"l", :gray}, {"e", :gray}]
        ]
      }

      assert result_1 == Board.guess(board, guess_1)

      result_2 = %Board{
        answer: "party",
        scores: [
          [{"p", :green}, {"a", :green}, {"t", :gray}, {"t", :green}, {"y", :green}],
          [{"s", :gray}, {"t", :yellow}, {"a", :yellow}, {"l", :gray}, {"e", :gray}]
        ]
      }

      assert result_2 == Board.guess(result_1, guess_2)

      result_3 = %Board{
        answer: "party",
        scores: [
          [{"p", :green}, {"a", :green}, {"r", :green}, {"t", :green}, {"y", :green}],
          [{"p", :green}, {"a", :green}, {"t", :gray}, {"t", :green}, {"y", :green}],
          [{"s", :gray}, {"t", :yellow}, {"a", :yellow}, {"l", :gray}, {"e", :gray}]
        ]
      }

      assert result_3 == Board.guess(result_2, guess_3)
    end
  end

  describe "show/1" do
    test "returns the list of scores in correct order" do
      board = %Board{
        answer: "party",
        scores: [
          [{"p", :green}, {"a", :green}, {"r", :green}, {"t", :green}, {"y", :green}],
          [{"p", :green}, {"a", :green}, {"t", :gray}, {"t", :green}, {"y", :green}],
          [{"s", :gray}, {"t", :yellow}, {"a", :yellow}, {"l", :gray}, {"e", :gray}]
        ]
      }

      score = [
        [{"s", :gray}, {"t", :yellow}, {"a", :yellow}, {"l", :gray}, {"e", :gray}],
        [{"p", :green}, {"a", :green}, {"t", :gray}, {"t", :green}, {"y", :green}],
        [{"p", :green}, {"a", :green}, {"r", :green}, {"t", :green}, {"y", :green}]
      ]

      assert score == Board.show(board)
    end
  end
end
