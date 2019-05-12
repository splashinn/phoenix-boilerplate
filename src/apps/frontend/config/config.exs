# ## General config
#
# Static and general settings
# DONT PUT HERE DYNAMIC SETTINGS

use Mix.Config

config :frontend, FrontendWeb.Endpoint,
  url: [host: nil],
  render_errors: [view: FrontendWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Frontend.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
