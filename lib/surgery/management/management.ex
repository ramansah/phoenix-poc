defmodule Surgery.Management do
  @moduledoc """
  The Management context.
  """  

  require Ecto.Query
  alias Surgery.Repo
  alias Surgery.Management.Medication
  

  def get_user_medications(user_id) do
    Medication
      |> Ecto.Query.where(user_id: ^user_id)
      |> Repo.all()
  end

end
