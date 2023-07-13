defmodule FormulaOneDataManager.DriverFixtures do
  @moduledoc """
  Generates data for Drivers
  """
  alias Faker.Address
  alias Faker.Date
  alias Faker.Person
  alias FormulaOneDataManager.Drivers.Driver

  def params_for(:driver, attrs \\ %{}) do
    blueprint = %{
      name: Person.name(),
      country: Address.country(),
      date_of_birth: Date.date_of_birth(22..40),
      poles: Enum.random(0..30),
      fastest_laps: Enum.random(0..20),
      race_wins: Enum.random(0..30)
    }

    Map.merge(blueprint, attrs)
  end

  def invalid_params_for(:driver, attrs \\ %{}) do
    blueprint = %{
      name: nil,
      country: nil,
      date_of_birth: nil,
      poles: nil,
      fastest_laps: nil,
      race_wins: nil
    }

    Map.merge(blueprint, attrs)
  end

  def build(:driver, attrs \\ %{}) do
    :driver
    |> params_for(attrs)
    |> Driver.create_changeset()
    |> Ecto.Changeset.apply_changes()
  end
end
