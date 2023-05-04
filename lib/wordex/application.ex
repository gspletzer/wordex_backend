defmodule Wordex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  # alias Wordex.Game

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DynamicSupervisor, name: :dsup, strategy: :one_for_one}

      # EXAMPLE: {Wordex.Server, :batman}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
