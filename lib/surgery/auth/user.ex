defmodule Surgery.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Surgery.Repo
  alias Surgery.Auth.User
  alias Surgery.Management.Medication

  schema "users" do
    field :email, :string
    field :name, :string
    field :token, :string

    has_many :medications, Medication

    timestamps()
  end

  # Public

  def get_user(id) do
    Repo.get!(User, id)
      |> Repo.preload([:medications])
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

  @fields ~w(name email token)a

  defp changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:email)
    |> unique_constraint(:token)
    |> validate_format(:email, ~r/@/)
  end

end
