defmodule Surgery.Auth do
  @moduledoc """
  The Auth context.
  """

  import Ecto.Query, warn: false
  
  alias Surgery.Repo
  alias Surgery.Auth.User
  alias Surgery.HPSService

  @doc """
  Get user from token and create/update record if necessary
  """
  def fetch_user(token) do
    case Repo.get_by(User, token: token) do
      nil -> HPSService.fetch_remote_user(token) |> create_or_update_user
      user -> {:ok, user}
    end
  end

  # Private

  defp create_or_update_user(remote_user) do
    case Repo.get_by(User, email: remote_user["email"]) do
      nil -> User.create(remote_user)
      user -> User.update(remote_user)
    end
  end

end
