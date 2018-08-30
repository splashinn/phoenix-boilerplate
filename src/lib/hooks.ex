defmodule :hooks do
  require Logger
  def migrate do
    path = Application.app_dir(:web_app, "priv/repo/migrations")
    Ecto.Migrator.run(WebApp.Repo, path, :up, all: true)
    :init.stop()
  end
end
