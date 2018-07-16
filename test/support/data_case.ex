defmodule DefferedTrigger.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias DefferedTrigger.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import DefferedTrigger.DataCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(DefferedTrigger.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(DefferedTrigger.Repo, {:shared, self()})
    end

    :ok
  end
end
