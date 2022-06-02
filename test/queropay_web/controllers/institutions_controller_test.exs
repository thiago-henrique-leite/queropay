defmodule QueropayWeb.InstitutionsControllerTest do
  @moduledoc false
  use QueropayWeb.ConnCase, async: true

  import Queropay.Factory

  alias QueropayWeb.Router.Helpers, as: Routes

  describe "create/2" do
    test "when all params are valid, creates the institution", %{conn: conn} do
      params = build(:institution_params)

      response =
        conn
        |> post(Routes.institutions_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "Institution created!",
        "institution" => %{
          "id" => _id,
          "name" => "UniFCV",
          "document" => "12345678901234",
          "kind" => "universidade"
        },
      } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{"name" => "UniFCV"}

      response =
        conn
        |> post(Routes.institutions_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "document" => ["can't be blank"],
          "kind" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is an institution with the given id, deletes the institution", %{conn: conn} do
      id = 1
      insert(:institution)

      response =
        conn
        |> delete(Routes.institutions_path(conn, :delete, id))
        |> json_response(:ok)

      expected_response = %{
        "message" => "Institution deleted!"
      }

      assert expected_response == response
    end
  end
end
