defmodule FormulaOneDataManagerWeb.DriverLive.Index do
  use FormulaOneDataManagerWeb, :live_view

  alias FormulaOneDataManager.Drivers

  def mount(_params, _session, socket) do
    drivers = Drivers.list_all()

    {:ok, assign(socket, drivers: drivers)}
  end
end
