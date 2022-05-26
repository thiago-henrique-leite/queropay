defmodule QueropayWeb.StudentsView do
  use QueropayWeb, :view

  alias Queropay.Student

  def render("create.json", %{student: %Student{} = student}) do
    %{
      message: "Student created!",
      student: student
    }
  end
  def render("student.json", %{student: %Student{} = student}), do: %{student: student}
  def render("students.json", %{students: students}), do: students
  def render("delete.json", _), do: %{message: "Student deleted!"}
end
