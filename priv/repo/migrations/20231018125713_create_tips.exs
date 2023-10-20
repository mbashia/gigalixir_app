defmodule GigalixirApp.Repo.Migrations.CreateTips do
  use Ecto.Migration

  def change do
    create table(:tips) do
      add :body, :string
      add :title, :string

      timestamps()
    end
  end
end
