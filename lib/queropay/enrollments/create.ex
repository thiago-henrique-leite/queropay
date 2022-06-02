defmodule Queropay.Enrollments.Create do
  @moduledoc false
  alias Queropay.{Error, Enrollment, Repo}

  def call(%{} = params) do
    params
    |> Enrollment.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def call(_any), do: "Os parâmetros devem estar no formato map!"

  defp handle_insert({:ok, %Enrollment{} = enrollment} = result) do
    Queropay.generate_bills(enrollment)
    result
  end

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
