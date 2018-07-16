use Mix.Config

config :deffered_trigger, DefferedTrigger.Repo,
  pool: Ecto.Adapters.SQL.Sandbox
