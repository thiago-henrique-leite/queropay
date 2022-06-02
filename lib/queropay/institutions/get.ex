defmodule Queropay.Institutions.Get do
  @moduledoc false
  alias Queropay.{Error, Repo, Institution}

  def call(id) do
    case Repo.get(Institution, id) do
      nil -> {:error, Error.build_not_found("Institution")}
      institution_schema -> {:ok, institution_schema}
    end
  end

  def all do
    payload = %{institutions: all_institutions()}

    {:ok, payload}
  end

  defp all_institutions do
    Institution
    |> Repo.all
    |> Enum.map(fn institution ->
      %{
        id: institution.id,
        name: institution.name,
        kind: institution.kind,
        document: institution.document
      } end)
  end
end
