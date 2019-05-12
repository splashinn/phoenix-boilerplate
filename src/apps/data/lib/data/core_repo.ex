defmodule Data.CoreRepo do
  @moduledoc """
  Data Core Repo
  """
  use Ecto.Repo,
    otp_app: :data,
    adapter: Ecto.Adapters.Postgres
end
