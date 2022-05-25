defmodule Queropay.Institutions.Get do
  alias Queropay.{Error, Repo, Institution}

  def call(id) do
    case Repo.get(Institution, id) do
      nil -> {:error, Error.build_not_found("Institution")}
      institution_schema -> {:ok, institution_schema}
    end
  end
end