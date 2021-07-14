defmodule CoverflexApiWeb.OrderProductController do
  use CoverflexApiWeb, :controller

  alias CoverflexApi.Benefits
  alias CoverflexApi.Benefits.OrderProduct

  action_fallback CoverflexApiWeb.FallbackController

  # def index(conn, _params) do
  #   orderproducts = Benefits.list_orderproducts()
  #   render(conn, "index.json", orderproducts: orderproducts)
  # end

  # def create(conn, %{"order_product" => order_product_params}) do
  #   with {:ok, %OrderProduct{} = order_product} <- Benefits.create_order_product(order_product_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.order_product_path(conn, :show, order_product))
  #     |> render("show.json", order_product: order_product)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   order_product = Benefits.get_order_product!(id)
  #   render(conn, "show.json", order_product: order_product)
  # end

  # def update(conn, %{"id" => id, "order_product" => order_product_params}) do
  #   order_product = Benefits.get_order_product!(id)

  #   with {:ok, %OrderProduct{} = order_product} <- Benefits.update_order_product(order_product, order_product_params) do
  #     render(conn, "show.json", order_product: order_product)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   order_product = Benefits.get_order_product!(id)

  #   with {:ok, %OrderProduct{}} <- Benefits.delete_order_product(order_product) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
