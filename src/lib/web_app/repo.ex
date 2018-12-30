defmodule WebApp.Repo do
  use Ecto.Repo,
    otp_app: :web_app,
    adapter: Ecto.Adapters.Postgres

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("PG_DATABASE_URL"))}
  end
end
