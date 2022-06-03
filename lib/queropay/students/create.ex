defmodule Queropay.Students.Create do
  @moduledoc false
  alias Queropay.{Error, Student, Repo}

  def call(%{} = params) do
    Map.put(params, "birthday", string_to_date(params["birthday"]))
    |> Student.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def call(_any), do: "Os parâmetros devem estar no formato map!"

  defp handle_insert({:ok, %Student{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end

  def string_to_date(str) do
    case str |> Timex.parse("{D}/{0M}/{YYYY}") do
      {:ok, date} -> Timex.to_date(date)
      {:error, _} -> nil
    end
  end
end
