defmodule Surgery.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :token, :text

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:token])
  end
end
