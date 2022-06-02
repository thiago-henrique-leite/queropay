defmodule QueropayWeb.EnrollmentsController do
  use QueropayWeb, :controller

  alias Queropay.Enrollment
  alias QueropayWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _) do
    with {:ok, enrollments} <- Queropay.get_all_enrollments() do
      conn
      |> put_status(:ok)
      |> render("enrollments.json", enrollments: enrollments)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Enrollment{} = enrollment} <- Queropay.get_enrollment_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("enrollment.json", enrollment: enrollment)
    end
  end

  def update(conn, %{} = params) do
    with {:ok, %Enrollment{} = enrollment} <- Queropay.update_enrollment(params) do
      conn
      |> put_status(:ok)
      |> render("enrollment.json", enrollment: enrollment)
    end
  end

  def create(conn, params) do
    with {:ok, %Enrollment{} = enrollment} <- Queropay.create_enrollment(params) do
      conn
      |> put_status(:created)
      |> render("create.json", enrollment: enrollment)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Enrollment{}} <- Queropay.delete_enrollment(id) do
      conn
      |> put_status(:ok)
      |> render("delete.json")
    end
  end
end
