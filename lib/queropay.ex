defmodule Queropay do
  @moduledoc """
  Queropay keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Queropay.Institutions.Create, as: InstitutionCreate

  defdelegate create_institution(params), to: InstitutionCreate, as: :call
end
