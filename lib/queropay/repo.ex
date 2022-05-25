defmodule Queropay.Repo do
  use Ecto.Repo,
    otp_app: :queropay,
    adapter: Ecto.Adapters.Postgres
end
