defmodule Queropay.Bills.Update do
  alias Queropay.{Error, Bill, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Bill, id) do
      nil -> {:error, Error.build_not_found("Bill")}
      bill_schema -> update(bill_schema, params)
    end
  end

  defp update(%Bill{} = bill, %{} = params) do
    bill
    |> Bill.changeset(params)
    |> Repo.update()
  end
end
