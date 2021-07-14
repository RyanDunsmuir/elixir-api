defmodule CoverflexApi.Repo do
  use Ecto.Repo,
    otp_app: :coverflex_api,
    adapter: Ecto.Adapters.Postgres
end
