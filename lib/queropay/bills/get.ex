defmodule Queropay.Bills.Get do
  alias Queropay.{Error, Repo, Bill}

  def call(id) do
    case Repo.get(Bill, id) do
      nil -> {:error, Error.build_not_found("Bill")}
      bill_schema -> {:ok, bill_schema}
    end
  end

  def all do
    payload = %{bills: all_bills()}

    {:ok, payload}
  end

  defp all_bills do
    Bill
    |> Repo.all
    |> Enum.map(fn bill ->
      %{
        id: bill.id,
        value: bill.value,
        status: bill.status,
        due_date: bill.due_date,
        enrollment_id: bill.enrollment_id
      } end)
  end
end
