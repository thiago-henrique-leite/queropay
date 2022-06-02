defmodule QueropayWeb.BillsView do
  use QueropayWeb, :view

  alias Queropay.Bill

  def render("create.json", %{bill: %Bill{} = bill}) do
    %{
      message: "Bill created!",
      bill: bill
    }
  end
  def render("bill.json", %{bill: %Bill{} = bill}), do: %{bill: bill}
  def render("bills.json", %{bills: bills}), do: bills
  def render("delete.json", _), do: %{message: "Bill deleted!"}
end
