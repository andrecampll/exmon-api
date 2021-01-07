defmodule ExmonApiWeb.TrainersController do
  use ExmonApiWeb, :controller

  alias ExmonApiWeb.Auth.Guardian

  action_fallback ExmonApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, trainer} <- ExmonApi.create_trainer(params),
    {:ok, token, _claims} <- Guardian.encode_and_sign(trainer) do
      conn
      |> put_status(:created)
      |> render("create.json", %{trainer: trainer, token: token})
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end

  defp handle_response({:ok, trainer}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, trainer: trainer)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error

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

  def show(conn, %{"id" => id}) do
    id
    |> ExmonApi.read_trainer()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> ExmonApi.update_trainer()
    |> handle_response(conn, "update.json", :ok)
  end
end
