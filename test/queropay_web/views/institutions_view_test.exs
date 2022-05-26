defmodule QueropayWeb.InstitutionsViewTest do
  use QueropayWeb.ConnCase, async: true

  import Phoenix.View
  import Queropay.Factory

  alias QueropayWeb.InstitutionsView

  test "renders create.json" do
    institution = build(:institution)

    response = render(InstitutionsView, "create.json", institution: institution)

    assert %{
      message: "Institution created!",
      institution: %Queropay.Institution{
        id: 1,
        name: "UniFCV",
        document: "12345678901234",
        kind: "universidade"
      },
    } = response
  end
end
