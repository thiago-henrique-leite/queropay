defmodule QueropayWeb.StudentsController do
  use QueropayWeb, :controller

  alias Queropay.Student
  alias QueropayWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _) do
    with {:ok, students} <- Queropay.get_all_students() do
      conn
      |> put_status(:ok)
      |> render("students.json", students: students)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Student{} = student} <- Queropay.get_student_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("student.json", student: student)
    end
  end

  def update(conn, %{} = params) do
    with {:ok, %Student{} = student} <- Queropay.update_student(params) do
      conn
      |> put_status(:ok)
      |> render("student.json", student: student)
    end
  end

  def create(conn, params) do
    with {:ok, %Student{} = student} <- Queropay.create_student(params) do
      conn
      |> put_status(:created)
      |> render("create.json", student: student)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Student{}} <- Queropay.delete_student(id) do
      conn
      |> put_status(:ok)
      |> render("delete.json")
    end
  end
end
