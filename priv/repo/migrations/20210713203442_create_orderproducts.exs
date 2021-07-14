defmodule CoverflexApi.Repo.Migrations.CreateOrderproducts do
  use Ecto.Migration

  def change do
    create table(:orderproducts) do
        add :order_id, references(:orders)
        add :product_id, references(:products)

      timestamps()
    end

  end
end
