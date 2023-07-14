defmodule FormulaOneDataManager.Drivers do
  @moduledoc """
  Manages everything relate to Drivers such as
    - Create
    - Update info
    - Search
    - List
  """
  alias FormulaOneDataManager.Drivers.Driver
  alias FormulaOneDataManager.Repo

  @doc """
  Creates a driver

  ## Examples

    iex> create_driver(%{field: value})
    {:ok, %Driver{}}

  """
  def create_driver(attrs \\ %{}) do
    attrs
    |> Driver.create_changeset()
    |> Repo.insert()
  end

  @doc """
  Adds a new race win for driver

  ## Examples

      iex> add_race_win!(%Driver{})
      %Driver{}

      iex> add_race_win!(%Driver{})
      ** (Ecto.InvalidChangesetError)

      iex> add_race_win!(%Driver{})
      ** (Postgrex.Error)

  """
  def add_race_win!(%Driver{} = driver) do
    attrs = %{race_wins: driver.race_wins + 1}

    driver
    |> Driver.add_race_win_changeset(attrs)
    |> Repo.update!()
  end

  @doc """
  Adds a new pole position for driver

  ## Examples

      iex> add_pole_position!(%Driver{})
      %Driver{}

      iex> add_pole_position!(%Driver{})
      ** (Ecto.InvalidChangesetError)

      iex> add_pole_position!(%Driver{})
      ** (Postgrex.Error)

  """
  def add_pole_position!(%Driver{} = driver) do
    attrs = %{poles: driver.poles + 1}

    driver
    |> Driver.add_pole_changeset(attrs)
    |> Repo.update!()
  end
end
