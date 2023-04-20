defmodule Wordex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  # alias Wordex.Game

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Wordex.Worker.start_link(arg)
      {DynamicSupervisor, name: :dsup, strategy: :one_for_one}

      # {Wordex.Game.Server, :batman},
      # {Wordex.Game.Server, :dryad},
      # {Wordex.Game.Server, :groot},
      # {Wordex.Game.Server, :superman}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
