defmodule CoverflexApi.Benefits do
  @moduledoc """
  The Benefits context.
  """

  import Ecto.Query, warn: false
  alias CoverflexApi.Repo

  alias CoverflexApi.Benefits.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """

  alias CoverflexApi.Benefits.User

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_by_username!(username) do
    Repo.get_by(User, username: username)
    # |> Repo.preload([:orders, :orderproducts])
  end

  def get_user_products(user) do
    Repo.preload(user, :orderproducts)
    user.orderproducts
  end

  alias CoverflexApi.Benefits.Order

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end
end
