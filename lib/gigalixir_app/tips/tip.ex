defmodule GigalixirApp.Tips.Tip do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tips" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(tip, attrs) do
    tip
    |> cast(attrs, [:body,:title])
    |> validate_required([:body,:title])
  end
end
