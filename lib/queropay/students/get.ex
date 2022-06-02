defmodule Queropay.Students.Get do
  @moduledoc false
  alias Queropay.{Error, Repo, Student}

  def call(id) do
    case Repo.get(Student, id) do
      nil -> {:error, Error.build_not_found("Student")}
      student_schema -> {:ok, student_schema}
    end
  end

  def all do
    payload = %{students: all_students()}

    {:ok, payload}
  end

  defp all_students do
    Student
    |> Repo.all
    |> Enum.map(fn student ->
      %{
        id: student.id,
        name: student.name,
        cpf: student.cpf,
        birthday: student.birthday,
        phone: student.phone,
        gender: student.gender,
        payment_method: student.payment_method
      } end)
  end
end
