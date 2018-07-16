defmodule DefferedTrigger.ItemTest do
  use DefferedTrigger.DataCase, async: true

  alias DefferedTrigger.Item

  test "" do
    assert {:ok, item} = Item.create(%{})

    item = Item |> Repo.get(item.id)
    assert item.field_trigger == "hi"
    assert item.field_deffered_trigger == "hello"
  end
end
