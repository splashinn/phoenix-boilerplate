# ## General config
#
# Static and general settings
# DONT PUT HERE DYNAMIC SETTINGS

use Mix.Config

config :data,
  ecto_repos: [Data.CoreRepo]

import_config "#{Mix.env()}.exs"
