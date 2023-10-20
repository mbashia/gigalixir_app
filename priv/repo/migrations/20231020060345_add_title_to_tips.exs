defmodule GigalixirApp.Repo.Migrations.AddTitleToTips do
  use Ecto.Migration

  def change do
    alter table(:tips) do
      add(:title, :string)
   end

  end
end
