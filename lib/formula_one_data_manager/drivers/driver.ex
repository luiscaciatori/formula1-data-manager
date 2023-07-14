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
    number
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
    field :number, :integer

    timestamps()
  end

  @doc false
  def create_changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 3, max: 60)
    |> validate_length(:country, min: 3, max: 60)
    |> validate_date_of_birth()
    |> unique_constraint(:number)
  end

  def add_race_win_changeset(%__MODULE__{} = driver, attrs) do
    driver
    |> cast(attrs, [:race_wins])
    |> validate_required([:race_wins])
  end

  defp validate_date_of_birth(changeset) do
    date_of_birth = get_field(changeset, :date_of_birth)

    if driver_over_eighteen?(date_of_birth),
      do: changeset,
      else: add_error(changeset, :date_of_birth, "driver should be over 18 years old")
  end

  defp driver_over_eighteen?(date_of_birth) do
    Timex.diff(Date.utc_today(), date_of_birth, :years) >= 18
  end
end
