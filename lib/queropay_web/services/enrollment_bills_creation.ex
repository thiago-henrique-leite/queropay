defmodule Queropay.EnrollmentBillsCreation do
  @moduledoc false
  use QueropayWeb, :service

  alias Queropay.Repo
  alias Queropay.Enrollment
  alias Queropay.Bill

  def perform(%Enrollment{} = enrollment) do
    bill_value = enrollment.full_value / enrollment.amount_bills

    today = Date.utc_today()

    {:ok, due_date} = Date.new(today.year, today.month, enrollment.due_day)

    params = %{
      "value" => bill_value,
      "status" => "aberta",
      "due_date" => due_date,
      "enrollment_id" => enrollment.id
    }

    for _i <- 1..(enrollment.amount_bills) do
      date = next_month(due_date)
      params = Map.put(params, "due_date", date)
      create_bill(params)
    end
  end

  def perform(_), do: %{error: %{message: "Parâmetros inválidos!"}}

  def create_bill(%{} = params) do
    params
    |> Bill.changeset()
    |> Repo.insert()
  end

  def next_month(%Date{} = date) do
    first_day_of_next_month = Date.add(date, Calendar.ISO.days_in_month(date.year, date.month) - date.day + 1)
    %{year: year, month: month} = first_day_of_next_month
    Date.add(first_day_of_next_month, min(date.day, Calendar.ISO.days_in_month(year, month)) - 1)
  end
end
