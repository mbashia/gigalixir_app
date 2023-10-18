defmodule GigalixirApp.Tips.Tip do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tips" do
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(tip, attrs) do
    tip
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
