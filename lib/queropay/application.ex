defmodule Queropay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Queropay.Repo,
      # Start the Telemetry supervisor
      QueropayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Queropay.PubSub},
      # Start the Endpoint (http/https)
      QueropayWeb.Endpoint
      # Start a worker by calling: Queropay.Worker.start_link(arg)
      # {Queropay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Queropay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    QueropayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
