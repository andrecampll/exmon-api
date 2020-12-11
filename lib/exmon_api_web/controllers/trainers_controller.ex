defmodule ExmonApiWeb.TrainersController do
  use ExmonApiWeb, :controller

  action_fallback ExmonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExmonApi.create_trainer()
    |> handle_response(conn)
  end

  defp handle_response({:ok, trainer}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", trainer: trainer)
  end

  defp handle_response({:error, _changeset} = error, _conn), do: error

  def delete(conn, %{"id" => id}) do
    id
    |> ExmonApi.delete_trainer()
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error
end
