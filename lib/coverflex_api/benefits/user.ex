defmodule CoverflexApi.Benefits.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:balance, :float)
    field(:username, :string)
    field(:product_ids, {:array, :string}, default: [])

    has_many :orders, CoverflexApi.Benefits.Order

    has_many :orderproducts,
      through: [:orders, :orderproducts]

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :balance])
    |> validate_required([:username, :balance])
  end

  def products do
  end
end
