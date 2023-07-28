defmodule FormulaOneDataManager.Repo.Migrations.CreateTeamsDrivers do
  use Ecto.Migration

  def change do
    create table(:teams_drivers, primary_key: false) do
      add :id, :binary_id, foreign_key: true
      add :current_team, :boolean, null: false, default: false
      add :driver_id, references(:drivers, type: :binary_id), null: false
      add :team_id, references(:teams, type: :binary_id), null: false

      timestamps()
    end

    create unique_index(:teams_drivers, [:team_id, :driver_id, :current_team])
  end
end
