defmodule CoverflexApiWeb.UserController do
  use CoverflexApiWeb, :controller

  alias CoverflexApi.Benefits
  alias CoverflexApi.Benefits.User

  action_fallback CoverflexApiWeb.FallbackController

  def show(conn, %{"id" => username}) do
    user = Benefits.get_by_username!(username)

    if user do
      render(conn, "show.json", user: user)
    else
      user = Benefits.create_user(%{username: username, balance: 1000})
      render(conn, "show.json", user: user)
    end
  end
end
