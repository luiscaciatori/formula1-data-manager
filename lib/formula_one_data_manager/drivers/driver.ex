defmodule FormulaOneDataManager.Drivers.Driver do
  @moduledoc """
  Represents a Formula 1 driver
  """
  use Ecto.Schema

  import Ecto.Changeset

  @required_fields ~w(
    name
    country
    date_of_birth
    fastest_laps
    race_wins
    poles
  )a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "drivers" do
    field :name, :string
    field :country, :string
    field :date_of_birth, :date
    field :fastest_laps, :integer, default: 0
    field :poles, :integer, default: 0
    field :race_wins, :integer, default: 0

    timestamps()
  end

  @doc false
  def create_changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
