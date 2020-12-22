defmodule ExmonApiWeb.PokemonsController do
  use ExmonApiWeb, :controller

  action_fallback ExmonApiWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> ExmonApi.read_pokemon()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    |> json(pokemon)
  end

  defp handle_response({:error, _reason} = error, _conn), do: error
end
