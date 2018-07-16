defmodule DefferedTrigger.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link(
      [
        DefferedTrigger.Repo,
      ],
      strategy: :one_for_one,
      name: DefferedTrigger.Supervisor
    )
  end
end
