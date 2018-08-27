defmodule Surgery.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Surgery.Repo
  alias Surgery.Auth.User

  schema "users" do
    field :email, :string
    field :name, :string
    field :token, :string

    timestamps()
  end

  # Public

  def list_users do
    Repo.all(User)
  end

  def create(user) do
    %User{}
      |> changeset(user)
      |> Repo.insert()
  end

  def update(user, params) do
    user
      |> changeset(params)
      |> Repo.update()
  end

  # Private

  defp changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :token])
    |> validate_required([:name, :email, :token])
    |> unique_constraint(:email)
    |> unique_constraint(:token)
  end

end
