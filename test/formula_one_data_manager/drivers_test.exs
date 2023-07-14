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

    test "returns errors when name has more than 60 characters" do
      invalid_name = String.duplicate("abc", 21)

      attrs = params_for(:driver, %{name: invalid_name})

      assert {:error, %Ecto.Changeset{} = changeset} = Drivers.create_driver(attrs)
      assert %{name: ["should be at most 60 character(s)"]} = errors_on(changeset)
    end

    test "returns errors when name has less than 3 characters" do
      attrs = params_for(:driver, %{name: "ab"})

      assert {:error, %Ecto.Changeset{} = changeset} = Drivers.create_driver(attrs)
      assert %{name: ["should be at least 3 character(s)"]} = errors_on(changeset)
    end

    test "returns errors when country has more than 60 characters" do
      invalid_name = String.duplicate("abc", 21)

      attrs = params_for(:driver, %{country: invalid_name})

      assert {:error, %Ecto.Changeset{} = changeset} = Drivers.create_driver(attrs)
      assert %{country: ["should be at most 60 character(s)"]} = errors_on(changeset)
    end

    test "returns errors when country has less than 3 characters" do
      attrs = params_for(:driver, %{country: "ab"})

      assert {:error, %Ecto.Changeset{} = changeset} = Drivers.create_driver(attrs)
      assert %{country: ["should be at least 3 character(s)"]} = errors_on(changeset)
    end

    test "returns errors when driver is not over 18 years old" do
      attrs = params_for(:driver, %{date_of_birth: Faker.Date.date_of_birth(1..17)})

      assert {:error, %Ecto.Changeset{} = changeset} = Drivers.create_driver(attrs)
      assert %{date_of_birth: ["driver should be over 18 years old"]} = errors_on(changeset)
    end

    test "returns error when trying to insert the same number twice" do
      attrs1 = params_for(:driver, %{number: 1})
      attrs2 = params_for(:driver, %{number: 1})

      assert {:ok, %Driver{}} = Drivers.create_driver(attrs1)
      assert {:error, %Ecto.Changeset{} = changeset} = Drivers.create_driver(attrs2)
      assert %{number: ["has already been taken"]} = errors_on(changeset)
    end
  end
end
