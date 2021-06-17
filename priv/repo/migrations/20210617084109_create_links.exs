defmodule Community.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string
      add :description, :text
      add :author_id, references(:users), null: false


      timestamps()
    end
    create_index(:links, [:author_id])

  end
end
