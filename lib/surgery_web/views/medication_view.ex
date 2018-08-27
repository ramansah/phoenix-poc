defmodule SurgeryWeb.MedicationView do
  use SurgeryWeb, :view
  alias SurgeryWeb.MedicationView

  def render("index.json", %{medications: medications}) do
    %{medications: render_many(medications, MedicationView, "medication.json")}
  end

  def render("show.json", %{medication: medication}) do
    %{medication: render_one(medication, MedicationView, "medication.json")}
  end

  def render("medication.json", %{medication: medication}) do
    %{id: medication.id,
      name: medication.name,
      days: medication.days}
  end
end
