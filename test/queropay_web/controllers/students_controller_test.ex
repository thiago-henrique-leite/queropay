defmodule QueropayWeb.StudentsControllerTest do
  @moduledoc false
  use QueropayWeb.ConnCase, async: true

  import Queropay.Factory

  alias QueropayWeb.Router.Helpers, as: Routes

  describe "create/2" do
    test "when all params are valid, creates the student", %{conn: conn} do
      params = build(:student_params)

      response =
        conn
        |> post(Routes.students_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "Student created!",
        "student" => %{
          "id" => _id,
          "name" => "Joãozinho",
          "cpf" => "12345678911",
          "phone" => "995551212",
          "gender" => "m",
          "payment_method" => "boleto"
        },
      } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{"name" => "Mariazinha"}

      response =
        conn
        |> post(Routes.students_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "cpf" => ["can't be blank"],
          "gender" => ["can't be blank"],
          "payment_method" => ["can't be blank"],
          "phone" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is an student with the given id, deletes the student", %{conn: conn} do
      id = 1
      insert(:student)

      response =
        conn
        |> delete(Routes.students_path(conn, :delete, id))
        |> json_response(:ok)

      expected_response = %{
        "message" => "Student deleted!"
      }

      assert expected_response == response
    end
  end
end
