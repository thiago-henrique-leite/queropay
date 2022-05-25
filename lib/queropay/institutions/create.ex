defmodule Queropay.Institutions.Create do
  alias Queropay.{Institution, Repo}

  def call(%{} = params) do
    params
    |> Institution.changeset()
    |> Repo.insert()
  end

  def call(_), do: "Os parâmetros devem estar no formato map!"
end
