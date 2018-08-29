use Mix.Config

config :surgery, SurgeryWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :surgery, Surgery.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "rails",
  password: "rails",
  database: "surgery_dev",
  hostname: "localhost",
  pool_size: 10

config :surgery, :hps_service,
  server: "http://10.11.13.203:8069"
