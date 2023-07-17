defmodule FormulaOneDataManager.Teams.Team do
  @moduledoc """
  Represents a Formula 1 team
  """
  use Ecto.Schema

  import Ecto.Changeset

  @required_fields ~w(
    name
    championship_wins
    principal
    race_wins
    poles
    fastest_lap
  )a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams" do
    field :name, :string
    field :principal, :string
    field :poles, :integer, default: 0
    field :race_wins, :integer, default: 0
    field :fastest_lap, :integer, default: 0
    field :championship_wins, :integer, default: 0

    timestamps()
  end

  @doc false
  def create_changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 3, max: 60)
    |> validate_length(:principal, min: 3, max: 60)
    |> unique_constraint(:name)
    |> unique_constraint(:principal)
  end
end
