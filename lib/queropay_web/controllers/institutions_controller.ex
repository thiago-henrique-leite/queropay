defmodule QueropayWeb.InstitutionsController do
  use QueropayWeb, :controller

  alias Queropay.{Institution, Repo}

  def index(conn) do
    with {:ok, institutions} <- Repo.all(Institution) do
      conn
      |> put_status(:created)
      |> render("index.json", institution: institutions)
    end
  end

  def create(conn, params) do
    with {:ok, %Institution{} = institution} <- Queropay.create_institution(params) do
      conn
      |> put_status(:created)
      |> render("create.json", institution: institution)
    end
  end
end
