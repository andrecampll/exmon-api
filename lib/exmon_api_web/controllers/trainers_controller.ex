defmodule ExmonApiWeb.TrainersController do
  use ExmonApiWeb, :controller

  def create(conn, params) do
    params
    |> ExmonApi.create_trainer()
    |> handle_response(conn)
  end

  def handle_response({:ok, trainer}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", trainer: trainer)
  end
end
