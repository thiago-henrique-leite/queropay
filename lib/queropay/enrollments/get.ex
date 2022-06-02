defmodule Queropay.Enrollments.Get do
  alias Queropay.{Error, Repo, Enrollment}

  def call(id) do
    case Repo.get(Enrollment, id) do
      nil -> {:error, Error.build_not_found("Enrollment")}
      enrollment_schema -> {:ok, enrollment_schema}
    end
  end

  def all do
    payload = %{enrollments: all_enrollments()}

    {:ok, payload}
  end

  defp all_enrollments do
    Enrollment
    |> Repo.all
    |> Enum.map(fn enrollment ->
      %{
        id: enrollment.id,
        full_value: enrollment.full_value,
        amount_bills: enrollment.amount_bills,
        due_day: enrollment.due_day,
        course_name: enrollment.course_name,
        institution_id: enrollment.institution_id,
        student_id: enrollment.student_id
      } end)
  end
end
