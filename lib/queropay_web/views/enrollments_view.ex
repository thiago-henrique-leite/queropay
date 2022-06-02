defmodule QueropayWeb.EnrollmentsView do
  use QueropayWeb, :view

  alias Queropay.Enrollment

  def render("create.json", %{enrollment: %Enrollment{} = enrollment}) do
    %{
      message: "Enrollment created!",
      enrollment: enrollment
    }
  end
  def render("enrollment.json", %{enrollment: %Enrollment{} = enrollment}), do: %{enrollment: enrollment}
  def render("enrollments.json", %{enrollments: enrollments}), do: enrollments
  def render("delete.json", _), do: %{message: "Enrollment deleted!"}
end
