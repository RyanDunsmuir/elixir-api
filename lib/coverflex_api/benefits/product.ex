defmodule CoverflexApi.Benefits.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :price, :float

    many_to_many :orders, CoverflexApi.Benefits.Order, join_through: "order_products"
    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
