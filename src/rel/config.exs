Path.join(["rel", "plugins", "*.exs"])
  |> Path.wildcard()
  |> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :dev
  set pre_start_hook: "rel/hooks/pre_start"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :prod
  set pre_start_hook: "rel/hooks/pre_start"
end

release :release do
  set version: current_version(:web_app)
  set applications: [
    :runtime_tools
  ]
end

