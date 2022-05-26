defmodule Queropay.Students.Update do
  alias Queropay.{Error, Student, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Student, id) do
      nil -> {:error, Error.build_not_found("Student")}
      student_schema -> update(student_schema, params)
    end
  end

  defp update(%Student{} = student, %{} = params) do
    student
    |> Student.changeset(params)
    |> Repo.update()
  end
end
