defmodule :hooks do
  require Logger
  def migrate do
    {:ok, _} = Application.ensure_all_started(:timber)
    {:ok, _} = Application.ensure_all_started(:bank_api)
    path = Application.app_dir(:bank_api, "priv/repo/migrations")
    Ecto.Migrator.run(BankApi.Repo, path, :up, all: true)
    :init.stop()
  end
end
