defmodule FormulaOneDataManager.DriversTest do
  use FormulaOneDataManager.DataCase, async: true

  import FormulaOneDataManager.DriverFixtures

  alias FormulaOneDataManager.Drivers
  alias FormulaOneDataManager.Drivers.Driver

  describe "create_driver/1" do
    test "creates driver with valid data" do
      attrs = params_for(:driver)

      assert {:ok, %Driver{} = driver} = Drivers.create_driver(attrs)
      assert attrs[:name] == driver.name
      assert attrs[:country] == driver.country
      assert attrs[:date_of_birth] == driver.date_of_birth
      assert attrs[:poles] == driver.poles
      assert attrs[:fastest_laps] == driver.fastest_laps
      assert attrs[:race_wins] == driver.race_wins
    end

    test "returns errors with invalid data" do
      attrs = invalid_params_for(:driver)

      assert {:error, %Ecto.Changeset{} = changeset} = Drivers.create_driver(attrs)

      assert_cant_be_blank(changeset, :name)
      assert_cant_be_blank(changeset, :country)
      assert_cant_be_blank(changeset, :date_of_birth)
      assert_cant_be_blank(changeset, :poles)
      assert_cant_be_blank(changeset, :fastest_laps)
      assert_cant_be_blank(changeset, :race_wins)
    end
  end
end
