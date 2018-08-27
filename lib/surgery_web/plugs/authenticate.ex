defmodule AuthenticationPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _) do
    {:ok, user} = (conn
      |> get_req_header("authorization")
      |> Enum.at(0)
      |> String.split("Bearer ")
      |> Enum.at(1)
      |> Surgery.Auth.fetch_user)
    conn
      |> assign(:current_user, user)
  end

end