defmodule WordexBackend.GameTest do
  use ExUnit.Case

  alias WordexBackend.Game

  describe "valid_guess?/1" do
    test "returns true when guess is a real 5 letter word" do
      assert true == Game.valid_guess?("happy")
    end

    test "returns false if guess is less than 5 letters" do
      assert false == Game.valid_guess?("four")
    end

    test "returns false if guess is more than 5 letters" do
      assert false == Game.valid_guess?("extras")
    end

    test "returns false if guess includes invalid characters" do
      assert false == Game.valid_guess?("wr0ng")
    end

    # test "returns false if guess is not a valid word" do
    #   assert false == Guess.valid_guess?("faque")
    # end
  end
end
