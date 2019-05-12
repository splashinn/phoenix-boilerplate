# ## Dev config
#
# Only dev and dynamic settings
# Use System.get_env("VARNAME")

use Mix.Config

config :data, Data.CoreRepo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATA_CORE_REPO_URL")
