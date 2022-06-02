defmodule Queropay.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: Queropay.Repo

  alias Queropay.Institution

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
end
