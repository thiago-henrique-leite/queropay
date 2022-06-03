defmodule Queropay.Student do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @fields_that_can_be_changed [
    :name,
    :cpf,
    :birthday,
    :phone,
    :gender,
    :payment_method
  ]

  @required_fields [
    :name,
    :cpf,
    :phone,
    :gender,
    :payment_method
  ]

  @derive {Jason.Encoder, only: [:id, :name, :cpf, :birthday, :phone, :gender, :payment_method]}

  schema "students" do
    field :name, :string
    field :cpf, :string
    field :birthday, :date
    field :phone, :string
    field :gender, :string
    field :payment_method, :string
    has_many :enrollments, Queropay.Enrollment

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
    |> validate_length(:cpf, is: 11)
    |> validate_length(:phone, is: 9)
    |> validate_inclusion(:gender, ["f", "m"])
    |> validate_inclusion(:payment_method, ["boleto", "cartao", "pix"])
    |> unique_constraint(:cpf)
  end
end
