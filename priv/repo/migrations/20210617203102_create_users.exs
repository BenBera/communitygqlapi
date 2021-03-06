defmodule Community.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :citex, null: false
      add :token, :string
      add :role, :string, null: false

      timestamps()
    end
    create unique_index(:users, [:email])
    create unique_index(:users, [:token])

  end
end
