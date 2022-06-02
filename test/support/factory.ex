defmodule Queropay.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: Queropay.Repo

  alias Queropay.Institution
  alias Queropay.Student
  alias Queropay.Enrollment
  alias Queropay.Bill

  def institution_params_factory do
    %{
      "name" => "UniFCV",
      "kind" => "universidade",
      "document" => "12345678901234"
    }
  end

  def institution_factory do
    %Institution{
      id: 1,
      name: "UniFCV",
      kind: "universidade",
      document: "12345678901234"
    }
  end

  def student_params_factory do
    %{
      "name" => "Joãozinho",
      "cpf" => "12345678911",
      "phone" => "995551212",
      "gender" => "m",
      "payment_method" => "boleto"
    }
  end

  def student_factory do
    %Student{
      id: 1,
      name: "Joãozinho",
      cpf: "12345678911",
      phone: "995551212",
      gender: "M",
      payment_method: "boleto"
    }
  end

  def enrollment_params_factory do
    %{
      "amount_bills" => 10,
      "full_value" => 1290,
      "due_day" => Date.new(2022, 11, 5),
      "course_name" => "Administração",
      "institution_id" => 1,
      "student_id" => 1
    }
  end

  def enrollment_factory do
    %Enrollment{
      id: 1,
      amount_bills: 10,
      full_value: 1290,
      due_day: 10,
      course_name: "Administração",
      institution_id: 1,
      student_id: 1
    }
  end

  def bill_params_factory do
    %{
      "value" => 150,
      "status" => "aberta",
      "due_date" => Date.new(2022, 11, 5),
      "enrollment_id" => 1
    }
  end

  def bill_factory do
    %Bill{
      id: 1,
      value: 150,
      status: "aberta",
      due_date: Date.new(2022, 11, 5),
      enrollment_id: 1
    }
  end
end
