# ## Prod config
#
# Only prod and dynamic settings
# Use {:system, "VARNAME"}

use Mix.Config

config :data, Data.CoreRepo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATA_CORE_REPO_URL"},
  pool_size: {:system, "DATA_CORE_REPO_POOL"},
  ssl: {:system, "DATA_CORE_REPO_SSL"}
