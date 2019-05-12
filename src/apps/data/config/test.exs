# ## Test config
#
# Only test settings

use Mix.Config

config :data, Data.CoreRepo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATA_CORE_REPO_URL")
