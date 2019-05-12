# ## Test config
#
# Only test settings

use Mix.Config

config :frontend, FrontendWeb.Endpoint,
  server: false

config :logger, level: :warn
