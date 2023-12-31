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
      assert attrs[:number] == driver.number
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

  describe "add_race_win!/1" do
    test "increases number of race wins by 1" do
      %{race_wins: race_wins} = driver = insert(:driver)

      expected_race_wins = race_wins + 1

      assert %Driver{race_wins: ^expected_race_wins} = Drivers.add_race_win!(driver)
    end
  end

  describe "add_pole_position!/1" do
    test "increases number of pole positions" do
      %{poles: poles} = driver = insert(:driver)

      expected_poles = poles + 1

      assert %Driver{poles: ^expected_poles} = Drivers.add_pole_position!(driver)
    end
  end

  describe "add_fastest_lap!/1" do
    test "increases number of fastest laps" do
      %{fastest_laps: fastest_laps} = driver = insert(:driver)

      expected_fastest_laps = fastest_laps + 1

      assert %Driver{fastest_laps: ^expected_fastest_laps} = Drivers.add_fastest_lap!(driver)
    end
  end

  describe "list_all/0" do
    test "returns all available drivers on db" do
      driver = insert(:driver)

      assert [^driver] = Drivers.list_all()
    end
  end
end
