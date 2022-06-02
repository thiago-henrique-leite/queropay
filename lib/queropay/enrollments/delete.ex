defmodule Queropay.Enrollments.Delete do
  @moduledoc false
  alias Queropay.{Error, Repo, Enrollment}

  def call(id) do
    case Repo.get(Enrollment, id) do
      nil -> {:error, Error.build_not_found("Enrollment")}
      enrollment_schema -> Repo.delete(enrollment_schema)
    end
  end
end
