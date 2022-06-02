defmodule Queropay.EnrollmentBillsCreation do
  @moduledoc false
  use QueropayWeb, :service
  use Timex

  alias Queropay.Repo
  alias Queropay.Enrollment
  alias Queropay.Bill

  def perform(%Enrollment{} = enrollment) do
    params = %{
      "value" => calculate_bill_value(enrollment),
      "status" => "aberta",
      "enrollment_id" => enrollment.id
    }

    date = first_due_date(enrollment)

    for index <- 0..(enrollment.amount_bills - 1) do
      d = Timex.shift(date, months: index)
      params = Map.put(params, "due_date", due_date(enrollment.due_day, d.month, d.year))
      params |> create_bill()
    end
  end

  def perform(_), do: %{error: %{message: "Parâmetros inválidos!"}}

  def calculate_bill_value(enrollment) do
    enrollment.full_value / enrollment.amount_bills
  end

  def first_due_date(enrollment) do
    today = Timex.today()

    first_month = if(today.day >= enrollment.due_day, do: today.month + 1, else: today.month)

    due_date(enrollment.due_day, first_month, today.year)
  end

  def due_date(day, month, year) do
    case Date.new(year, month, day) do
      {:ok, date} -> date
      {:error, :invalid_date} -> Date.end_of_month(Date.new!(year, month, 1))
    end
  end

  def create_bill(%{} = params) do
    params
    |> Bill.changeset()
    |> Repo.insert()
  end
end
