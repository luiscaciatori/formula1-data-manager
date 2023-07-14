defmodule FormulaOneDataManager.Repo.Migrations.AddNumberToDrivers do
  use Ecto.Migration

  def change do
    alter table(:drivers) do
      add :number, :integer, null: false
    end

    create unique_index(:drivers, [:number])
  end
end
