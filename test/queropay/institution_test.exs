defmodule Queropay.InstitutionTest do
  use Queropay.DataCase, async: true

  import Queropay.Factory

  alias Ecto.Changeset
  alias Queropay.Institution
  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:institution_params)

      response = Institution.changeset(params)

      assert %Changeset{changes: params, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:institution_params)

      update_params = %{name: "Unip"}

      changeset_with_current_data = Institution.changeset(params)

      response = Institution.changeset(changeset_with_current_data, update_params)

      assert %Changeset{changes: %{name: "Unip"}, valid?: true} = response
    end

    test "when there are some error, returns a invalid changeset" do
      params = build(:institution_params, %{kind: "invalid", document: "123"})

      response = Institution.changeset(params)

      expected_response = %{
        kind: ["is invalid"],
        document: ["should be 14 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
