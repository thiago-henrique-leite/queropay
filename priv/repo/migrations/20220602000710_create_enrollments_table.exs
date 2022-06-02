defmodule Queropay.Repo.Migrations.CreateEnrollmentsTable do
  use Ecto.Migration

  def change do
    create table(:enrollments) do
      add(:full_value, :float)
      add(:amount_bills, :integer)
      add(:due_day, :integer)
      add(:course_name, :string)
      add(:institution_id, references(:institutions))
      add(:student_id, references(:students))

      timestamps()
    end
  end
end
