defmodule Wordex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  alias Wordex.Game

  use Application

  @impl true
  def start(_type, _args) do
    words = ~w[chase scene stale lover plate llama caked steam]

    children = [
      # Starts a worker by calling: Wordex.Worker.start_link(arg)
      {Wordex.Game.Server, Enum.random(words)}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wordex.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
