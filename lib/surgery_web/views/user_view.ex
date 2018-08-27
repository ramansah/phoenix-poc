defmodule SurgeryWeb.UserView do
  use SurgeryWeb, :view
  alias SurgeryWeb.UserView
  alias SurgeryWeb.MedicationView

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, UserView, "user_full.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email}
  end

  def render("user_full.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email,
      token: user.token,
      medications: render_many(user.medications, MedicationView, "medication.json")}
  end
end
