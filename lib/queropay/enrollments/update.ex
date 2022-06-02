defmodule Queropay.Enrollments.Update do
  alias Queropay.{Error, Enrollment, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Enrollment, id) do
      nil -> {:error, Error.build_not_found("Enrollment")}
      enrollment_schema -> update(enrollment_schema, params)
    end
  end

  defp update(%Enrollment{} = enrollment, %{} = params) do
    enrollment
    |> Enrollment.changeset(params)
    |> Repo.update()
  end
end
