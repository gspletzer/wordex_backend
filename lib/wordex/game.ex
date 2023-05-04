defmodule Wordex.Game do
  use GenServer

  alias Wordex.Game.Board

  # Client

  def guess(pid \\ :wordex, word) do
    GenServer.call(pid, {:guess, word})
  end

  def start_link(name) do
    IO.puts("Starting #{name}")

    # TODO: come back to this???
    GenServer.start_link(__MODULE__, %{}, name: name)
  end

  def child_spec(name) do
    %{id: name, start: {__MODULE__, :start_link, [name]}}
  end

  # Server (callbacks)

  @impl true
  def init(_word) do
    {:ok, Board.new()}
  end

  @impl true
  def handle_call(:show, _from, board) do
    {:reply, Board.show(board), board}
  end

  def handle_call({:guess, word}, _from, board) do
    if Board.valid_word?(word) do
      board = Board.guess(board, word)
      {:reply, Board.show(board), board}
    else
      {:reply, "invalid word", board}
    end
  end
end
