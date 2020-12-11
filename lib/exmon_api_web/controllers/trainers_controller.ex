defmodule ExmonApiWeb.TrainersController do
  use ExmonApiWeb, :controller

  action_fallback ExmonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExmonApi.create_trainer()
    |> handle_create(conn)
  end

  defp handle_create({:ok, trainer}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", trainer: trainer)
  end

  defp handle_create({:error, _changeset} = error, _conn), do: error

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
end
