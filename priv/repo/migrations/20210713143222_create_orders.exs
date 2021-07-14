defmodule CoverflexApi.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :total, :float
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:orders, [:user_id])
  end
end
