defmodule WebApp.Repo do
  use Ecto.Repo, otp_app: :web_app

  @doc """
  Dynamically loads the repository url from the
  PG_REPO_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("PG_DATABASE_URL"))}
  end
end
