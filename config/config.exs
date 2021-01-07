# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :exmon_api,
  ecto_repos: [ExmonApi.Repo]

# Configures the endpoint
config :exmon_api, ExmonApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5V7Zhuw6tumj3EocEEipVG8rHPTm3m5He+VWYcbPZVZhmLt1aQFotKthfdb+1ia7",
  render_errors: [view: ExmonApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExmonApi.PubSub,
  live_view: [signing_salt: "75R3y6/U"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :exmon_api, ExmonApiWeb.Auth.Guardian,
  issuer: "exmon_api",
  secret_key: "ZC82AnbXMz0xWV4dl1/CWNOZQ0V/uSETKwhhvSb6d3dq+t3WQEzlmTJ2Gs9TXxrN"
