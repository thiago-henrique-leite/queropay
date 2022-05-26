defmodule Queropay.Repo.Migrations.AddStudentsBirthday do
  use Ecto.Migration

  def change do
    alter table(:students) do
      add :birthday, :date
    end
  end
end
