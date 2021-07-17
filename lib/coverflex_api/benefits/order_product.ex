defmodule CoverflexApi.Benefits.OrderProduct do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias CoverflexApi.Benefits.OrderProduct
  alias CoverflexApi.Repo

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

  def with_orders(order_product_id) do
    Repo.get(OrderProduct, order_product_id)
    |> Repo.preload(:orders)
  end

  def with_orders(order_product_id) do
    Repo.get(OrderProduct, order_product_id)
    |> Repo.preload(:products)
  end

  def product(order_product_id) do
    with_orders(order_product_id)
    order_product = Repo.get(OrderProduct, order_product_id)
    order_product.product
  end
end
