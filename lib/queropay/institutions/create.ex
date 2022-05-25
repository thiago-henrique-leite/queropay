defmodule Queropay.Institutions.Create do
  alias Queropay.{Error, Institution, Repo}

  def call(%{} = params) do
    params
    |> Institution.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def call(_any), do: "Os parâmetros devem estar no formato map!"

  defp handle_insert({:ok, %Institution{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
