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
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  alias CoverflexApi.Benefits.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

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

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias CoverflexApi.Benefits.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

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

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{data: %Order{}}

  """
  def change_order(%Order{} = order, attrs \\ %{}) do
    Order.changeset(order, attrs)
  end

  alias CoverflexApi.Benefits.OrderProduct

  @doc """
  Returns the list of orderproducts.

  ## Examples

      iex> list_orderproducts()
      [%OrderProduct{}, ...]

  """
  def list_orderproducts do
    Repo.all(OrderProduct)
  end

  @doc """
  Gets a single order_product.

  Raises `Ecto.NoResultsError` if the Order product does not exist.

  ## Examples

      iex> get_order_product!(123)
      %OrderProduct{}

      iex> get_order_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order_product!(id), do: Repo.get!(OrderProduct, id)

  @doc """
  Creates a order_product.

  ## Examples

      iex> create_order_product(%{field: value})
      {:ok, %OrderProduct{}}

      iex> create_order_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order_product(attrs \\ %{}) do
    %OrderProduct{}
    |> OrderProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order_product.

  ## Examples

      iex> update_order_product(order_product, %{field: new_value})
      {:ok, %OrderProduct{}}

      iex> update_order_product(order_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order_product(%OrderProduct{} = order_product, attrs) do
    order_product
    |> OrderProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order_product.

  ## Examples

      iex> delete_order_product(order_product)
      {:ok, %OrderProduct{}}

      iex> delete_order_product(order_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order_product(%OrderProduct{} = order_product) do
    Repo.delete(order_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order_product changes.

  ## Examples

      iex> change_order_product(order_product)
      %Ecto.Changeset{data: %OrderProduct{}}

  """
  def change_order_product(%OrderProduct{} = order_product, attrs \\ %{}) do
    OrderProduct.changeset(order_product, attrs)
  end
end
