use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :web_app, WebAppWeb.Endpoint,
  secret_key_base: "jGqgsRY6LvcYZp82vRlVyuWOsmXW7hN8XK/R44huMzrcRlKy6R8snhhFulHEhpd/"

# Configure your database
config :web_app, WebApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "web_app_prod",
  pool_size: 15
