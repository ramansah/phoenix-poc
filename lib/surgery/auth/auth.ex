defmodule Surgery.Auth do
  @moduledoc """
  The Auth context.
  """

  import Ecto.Query, warn: false
  
  alias Surgery.{Repo, HPSService}
  alias Surgery.Auth.User

  @doc """
  Get user from token and create/update record if necessary
  """
  def fetch_user(token) do
    case Repo.get_by(User, token: token) do
      # Token doesn't match in DB, either a new user or token expired
      nil -> HPSService.fetch_remote_user(token) |> create_or_update_user
      # User found in DB
      user -> {:ok, user}
    end
  end

  # Private

  defp create_or_update_user(remote_user) do
    case Repo.get_by(User, email: remote_user["email"]) do
      # New user
      nil -> User.create(remote_user)
      # Update token for existing user
      user -> User.update(user, remote_user)
    end
  end

end
