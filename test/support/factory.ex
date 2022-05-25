defmodule Queropay.Factory do
  use ExMachina

  def institution_params_factory do
    %{
      "name" => "UniFCV",
      "kind" => "universidade",
      "document" => "12345678901234"
    }
  end
end
