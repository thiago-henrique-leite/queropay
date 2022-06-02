defmodule Queropay.Repo.Migrations.CreateBillsTable do
  use Ecto.Migration

  def change do
    create table(:bills) do
      add(:value, :float)
      add(:due_date, :date)
      add(:status, :string)
      add(:enrollment_id, references(:enrollments))

      timestamps()
    end
  end
end
