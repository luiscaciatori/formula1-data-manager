defmodule FormulaOneDataManager.Teams do
  @moduledoc """
  Manages everything relate to Teams such as
    - Create
    - Update drivers line up
    - Search
    - List
  """
  alias FormulaOneDataManager.Repo
  alias FormulaOneDataManager.Teams.Team

  @doc """
  Creates a new Team

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    attrs
    |> Team.create_changeset()
    |> Repo.insert()
  end
end
