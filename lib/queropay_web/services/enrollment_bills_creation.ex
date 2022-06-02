defmodule Queropay.EnrollmentBillsCreation do
  @moduledoc false
  use QueropayWeb, :service
  use Timex

  alias Queropay.Repo
  alias Queropay.Enrollment
  alias Queropay.Bill

  def perform(%Enrollment{} = enrollment) do
    params = %{
      "value" => enrollment.full_value / enrollment.amount_bills,
      "status" => "aberta",
      "enrollment_id" => enrollment.id
    }

    generate_bills(enrollment, params)
  end

  def perform(_), do: %{error: %{message: "Parâmetros inválidos!"}}

  def generate_bills(enrollment, params) do
    first_due_date = get_first_due_date(enrollment)

    for index <- 0..(enrollment.amount_bills - 1) do
      due_date = Timex.shift(first_due_date, months: index)

      Map.put(params, "due_date", build_date(enrollment.due_day, due_date.month, due_date.year))
        |> Bill.changeset()
        |> Repo.insert()
    end
  end

  def get_first_due_date(enrollment) do
    today = Timex.today()

    first_month = if(today.day >= enrollment.due_day, do: today.month + 1, else: today.month)

    build_date(enrollment.due_day, first_month, today.year)
  end

  def build_date(day, month, year) do
    case Date.new(year, month, day) do
      {:ok, date} -> date
      {:error, :invalid_date} -> Timex.end_of_month(year, month)
    end
  end
end
