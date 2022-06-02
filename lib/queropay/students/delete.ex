defmodule Queropay.Students.Delete do
  @moduledoc false
  alias Queropay.{Error, Repo, Student}

  def call(id) do
    case Repo.get(Student, id) do
      nil -> {:error, Error.build_not_found("Student")}
      student_schema -> Repo.delete(student_schema)
    end
  end
end
