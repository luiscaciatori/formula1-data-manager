defmodule FormulaOneDataManager.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false, size: 60
      add :principal, :string, null: false, size: 60
      add :poles, :integer, null: false, default: 0
      add :race_wins, :integer, null: false, default: 0
      add :fastest_lap, :integer, null: false, default: 0
      add :championship_wins, :integer, null: false, default: 0

      timestamps()
    end

    create unique_index(:teams, [:name])
    create unique_index(:teams, [:principal])
  end
end
