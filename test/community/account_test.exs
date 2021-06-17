defmodule Community.AccountTest do
  use Community.DataCase

  alias Community.Account

  describe "users" do
    alias Community.Account.Users

    @valid_attrs %{email: "some email", name: "some name", role: "some role", token: "some token"}
    @update_attrs %{email: "some updated email", name: "some updated name", role: "some updated role", token: "some updated token"}
    @invalid_attrs %{email: nil, name: nil, role: nil, token: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_users()

      users
    end

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Account.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Account.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Account.create_users(@valid_attrs)
      assert users.email == "some email"
      assert users.name == "some name"
      assert users.role == "some role"
      assert users.token == "some token"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, %Users{} = users} = Account.update_users(users, @update_attrs)
      assert users.email == "some updated email"
      assert users.name == "some updated name"
      assert users.role == "some updated role"
      assert users.token == "some updated token"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_users(users, @invalid_attrs)
      assert users == Account.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Account.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Account.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Account.change_users(users)
    end
  end
end
