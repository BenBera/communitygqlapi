defmodule CommunityWeb.Schema.AccountsTypes  do
  use Absinthe.Schema.Notation
  alias CommunityWeb.Resolevers
  @desc "A user of a link"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string

    field :links, list_of(:link) do
      arg(:date, :date)
      resolve(&Resolevers.Content.list_links/3)
    end
  end

end
