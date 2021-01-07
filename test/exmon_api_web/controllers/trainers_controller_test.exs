defmodule ExmonApiWeb.Controllers.TrainersControllerTest do
  use ExmonApiWeb.ConnCase
  import ExmonApiWeb.Auth.Guardian

  alias ExmonApi.Trainer

  describe "show/2" do
    setup %{conn: conn} do
      params = %{name: "John Doe", password: "123123"}
      {:ok, trainer} = ExmonApi.create_trainer(params)
      {:ok, token, _claims} = encode_and_sign(trainer)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end

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

    test "it should not be able to show a trainer when the id is invalid", %{conn: conn} do
      response =
        conn
        |> get(Routes.trainers_path(conn, :show, "1234"))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid ID format."}

      assert response == expected_response
    end
  end
end
