# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lani,
  ecto_repos: [Lani.Repo]

# Configures the endpoint
config :lani, LaniWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hvp5D04/VEXuUG3Hl0C+/xkNGnPG1IIo1mU5yNSyb9FTaMh0YHOBgfWpNCrvvWFJ",
  render_errors: [view: LaniWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Lani.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
