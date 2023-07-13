defmodule FormulaOneDataManager.Repo.Migrations.CreateAgeConstraintForDrivers do
  use Ecto.Migration

  def change do
    create constraint(:drivers, :driver_must_be_over_eighteen,
             check: "DATE_PART('YEAR', CURRENT_DATE) - DATE_PART('YEAR', date_of_birth) >= 18"
           )
  end
end
