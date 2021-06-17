defmodule Community.News.Link do
  use Ecto.Schema
  import Ecto.Changeset
  alias Community.Account.Users

  schema "links" do
    field :description, :string
    field :url, :string
    belongs_to :author, Users

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url, :description, :author_id])
    |> validate_required([:url, :description, :author_id])
  end
end
