defmodule CoverflexApi.BenefitsTest do
  use CoverflexApi.DataCase

  alias CoverflexApi.Benefits

  describe "products" do
    alias CoverflexApi.Benefits.Product

    @valid_attrs %{name: "some name", price: 120.5}
    @update_attrs %{name: "some updated name", price: 456.7}
    @invalid_attrs %{name: nil, price: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Benefits.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Benefits.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Benefits.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Benefits.create_product(@valid_attrs)
      assert product.name == "some name"
      assert product.price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Benefits.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Benefits.update_product(product, @update_attrs)
      assert product.name == "some updated name"
      assert product.price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Benefits.update_product(product, @invalid_attrs)
      assert product == Benefits.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Benefits.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Benefits.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Benefits.change_product(product)
    end
  end

  describe "users" do
    alias CoverflexApi.Benefits.User

    @valid_attrs %{balance: 120.5, username: "some username"}
    @update_attrs %{balance: 456.7, username: "some updated username"}
    @invalid_attrs %{balance: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Benefits.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Benefits.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Benefits.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Benefits.create_user(@valid_attrs)
      assert user.balance == 120.5
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Benefits.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Benefits.update_user(user, @update_attrs)
      assert user.balance == 456.7
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Benefits.update_user(user, @invalid_attrs)
      assert user == Benefits.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Benefits.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Benefits.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Benefits.change_user(user)
    end
  end

  describe "orders" do
    alias CoverflexApi.Benefits.Order

    @valid_attrs %{total: 120.5}
    @update_attrs %{total: 456.7}
    @invalid_attrs %{total: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Benefits.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Benefits.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Benefits.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Benefits.create_order(@valid_attrs)
      assert order.total == 120.5
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Benefits.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Benefits.update_order(order, @update_attrs)
      assert order.total == 456.7
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Benefits.update_order(order, @invalid_attrs)
      assert order == Benefits.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Benefits.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Benefits.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Benefits.change_order(order)
    end
  end

  describe "orderproducts" do
    alias CoverflexApi.Benefits.OrderProduct

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def order_product_fixture(attrs \\ %{}) do
      {:ok, order_product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Benefits.create_order_product()

      order_product
    end

    test "list_orderproducts/0 returns all orderproducts" do
      order_product = order_product_fixture()
      assert Benefits.list_orderproducts() == [order_product]
    end

    test "get_order_product!/1 returns the order_product with given id" do
      order_product = order_product_fixture()
      assert Benefits.get_order_product!(order_product.id) == order_product
    end

    test "create_order_product/1 with valid data creates a order_product" do
      assert {:ok, %OrderProduct{} = order_product} = Benefits.create_order_product(@valid_attrs)
    end

    test "create_order_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Benefits.create_order_product(@invalid_attrs)
    end

    test "update_order_product/2 with valid data updates the order_product" do
      order_product = order_product_fixture()
      assert {:ok, %OrderProduct{} = order_product} = Benefits.update_order_product(order_product, @update_attrs)
    end

    test "update_order_product/2 with invalid data returns error changeset" do
      order_product = order_product_fixture()
      assert {:error, %Ecto.Changeset{}} = Benefits.update_order_product(order_product, @invalid_attrs)
      assert order_product == Benefits.get_order_product!(order_product.id)
    end

    test "delete_order_product/1 deletes the order_product" do
      order_product = order_product_fixture()
      assert {:ok, %OrderProduct{}} = Benefits.delete_order_product(order_product)
      assert_raise Ecto.NoResultsError, fn -> Benefits.get_order_product!(order_product.id) end
    end

    test "change_order_product/1 returns a order_product changeset" do
      order_product = order_product_fixture()
      assert %Ecto.Changeset{} = Benefits.change_order_product(order_product)
    end
  end
end
