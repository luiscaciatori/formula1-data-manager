defmodule FormulaOneDataManager.TeamFixtures do
  @moduledoc false
  alias Faker.Person

  @names [
    "Oracle Red Bull Racing",
    "Mercedes-AMG Petronas F1 Team",
    "Aston Martin Aramco Cognizant F1 Team",
    "Scuderia Ferrari",
    "Mclaren F1 Team",
    "BWT Alpine F1 Team",
    "Willians Racing",
    "Money Graan Haas F1 Team",
    "Alfa Romeo F1 Team Stake",
    "Scuderia AlphaTauri"
  ]

  def params_for(:team, attrs \\ %{}) do
    blueprint = %{
      name: Enum.random(@names),
      principal: Person.name(),
      poles: random_number(),
      race_wins: random_number(),
      fastest_lap: random_number(),
      championship_wins: random_number()
    }

    Map.merge(blueprint, attrs)
  end

  def invalid_params_for(:team, attrs \\ %{}) do
    blueprint = %{
      principal: nil,
      name: nil,
      poles: nil,
      race_wins: nil,
      fastest_lap: nil,
      championship_wins: nil
    }

    Map.merge(blueprint, attrs)
  end

  defp random_number, do: Enum.random(15..150)
end
