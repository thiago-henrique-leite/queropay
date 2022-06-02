defmodule Queropay.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  @fields_that_can_be_changed [
    :value,
    :status,
    :due_date,
    :enrollment_id
  ]

  @required_fields [
    :value,
    :status,
    :due_date,
    :enrollment_id
  ]

  @derive {Jason.Encoder, only: [
    :id,
    :value,
    :status,
    :due_date,
    :enrollment_id
  ]}

  schema "bills" do
    field :value, :float
    field :status, :string
    field :due_date, :date
    belongs_to :enrollment, Queropay.Enrollment

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
    |> validate_number(:value, greater_than: 0)
    |> validate_inclusion(:status, ["aberta", "pendente", "paga", "cancelada"])
    |> foreign_key_constraint(:enrollment, name: :bills_enrollment_id_fkey)
  end
end
