defmodule Wordex.Game.Wordlist do
    import File
    @wordlist_file "./assets/valid-wordle-words.txt" 

    defp get_wordlist() do
       {:ok, wordcollection} = File.read(@wordlist_file)
        String.split(wordcollection, "\n")
    end     

    def generate_word() do
        get_wordlist() |> Enum.random()
    end

    def in_list?(guess) do
        guess in get_wordlist()
    end

end