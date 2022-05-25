defmodule QueropayWeb.InstitutionsView do
  use QueropayWeb, :view

  alias Queropay.Institution

  def render("create.json", %{institution: %Institution{} = institution}) do
    %{
      message: "Institution created!",
      institution: institution
    }
  end

  def render("institution.json", %{institution: %Institution{} = institution}), do: %{institution: institution}

  def render("delete.json", _), do: %{message: "Institution deleted!"}
end
