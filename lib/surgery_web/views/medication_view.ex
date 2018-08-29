defmodule SurgeryWeb.MedicationView do
  use SurgeryWeb, :view
  use JaSerializer.PhoenixView

  attributes([
    :name,
    :days
  ])

end
