use Mix.Config

config :deffered_trigger, ecto_repos: [DefferedTrigger.Repo]

config :deffered_trigger, DefferedTrigger.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  database: "deffered_trigger_#{Mix.env()}",
  pool_size: 10,
  timeout: 5 * 1000,
  hostname: "localhost",
  port: 5432,
  password: "postgres"

import_config "#{Mix.env()}.exs"
