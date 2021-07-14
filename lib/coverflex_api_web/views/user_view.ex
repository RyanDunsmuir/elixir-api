defmodule CoverflexApiWeb.UserView do
  use CoverflexApiWeb, :view
  alias CoverflexApiWeb.UserView
  alias CoverflexApi.Benefits.User

  # def render("index.json", %{users: users}) do
  #   %{data: render_many(users, UserView, "user.json")}
  # end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      user_id: user.username,
      data: %{
        balance: user.balance,
        product_ids: []
        # product_ids: [CoverflexApi.Benefits.get_user_products(user)]
      }
    }
  end

  def render("user_products.json", %{product: product}) do
    %{
      product_id: product.name
    }
  end
end
