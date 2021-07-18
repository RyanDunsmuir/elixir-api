defmodule CoverflexApi.Benefits.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :total, :float

    belongs_to(:user, CoverflexApi.Benefits.User)

    has_many :orderproducts, Benefits.OrderProduct
    has_many :products, through: [:orderproducts, :product]

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:total, :user_id])
    |> validate_required([:user_id])
  end
end
