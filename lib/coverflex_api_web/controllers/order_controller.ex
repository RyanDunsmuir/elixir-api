defmodule CoverflexApiWeb.OrderController do
  use CoverflexApiWeb, :controller

  alias CoverflexApi.Benefits
  alias CoverflexApi.Benefits.Order

  action_fallback CoverflexApiWeb.FallbackController

  # def index(conn, _params) do
  #   orders = Benefits.list_orders()
  #   render(conn, "index.json", orders: orders)
  # end

  def create(conn, %{"order" => order_params}) do
    # find the user based on the username
    # find the products in the database and throw an error if they dont exist
    # check if the user already has the products and throw an error if they have
    # calculate the order total and check if the user has sufficient balance
    # subtract the total from the users balance
    # ----------------

    # find the user based on the username
    # order_params.user_id
    conn.body_params.user_id

    with {:ok, %Order{} = order} <- Benefits.create_order() do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   order = Benefits.get_order!(id)
  #   render(conn, "show.json", order: order)
  # end

  # def update(conn, %{"id" => id, "order" => order_params}) do
  #   order = Benefits.get_order!(id)

  #   with {:ok, %Order{} = order} <- Benefits.update_order(order, order_params) do
  #     render(conn, "show.json", order: order)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   order = Benefits.get_order!(id)

  #   with {:ok, %Order{}} <- Benefits.delete_order(order) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
