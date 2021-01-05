defmodule ExmonApiWeb.Controllers.TrainersControllerTest do
  use ExmonApiWeb.ConnCase

  alias ExmonApi.Trainer

  describe "show/2" do
    test "it should be able to show a trainer", %{conn: conn} do
      params = %{name: "John Doe", password: "123123"}

      {:ok, %Trainer{ id: id }} = ExmonApi.create_trainer(params)

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
        "message" => _message,
        "trainer" => %{
          "id" => _id,
          "inserted_at" => _inserted_at,
          "name" => "John Doe",
          },
        } = response
    end
  end
end
