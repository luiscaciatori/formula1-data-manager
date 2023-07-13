defmodule FormulaOneDataManager.DriverFixtures do
  @moduledoc """
  Generates data for Drivers
  """
  alias Faker.Address
  alias Faker.Date
  alias Faker.Person
  alias FormulaOneDataManager.Drivers.Driver

  def params_for(:driver, attrs \\ %{}) do
    %{
      name: Person.name,
      country: Address.country,
      date_of_birth: Date.date_of_birth(22..40),
      poles: Enum.random(0..30),
      fastest_laps: Enum.random(0..20),
      race_wins: Enum.random(0..30),
    }
  end

  def build(:driver, attrs \\ %{}) do
    :driver
    |> params_for()
    |> Driver.create_changeset()
    |> Ecto.Changeset.apply_changes()
  end
end
