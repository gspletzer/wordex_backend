defmodule Wordex.Game.GameTest do
  use ExUnit.Case

  alias Wordex.Game.Board
  alias Wordex.Game.Game

  describe "new/1" do
    test "returns a new board with empty score list, if answer is valid" do
      answer = "happy"

      board = %Board{scores: [], answer: answer}

      assert {:ok, board} == Game.new(answer)
    end

    test "returns error tuple if the answer is invalid" do
      answer = "invalid"
      error_message = "INVALID INPUT"

      assert {:error, error_message} == Game.new(answer)
    end
  end

  describe "guess/3" do
    setup do
      [
        answer: "happy",
        scores: [
          [{"s", :gray}, {"t", :gray}, {"a", :yellow}, {"l", :gray}, {"e", :gray}],
          [{"p", :yellow}, {"a", :green}, {"t", :gray}, {"t", :gray}, {"y", :green}]
        ]
      ]
    end

    test "returns an updated list of scores with a valid guess", context do
      guess = "party"

      result = [
        [{"s", :gray}, {"t", :gray}, {"a", :yellow}, {"l", :gray}, {"e", :gray}],
        [{"p", :yellow}, {"a", :green}, {"t", :gray}, {"t", :gray}, {"y", :green}],
        [{"p", :yellow}, {"a", :green}, {"r", :gray}, {"t", :gray}, {"y", :green}]
      ]

      assert {:ok, result} == Game.guess(guess, context.scores, context.answer)
    end

    test "returns error tuple if guess is invalid", context do
      guess = "invalid"
      error_message = "INVALID INPUT"

      assert {:error, error_message} == Game.guess(guess, context.scores, context.answer)
    end
  end

  describe "valid_word?/1" do
    test "returns true when word is a real 5 letter word" do
      assert true == Game.valid_word?("happy")
    end

    test "returns false if word is less than 5 letters" do
      assert false == Game.valid_word?("four")
    end

    test "returns false if word is more than 5 letters" do
      assert false == Game.valid_word?("extras")
    end

    test "returns false if word includes invalid characters" do
      assert false == Game.valid_word?("wr0ng")
    end

    # test "returns false if word is not a valid word" do
    #   assert false == word.valid_word?("faque")
    # end
  end
end
