defmodule Wordex.Game.Wordlist do
  # import File
  @wordlist_file "./assets/valid-wordle-words.txt"

  @spec generate_word() :: String.t()
  def generate_word() do
    get_wordlist() |> Enum.random()
  end

  @spec in_list?(String.t()) :: boolean()
  def in_list?(guess) do
    guess in get_wordlist()
  end

  defp get_wordlist() do
    {:ok, wordcollection} = File.read(@wordlist_file)
    String.split(wordcollection, "\n")
  end
end
