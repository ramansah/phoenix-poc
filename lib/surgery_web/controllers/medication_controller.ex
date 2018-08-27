defmodule SurgeryWeb.MedicationController do
  use SurgeryWeb, :controller

  alias Surgery.Repo
  alias Surgery.Auth.Medication

  action_fallback SurgeryWeb.FallbackController

  def index(conn, _params) do
    user = conn.assigns.current_user
    medications = Medication.get_user_medications(user.id)
    render(conn, "index.json", medications: medications)
  end

  def update(conn, %{"id" => id, "medication" => params}) do
    medication = Repo.get!(Medication, id)
    case Medication.update(medication, params) do
      {:ok, record} -> render(conn, "show.json", medication: record)
      {:error, changeset} -> conn
        |> put_status(:unprocessable_entity)
        |> render(SurgeryWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

end
