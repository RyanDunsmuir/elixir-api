defmodule CoverflexApi.Benefits.OrderProduct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orderproducts" do
    belongs_to :order, CoverflexApi.Benefits.Order
    belongs_to :product, CoverflexApi.Benefits.Product

    timestamps()
  end

  @doc false
  def changeset(order_product, attrs) do
    order_product
    |> cast(attrs, [:order_id, :product_id])
    |> validate_required([:order_id, :product_id])
  end
end
