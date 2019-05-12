# ## Test config
#
# Only test settings

use Mix.Config

config :data, Data.CoreRepo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATA_CORE_REPO_URL"},
  pool_size: Ecto.Adapters.SQL.Sandbox
