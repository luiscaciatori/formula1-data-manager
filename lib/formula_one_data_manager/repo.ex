defmodule FormulaOneDataManager.Repo do
  use Ecto.Repo,
    otp_app: :formula_one_data_manager,
    adapter: Ecto.Adapters.Postgres
end
