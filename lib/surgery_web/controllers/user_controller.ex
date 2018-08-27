defmodule SurgeryWeb.UserController do
  use SurgeryWeb, :controller

  alias Surgery.Auth.User

  action_fallback SurgeryWeb.FallbackController

  def index(conn, _params) do
    users = User.list_users()
    render(conn, "index.json", users: users)
  end

end
