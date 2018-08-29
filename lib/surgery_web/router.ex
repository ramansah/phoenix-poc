defmodule SurgeryWeb.Router do
  use SurgeryWeb, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
    plug(JaSerializer.Deserializer)
  end

  pipeline :authorize do
    plug AuthenticationPlug
  end

  scope "/api", SurgeryWeb do
    pipe_through :api
    resources "/users", UserController, only: [:index, :show]
  end

  scope "/api", SurgeryWeb do
    pipe_through [:api, :authorize]
    resources "/medications", MedicationController, only: [:index, :create, :update]
  end

end
