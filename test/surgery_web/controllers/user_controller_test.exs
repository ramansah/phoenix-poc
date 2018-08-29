defmodule SurgeryWeb.UserControllerTest do
  use SurgeryWeb.ConnCase

  alias Surgery.Auth.User

  @create_attrs %{email: "abc@xyz.com", name: "John Doe", token: "abc123"}
  #@update_attrs %{email: "xyz@abc.com", name: "Jane Done", token: "xyz456"}
  @invalid_attrs %{email: nil, name: nil, token: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get conn, user_path(conn, :index)
      assert json_response(conn, 200)["users"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid" do
      {status, _} = User.create(@create_attrs)
      assert status == :ok
    end

    test "renders errors when data is invalid" do
      {status, _} = User.create(@invalid_attrs)
      assert status == :error
    end
  end

end
