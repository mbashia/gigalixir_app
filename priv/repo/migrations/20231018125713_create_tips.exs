defmodule GigalixirApp.Repo.Migrations.CreateTips do
  use Ecto.Migration

  def change do
    create table(:tips) do
      add :body, :string


      timestamps()
    end
  end
end
