# ## Prod config
#
# Only prod and dynamic settings
# Use {:system, "VARNAME"}

use Mix.Config

config :frontend, FrontendWeb.Endpoint,
  http: [port: {:system, "FRONTEND_HTTP_PORT"}],
  secret_key_base: {:system, "FRONTEND_SECRET_KEY_BASE"},
  server: true,
  root: ".",
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
