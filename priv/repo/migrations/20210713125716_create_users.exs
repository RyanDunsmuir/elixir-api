defmodule CoverflexApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :balance, :float, default: 0
      add :product_ids, {:array, :string}

      timestamps()
    end

  end
end
