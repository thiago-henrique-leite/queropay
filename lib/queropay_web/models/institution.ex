defmodule Queropay.Institution do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @fields_that_can_be_changed [
    :name,
    :document,
    :kind
  ]

  @required_fields [
    :name,
    :document,
    :kind
  ]

  @derive {Jason.Encoder, only: [:id, :name, :document, :kind]}

  schema "institutions" do
    field :name, :string
    field :document, :string
    field :kind, :string
    has_many :enrollments, Queropay.Enrollment

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
    |> validate_length(:document, is: 14)
    |> validate_inclusion(:kind, ["universidade", "escola", "creche"])
    |> unique_constraint(:document)
  end
end
