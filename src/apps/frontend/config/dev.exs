# ## Dev config
#
# Only dev and dynamic settings
# Use System.get_env("VARNAME")

use Mix.Config

config :frontend, FrontendWeb.Endpoint,
  http: [
    port: System.get_env("FRONTEND_HTTP_PORT")
  ],
  https: [
    port: System.get_env("FRONTEND_HTTPS_PORT"),
    keyfile: "priv/cert/selfsigned_key.pem",
    certfile: "priv/cert/selfsigned.pem"
  ],
  secret_key_base: System.get_env("FRONTEND_SECRET_KEY_BASE"),
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :frontend, FrontendWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/frontend_web/{live,views}/.*(ex)$",
      ~r"lib/frontend_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
