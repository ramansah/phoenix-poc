defmodule SurgeryWeb.UserView do
  use SurgeryWeb, :view
  use JaSerializer.PhoenixView

  attributes([
    :id,
    :name,
    :email
  ])

  has_many(
    :medications,
    serializer: SurgeryWeb.MedicationView,
    include: false
  )

end
