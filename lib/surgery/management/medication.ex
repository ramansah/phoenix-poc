defmodule Surgery.Management.Medication do
  use Ecto.Schema
  import Ecto.Changeset

  alias Surgery.Repo
  alias Surgery.Management.Medication
  alias Surgery.Auth.User
  require Ecto.Query


  schema "medications" do
    field :days, :integer
    field :name, :string
    belongs_to :user, User

    timestamps()
  end

  # Public

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

  @fields ~w(name days user_id)a

  @doc false
  defp changeset(medication, attrs) do
    medication
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
