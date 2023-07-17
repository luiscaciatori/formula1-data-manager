defmodule FormulaOneDataManager.Repo.Migrations.MakeAllDriverFieldsRequired do
  use Ecto.Migration

  def change do
    alter table(:drivers) do
      modify :poles, :integer, null: false, default: 0, from: {:integer, null: true}
      modify :race_wins, :integer, null: false, default: 0, from: {:integer, null: true}
      modify :fastest_laps, :integer, null: false, default: 0, from: {:integer, null: true}
    end
  end
end
