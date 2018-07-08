use Mix.Config

config :web_app,
  ecto_repos: [WebApp.Repo]

config :web_app, WebAppWeb.Endpoint,
  http: [port: System.get_env("PHX_PORT")],
  url: [host: System.get_env("PHX_URL_HOST")],
  secret_key_base: System.get_env("PHX_SECRET_KEY_BASE"),
  render_errors: [view: WebAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WebApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :web_app, WebApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool_size: 10

import_config "#{Mix.env}.exs"
