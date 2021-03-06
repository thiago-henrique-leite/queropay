defmodule Queropay.Error do
  @moduledoc false
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found(module), do: build(:not_found, "#{module} not found!")
end
