defmodule Queropay.Enrollment do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @fields_that_can_be_changed [
    :full_value,
    :amount_bills,
    :due_day,
    :course_name,
    :institution_id,
    :student_id
  ]

  @required_fields [
    :full_value,
    :amount_bills,
    :due_day,
    :course_name,
    :institution_id,
    :student_id
  ]

  @derive {Jason.Encoder, only: [
    :id,
    :full_value,
    :amount_bills,
    :due_day,
    :course_name,
    :institution_id,
    :student_id
  ]}

  schema "enrollments" do
    field :full_value, :float
    field :amount_bills, :integer
    field :due_day, :integer
    field :course_name, :string
    belongs_to :institution, Queropay.Institution
    belongs_to :student, Queropay.Student

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
    |> validate_number(:full_value, greater_than: 0)
    |> validate_number(:amount_bills, greater_than: 0)
    |> validate_inclusion(:due_day, 1..31)
    |> foreign_key_constraint(:institution, name: :enrollments_institution_id_fkey)
    |> foreign_key_constraint(:student, name: :enrollments_student_id_fkey)
  end
end
