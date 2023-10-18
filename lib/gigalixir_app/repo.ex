defmodule GigalixirApp.Repo do
  use Ecto.Repo,
    otp_app: :gigalixir_app,
    adapter: Ecto.Adapters.Postgres
end
