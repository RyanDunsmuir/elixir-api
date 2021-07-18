defmodule CoverflexApi.Benefits do
  import Ecto.Query, warn: false
  alias CoverflexApi.Repo

  alias CoverflexApi.Benefits.Product

  def list_products do
    Repo.all(Product)
  end

  alias CoverflexApi.Benefits.User

  def get_user!(id) do
    User
    |> Repo.get!(id)
    |> Repo.preload(:orders)
  end

  def get_by_username!(username) do
    user =
      User
      |> Repo.get_by(username: username)
      |> Repo.preload(:orders)

    # validate_user(user)
  end

  def validate_user(user) do
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def fetch_products_for_order(order) do
    # load orders orderproducts
    Repo.preload(order, :orderproducts)
    # iterate through order's orderproducts and get their products
    orderproducts = order.orderproducts
    productlist = []

    Enum.map(orderproducts, fn orderproduct ->
      # Repo.preload(orderproduct, :order)
      # Repo.preload(orderproduct, :product)
      productlist ++ orderproduct.product
    end)

    productlist
  end

  def get_products(user) do
    # preload users orders
    # load_user_orders(user)
    # get orderproducts from the orders

    Enum.map(user.orders, fn order -> fetch_products_for_order(order) end)
    # store orderproducts in a variable
    # orderproducts = user.orderproducts
    # # iterate through the users orderproducts and return their associated products
    # Enum.map(orderproducts, fn orderproduct -> get_order_product_product(orderproduct) end)
  end

  alias CoverflexApi.Benefits.Order

  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  alias CoverflexApi.Benefits.OrderProduct

  def create_order_product(attrs \\ %{}) do
    %OrderProduct{}
    |> OrderProduct.changeset(attrs)
    |> Repo.insert()
  end

  # def get_order_product_product(orderproduct) do
  #   load_order_product(orderproduct)
  #   orderproduct.product
  # end

  # def load_order_product(orderproduct) do
  #   Repo.preload(orderproduct, :orders)
  #   Repo.preload(orderproduct, :products)
  # end
end
