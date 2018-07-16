defmodule DefferedTrigger.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :field_trigger, :string, null: true
      add :field_deffered_trigger, :string, null: true
    end

    execute "
      CREATE OR REPLACE FUNCTION trigger_function() RETURNS trigger AS $$
        BEGIN
          UPDATE items SET field_trigger = 'hi' WHERE id = NEW.id;

          RETURN NULL;
        END;
      $$ LANGUAGE plpgsql;
    ",
    "DROP FUNCTION trigger_function"

    execute "
      CREATE OR REPLACE FUNCTION deffered_trigger_function() RETURNS trigger AS $$
        BEGIN
          UPDATE items SET field_deffered_trigger = 'hello' WHERE id = NEW.id;

          RETURN NULL;
        END;
      $$ LANGUAGE plpgsql;
    ",
    "DROP FUNCTION deffered_trigger_function"

    execute "
      CREATE TRIGGER trigger
      AFTER INSERT ON items
      FOR EACH ROW
      EXECUTE PROCEDURE trigger_function()
    ",
    "DROP TRIGGER trigger ON items"

    execute "
      CREATE CONSTRAINT TRIGGER deffered_trigger
      AFTER INSERT ON items
      DEFERRABLE INITIALLY DEFERRED
      FOR EACH ROW
      EXECUTE PROCEDURE deffered_trigger_function()
    ",
    "DROP TRIGGER deffered_trigger ON items"
  end
end
