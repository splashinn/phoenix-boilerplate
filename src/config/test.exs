use Mix.Config

config :web_app, WebAppWeb.Endpoint,
  server: false

config :logger, level: :warn

config :web_app, WebApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox
