defmodule QueropayWeb.BillsController do
  use QueropayWeb, :controller

  alias Queropay.Bill
  alias QueropayWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _) do
    with {:ok, bills} <- Queropay.get_all_bills() do
      conn
      |> put_status(:ok)
      |> render("bills.json", bills: bills)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Bill{} = bill} <- Queropay.get_bill_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("bill.json", bill: bill)
    end
  end

  def update(conn, %{} = params) do
    with {:ok, %Bill{} = bill} <- Queropay.update_bill(params) do
      conn
      |> put_status(:ok)
      |> render("bill.json", bill: bill)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Bill{}} <- Queropay.delete_bill(id) do
      conn
      |> put_status(:ok)
      |> render("delete.json")
    end
  end
end
