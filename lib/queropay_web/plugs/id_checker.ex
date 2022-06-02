defmodule QueropayWeb.Plugs.IDChecker do
  @moduledoc false
  import Plug.Conn

  alias Plug.Conn

  def init(options), do: options

  def call(%Conn{params: %{"id" => id}} = conn, _opts) when is_integer(id) do
    conn
  end

  def call(%Conn{params: %{"id" => id}} = conn, _opts) do
    case Integer.parse(id) do
      :error -> render_error(conn)
      {_, ""} -> conn
    end
  end

  def call(conn, _opts), do: conn

  defp render_error(conn) do
    body = Jason.encode!(%{message: "Invalid ID"})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, body)
    |> halt()
  end
end
