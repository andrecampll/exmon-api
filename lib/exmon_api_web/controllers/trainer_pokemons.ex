defmodule ExmonApiWeb.TrainerPokemonController do
  use ExmonApiWeb, :controller

  action_fallback ExmonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExmonApi.create_trainer_pokemon()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, trainer}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, trainer: trainer)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
