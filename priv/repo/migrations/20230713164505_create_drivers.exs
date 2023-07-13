defmodule FormulaOneDataManager.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false, size: 60
      add :country, :string, null: false, size: 60
      add :date_of_birth, :date, null: false
      add :race_wins, :integer, default: 0
      add :poles, :integer, default: 0
      add :fastest_laps, :integer, default: 0

      timestamps()
    end
  end
end
