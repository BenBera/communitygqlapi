defmodule Community.Account.Users do
  use Ecto.Schema
  import Ecto.Changeset
  alias Community.News.Link

  schema "users" do
    field :email, :string
    field :name, :string
    field :role, :string
    field :token, :string

    has_many :links, Link, foreign_key: :author_id


    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:name, :email, :token, :role])
    |> validate_required([:name, :email, :role])
    |> unique_constraint(:email, name: :user_email_index)
    |> unique_constraint(:token, name: :user_token_index)
  end
end
