defmodule Surgery.ManagementTest do
  use Surgery.DataCase

  alias Surgery.Auth
  alias Surgery.Auth.User

  describe "medications" do

    @user_attrs %{email: "abc@xyz.com", name: "John Doe", token: "abc123"}
    @valid_attrs %{days: 10, name: "Aspirin"}
    #@update_attrs %{days: 12, name: "Disprin"}

    setup %{conn: conn} do
      User.create(@user_attrs)
      {:ok, conn: put_req_header(conn, "accept", "application/json")}
      {:ok, conn: put_req_header(conn, "Authorization", "Bearer #{@user_attrs.token}")}
    end

    test "render valid medication" do
      conn = get conn, medication_path(conn, :create, medication: @valid_attrs)
      assert json_response(conn, 200)["medication"] == @valid_attrs
    end

  end
end
