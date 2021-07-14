defmodule CoverflexApiWeb.OrderView do
  use CoverflexApiWeb, :view
  alias CoverflexApiWeb.OrderView

  # def render("index.json", %{orders: orders}) do
  #   %{data: render_many(orders, OrderView, "order.json")}
  # end

  def render("show.json", %{order: order}) do
    %{order: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{items: [], user_id: order.user.username}
  end

  # render_many(order.products, OrderView, "items.json")

  def render("items.json", %{order: order}) do
    %{items: render_many(order.products, OrderView, "items.json")}
  end
end
