defmodule CoverflexApi.Benefits.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias CoverflexApi.Benefits
  alias CoverflexApi.Repo

  schema "users" do
    field :balance, :float
    field :username, :string

    has_many :orders, Benefits.Order
    has_many :orderproducts, through: [:orders, :orderproduct]

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :balance])
    |> validate_required([:username, :balance])
  end

  # def with_orders(user_id) do
  #   Benefits.get_user!(user_id)
  #   |> Repo.preload(:order)
  # end

  # def with_order_products(user_id) do
  #   Benefits.get_user!(user_id)
  #   |> Repo.preload(:orderproducts)
  # end

  def products(user) do
    # preload users orderproducts
    Benefits.load_user(user)
    # store orderproducts in a variable
    orderproducts = user.orderproducts
    # iterate through the users orderproducts and return their associated products
    Enum.map(orderproducts, fn orderproduct -> orderproduct.product(orderproduct.id) end)
  end
end
