defmodule FormulaOneDataManager.Teams.TeamDriver do
  use Ecto.Schema

  import Ecto.Changeset

  alias FormulaOneDataManager.Drivers.Driver
  alias FormulaOneDataManager.Teams.Team

  @required_fields ~w(
    team_id
    driver_id
    current_team
  )a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams_drivers" do
    field :current_team, :boolean, default: false

    belongs_to :driver, Driver
    belongs_to :team, Team

    timestamps()
  end

  @doc false
  def set_new_driver_changeset(%Team{} = team, %Driver{} = driver) do
    attrs = %{current_team: true, team_id: team.id, driver_id: driver.id}

    %__MODULE__{}
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
