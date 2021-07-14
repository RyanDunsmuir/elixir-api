# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :coverflex_api,
  ecto_repos: [CoverflexApi.Repo]

# Configures the endpoint
config :coverflex_api, CoverflexApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V83htuKjmsHHQRQl9xlXBcafN8F4vJulYb2CCW/JM/6KpjB7XQABnMC42T9NdKge",
  render_errors: [view: CoverflexApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CoverflexApi.PubSub,
  live_view: [signing_salt: "eWI6hYXY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
