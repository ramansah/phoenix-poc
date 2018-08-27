defmodule Surgery.Repo.Migrations.CreateMedications do
  use Ecto.Migration

  def change do
    create table(:medications) do
      add :name, :string
      add :days, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:medications, [:user_id])
  end
end
