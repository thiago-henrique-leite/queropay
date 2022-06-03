defmodule Queropay.Repo.Migrations.CreateStudentsTable do
  use Ecto.Migration

  def change do
    create table(:students) do
      add(:name, :string)
      add(:cpf, :string)
      add(:birthday, :date)
      add(:phone, :string)
      add(:gender, :string)
      add(:payment_method, :string)

      timestamps()
    end

    create unique_index(:students, [:cpf])
  end
end
