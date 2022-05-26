defmodule QueropayWeb.InstitutionsController do
  use QueropayWeb, :controller

  alias Queropay.Institution
  alias QueropayWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _) do
    with {:ok, institutions} <- Queropay.get_all_institutions() do
      conn
      |> put_status(:ok)
      |> render("institutions.json", institutions: institutions)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Institution{} = institution} <- Queropay.get_institution_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("institution.json", institution: institution)
    end
  end

  def update(conn, %{} = params) do
    with {:ok, %Institution{} = institution} <- Queropay.update_institution(params) do
      conn
      |> put_status(:ok)
      |> render("institution.json", institution: institution)
    end
  end

  def create(conn, params) do
    with {:ok, %Institution{} = institution} <- Queropay.create_institution(params) do
      conn
      |> put_status(:created)
      |> render("create.json", institution: institution)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Institution{}} <- Queropay.delete_institution(id) do
      conn
      |> put_status(:ok)
      |> render("delete.json")
    end
  end
end
