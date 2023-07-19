defmodule FormulaOneDataManager.TeamsTest do
  use FormulaOneDataManager.DataCase, async: true

  import FormulaOneDataManager.TeamFixtures

  alias FormulaOneDataManager.Teams
  alias FormulaOneDataManager.Teams.Team

  describe "create_team/1" do
    test "creates a team successfully" do
      attrs = params_for(:team)

      assert {:ok, %Team{} = team} = Teams.create_team(attrs)
      assert attrs[:name] == team.name
      assert attrs[:principal] == team.principal
      assert attrs[:poles] == team.poles
      assert attrs[:race_wins] == team.race_wins
      assert attrs[:fastest_lap] == team.fastest_lap
      assert attrs[:championship_wins] == team.championship_wins
    end

    test "returns error with invalid data" do
      attrs = invalid_params_for(:team)

      assert {:error, %Ecto.Changeset{} = changeset} = Teams.create_team(attrs)
      assert_cant_be_blank(changeset, :name)
      assert_cant_be_blank(changeset, :principal)
      assert_cant_be_blank(changeset, :poles)
      assert_cant_be_blank(changeset, :race_wins)
      assert_cant_be_blank(changeset, :fastest_lap)
      assert_cant_be_blank(changeset, :championship_wins)
    end

    test "returns error when name is inserted twice" do
      team_name = "Scuderia AlphaTauri"
      attrs1 = params_for(:team, %{name: team_name})
      attrs2 = params_for(:team, %{name: team_name})

      assert {:ok, %Team{name: ^team_name}} = Teams.create_team(attrs1)
      assert {:error, %Ecto.Changeset{} = changeset} = Teams.create_team(attrs2)
      assert %{name: ["has already been taken"]} = errors_on(changeset)
    end

    test "returns error when team principal is inserted twice" do
      team_principal = "Christian Horner"
      attrs1 = params_for(:team, %{principal: team_principal})
      attrs2 = params_for(:team, %{principal: team_principal})

      assert {:ok, %Team{principal: ^team_principal}} = Teams.create_team(attrs1)
      assert {:error, %Ecto.Changeset{} = changeset} = Teams.create_team(attrs2)
      assert %{principal: ["has already been taken"]} = errors_on(changeset)
    end

    test "returns errors when name has more than 60 characters" do
      invalid_name = String.duplicate("abc", 21)

      attrs = params_for(:team, %{name: invalid_name})

      assert {:error, %Ecto.Changeset{} = changeset} = Teams.create_team(attrs)
      assert %{name: ["should be at most 60 character(s)"]} = errors_on(changeset)
    end

    test "returns errors when name has less than 3 characters" do
      attrs = params_for(:team, %{name: "ab"})

      assert {:error, %Ecto.Changeset{} = changeset} = Teams.create_team(attrs)
      assert %{name: ["should be at least 3 character(s)"]} = errors_on(changeset)
    end

    test "returns errors when team principal has more than 60 characters" do
      invalid_name = String.duplicate("abc", 21)

      attrs = params_for(:team, %{principal: invalid_name})

      assert {:error, %Ecto.Changeset{} = changeset} = Teams.create_team(attrs)
      assert %{principal: ["should be at most 60 character(s)"]} = errors_on(changeset)
    end

    test "returns errors when team principal has less than 3 characters" do
      attrs = params_for(:team, %{principal: "ab"})

      assert {:error, %Ecto.Changeset{} = changeset} = Teams.create_team(attrs)
      assert %{principal: ["should be at least 3 character(s)"]} = errors_on(changeset)
    end
  end
end
