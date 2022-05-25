# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :queropay,
  ecto_repos: [Queropay.Repo]

# Configures the endpoint
config :queropay, QueropayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WNRZ+G9m6OPZO833uwE0AXlUhHJDn2sb/NUPlhzRx5s/JZDEQafv5Gf+9AZjJPEl",
  render_errors: [view: QueropayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Queropay.PubSub,
  live_view: [signing_salt: "dAkSje/+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
