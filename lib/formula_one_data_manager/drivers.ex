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
end
