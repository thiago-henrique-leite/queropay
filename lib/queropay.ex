defmodule Queropay do
  @moduledoc """
  Queropay keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Queropay.Institutions.Create, as: InstitutionCreate
  alias Queropay.Institutions.Get, as: InstitutionGet
  alias Queropay.Institutions.Delete, as: InstitutionDelete
  alias Queropay.Institutions.Update, as: InstitutionUpdate

  defdelegate create_institution(params), to: InstitutionCreate, as: :call
  defdelegate get_institution_by_id(id), to: InstitutionGet, as: :call
  defdelegate delete_institution(id), to: InstitutionDelete, as: :call
  defdelegate update_institution(params), to: InstitutionUpdate, as: :call
end
