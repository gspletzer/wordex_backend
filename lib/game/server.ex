defmodule Wordex.Game.Server do
  use GenServer

  alias Wordex.Game.Game
  alias Wordex.Game.Board

  # Client

  def guess(pid \\ :wordex, word) do
    GenServer.call(pid, {:guess, word})
  end

  def start_link(word) do
    GenServer.start_link(__MODULE__, word, name: :wordex)
  end

  # Server (callbacks)

  @impl true
  def init(word) do
    IO.puts("Starting...")
    {:ok, board} = Game.new(word)
    {:ok, board}
  end

  @impl true
  def handle_call(:show, _from, board) do
    {:reply, Board.show(board), board}
  end

  def handle_call({:guess, word}, _from, board) do
    board = Board.guess(board, word)
    {:reply, Board.show(board), board}
  end

  # @impl true
  # def handle_cast({:push, element}, state) do
  #   {:noreply, [element | state]}
  # end
end
