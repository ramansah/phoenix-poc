defmodule SurgeryWeb.UserController do
  use SurgeryWeb, :controller

  alias Surgery.Repo
  alias Surgery.Auth.User

  action_fallback SurgeryWeb.FallbackController

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = User.get_user(id)
    render(conn, "show.json", user: user)
  end

end
