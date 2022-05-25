defmodule QueropayWeb.InstitutionsView do
  use QueropayWeb, :view

  alias Queropay.Institution

  def render("create.json", %{institution: %Institution{} = institution}) do
    %{
      message: "Institution created!",
      institution: %{
        id: institution.id,
        name: institution.name,
        document: institution.document,
        kind: institution.kind
      }
    }
  end
end
