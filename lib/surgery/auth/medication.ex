defmodule Surgery.Auth.Medication do
  use Ecto.Schema
  import Ecto.Changeset

  alias Surgery.Repo
  alias Surgery.Auth.Medication
  alias Surgery.Auth.User
  require Ecto.Query

  schema "medications" do
    field :days, :integer
    field :name, :string
    belongs_to :user, User

    timestamps()
  end

  # Public

  def get_user_medications(user_id) do
    Medication
      |> Ecto.Query.where(user_id: ^user_id)
      |> Repo.all()
  end

  def create(medication) do
    %Medication{}
      |> changeset(medication)
      |> Repo.insert()
  end

  def update(medication, params) do
    medication
      |> changeset(params)
      |> Repo.update()
  end

  @doc false
  defp changeset(medication, attrs) do
    medication
    |> cast(attrs, [:name, :days, :user_id])
    |> validate_required([:name, :days, :user_id])
  end
end
