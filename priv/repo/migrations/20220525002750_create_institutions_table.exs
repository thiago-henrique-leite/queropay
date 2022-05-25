defmodule Queropay.Repo.Migrations.CreateInstitutionsTable do
  use Ecto.Migration

  def change do
    create table(:institutions) do
      add(:name, :string)
      add(:document, :string)
      add(:kind, :string)

      timestamps()
    end

    create unique_index(:institutions, [:document])
  end
end
