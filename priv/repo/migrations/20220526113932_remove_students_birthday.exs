defmodule Queropay.Repo.Migrations.RemoveStudentsBirthday do
  use Ecto.Migration

  def change do
    alter table(:students) do
      remove :birthday
    end
  end
end
