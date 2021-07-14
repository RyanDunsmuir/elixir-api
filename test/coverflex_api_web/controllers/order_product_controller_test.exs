defmodule CoverflexApiWeb.OrderProductControllerTest do
  use CoverflexApiWeb.ConnCase

  alias CoverflexApi.Benefits
  alias CoverflexApi.Benefits.OrderProduct

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:order_product) do
    {:ok, order_product} = Benefits.create_order_product(@create_attrs)
    order_product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all orderproducts", %{conn: conn} do
      conn = get(conn, Routes.order_product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create order_product" do
    test "renders order_product when data is valid", %{conn: conn} do
      conn = post(conn, Routes.order_product_path(conn, :create), order_product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.order_product_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.order_product_path(conn, :create), order_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update order_product" do
    setup [:create_order_product]

    test "renders order_product when data is valid", %{conn: conn, order_product: %OrderProduct{id: id} = order_product} do
      conn = put(conn, Routes.order_product_path(conn, :update, order_product), order_product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.order_product_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, order_product: order_product} do
      conn = put(conn, Routes.order_product_path(conn, :update, order_product), order_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete order_product" do
    setup [:create_order_product]

    test "deletes chosen order_product", %{conn: conn, order_product: order_product} do
      conn = delete(conn, Routes.order_product_path(conn, :delete, order_product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.order_product_path(conn, :show, order_product))
      end
    end
  end

  defp create_order_product(_) do
    order_product = fixture(:order_product)
    %{order_product: order_product}
  end
end
