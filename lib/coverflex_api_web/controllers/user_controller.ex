defmodule CoverflexApiWeb.UserController do
  use CoverflexApiWeb, :controller

  alias CoverflexApi.Benefits
  alias CoverflexApi.Benefits.User

  action_fallback CoverflexApiWeb.FallbackController

  def show(conn, %{"id" => username}) do
    user = Benefits.get_by_username!(username)

    if user do
      # products =
      render(conn, "show.json", user: user)
    else
      new_user = Benefits.create_user(%{username: username, balance: 0})
      # Benefits.load_user(user.id)
      render(conn, "show.json", user: new_user)
    end
  end
end
