defmodule Surgery.AuthTest do
  use Surgery.DataCase

  alias Surgery.Auth

  describe "users" do
    alias Surgery.Auth.User

    @valid_attrs %{email: "some email", name: "some name", token: "some token"}
    @update_attrs %{email: "some updated email", name: "some updated name", token: "some updated token"}
    @invalid_attrs %{email: nil, name: nil, token: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_user()

      user
    end

  end

  describe "medications" do
    alias Surgery.Auth.Medication

    @valid_attrs %{days: 42, name: "some name"}
    @update_attrs %{days: 43, name: "some updated name"}
    @invalid_attrs %{days: nil, name: nil}

    def medication_fixture(attrs \\ %{}) do
      {:ok, medication} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_medication()

      medication
    end

  end
end
