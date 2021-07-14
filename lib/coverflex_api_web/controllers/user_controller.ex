defmodule CoverflexApiWeb.UserController do
  use CoverflexApiWeb, :controller

  alias CoverflexApi.Benefits
  alias CoverflexApi.Benefits.User

  action_fallback CoverflexApiWeb.FallbackController

  # def index(conn, _params) do
  #   users = Benefits.list_users()
  #   render(conn, "index.json", users: users)
  # end

  # def create(conn, %{"user" => user_params}) do
  #   with {:ok, %User{} = user} <- Benefits.create_user(user_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.user_path(conn, :show, user))
  #     |> render("show.json", user: user)
  #   end
  # end

  def show(conn, %{"id" => username}) do
    user = Benefits.get_by_username!(username)

    if user do
      render(conn, "show.json", user: user)
    else
      user = Benefits.create_user(%{username: username, balance: 0})
      render(conn, "show.json", user: user)
    end
  end

  # def update(conn, %{"id" => id, "user" => user_params}) do
  #   user = Benefits.get_user!(id)

  #   with {:ok, %User{} = user} <- Benefits.update_user(user, user_params) do
  #     render(conn, "show.json", user: user)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   user = Benefits.get_user!(id)

  #   with {:ok, %User{}} <- Benefits.delete_user(user) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
