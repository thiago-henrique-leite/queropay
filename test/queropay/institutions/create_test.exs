defmodule Queropay.Institutions.CreateTest do
  use Queropay.DataCase, async: true

  import Queropay.Factory

  alias Queropay.{Error, Institution}
  alias Queropay.Institutions.Create

  describe "call/1" do
    test "when all params are valid, returns the institution" do
      params = build(:institution_params)

      response = Create.call(params)

      assert {:ok, %Institution{id: _id, name: "UniFCV", kind: "universidade", document: "12345678901234"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:institution_params, %{"kind" => "invalid", "document" => "123"})

      response = Create.call(params)

      expected_response = %{
        kind: ["is invalid"],
        document: ["should be 14 character(s)"]
      }

      assert {:error, %Error{result: changeset, status: :bad_request}} = response

      assert errors_on(changeset) == expected_response
    end
  end
end
