defmodule FormulaOneDataManagerWeb.DriverLiveTest do
  use FormulaOneDataManagerWeb.ConnCase, async: true

  import FormulaOneDataManager.DriverFixtures

  describe "Index" do
    test "lists all current drivers", %{conn: conn} do
      insert(:driver, %{name: "Lewis Hamilton", number: 44})

      {:ok, live, _html} = live(conn, ~p"/drivers")

      assert live
             |> element("h2")
             |> render() =~ "Lewis Hamilton"

      assert live
             |> element("h3")
             |> render() =~ "44"
    end
  end
end
