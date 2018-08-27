defmodule SurgeryWeb.Router do
  use SurgeryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SurgeryWeb do
    pipe_through :api
    resources "/users", UserController, only: [:index]
  end
end
