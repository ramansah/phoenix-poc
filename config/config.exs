# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :surgery,
  ecto_repos: [Surgery.Repo]

# Configures the endpoint
config :surgery, SurgeryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IjSQbbow9qiq9bxBgcV/WEjQLhb6AQHGvipONi2TvUPvapNO+bU/A/XfdS5BHztW",
  render_errors: [view: SurgeryWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Surgery.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
