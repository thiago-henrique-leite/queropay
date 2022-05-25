defmodule QueropayWeb.FallbackController do
  use QueropayWeb, :controller

  alias Queropay.Error
  alias QueropayWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: changeset_or_message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: changeset_or_message)
  end
end
