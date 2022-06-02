defmodule Queropay.Institutions.Update do
  @moduledoc false
  alias Queropay.{Error, Institution, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Institution, id) do
      nil -> {:error, Error.build_not_found("Institution")}
      institution_schema -> update(institution_schema, params)
    end
  end

  defp update(%Institution{} = institution, %{} = params) do
    institution
    |> Institution.changeset(params)
    |> Repo.update()
  end
end
