defmodule DefferedTrigger.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias DefferedTrigger.Repo
  alias DefferedTrigger.Item

  schema "items" do
    field(:field_trigger, :string)
    field(:field_deffered_trigger, :string)
  end

  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [])
  end

  def create(attrs) do
    %Item{}
    |> changeset(attrs)
    |> Repo.insert()
  end
end
