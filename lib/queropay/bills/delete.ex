defmodule Queropay.Bills.Delete do
  alias Queropay.{Error, Repo, Bill}

  def call(id) do
    case Repo.get(Bill, id) do
      nil -> {:error, Error.build_not_found("Bill")}
      bill_schema -> Repo.delete(bill_schema)
    end
  end
end
