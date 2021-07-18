defmodule CoverflexApiWeb.OrderController do
  use CoverflexApiWeb, :controller

  alias CoverflexApi.Benefits
  alias CoverflexApi.Benefits.Order

  action_fallback CoverflexApiWeb.FallbackController

  # def index(conn, _params) do
  #   orders = Benefits.list_orders()
  #   render(conn, "index.json", orders: orders)
  # end

  def create(conn, %{"order" => %{"items" => items, "user_id" => username}}) do
    # find the user based on the username
    user = Benefits.get_by_username(username)
    order_total = 0
    balance = user.balance

    # find the products in the database and throw an error if they dont exist
    products = Enum.map(items, fn item -> validate_product(item, order_total, conn) end)

    # get the product names and create a list to compare with user product_ids
    product_names = Enum.map(products, fn product -> product.name end)

    # check if the user already has the products and throw an error if they have
    Enum.each(user.product_ids, fn product_id ->
      if !Enum.member?(product_names, product_id) do
        render(conn, "products_already_purchased.json")
      end
    end)

    # calculate the order total and check if the user has sufficient balance
    # subtract the total from the users balance
    if balance < order_total do
      render(conn, "insufficient_balance.json")
    else
      balance = balance - order_total
    end

    # add the product names to users product_ids
    user.product_ids ++ product_names

    # create the order and display it
    order = Benefits.create_order(user_id: user.id, total: order_total)
    render(conn, "show.json", %{order: order, product_ids: product_names})

    # with {:ok, %Order{} = order} <- Benefits.create_order() do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", Routes.order_path(conn, :show, order))
    #   |> render("show.json", %{order: order, product_ids: product_names})
    # end
  end

  def validate_product(name, order_total, conn) do
    product = Benefits.get_product!(name)

    if product == nil do
      render(conn, "products_not_found.json")
    else
      order_total = order_total + product.price
      product
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
