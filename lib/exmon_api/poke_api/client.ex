defmodule ExmonApi.PokeApi.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2"
  plug Tesla.Middleware.JSON

  def get_pokemon(name) do
    "/pokemon/#{name}"
    |> get()
    |> handle_get()
  end

  def handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}

  def handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, "Pokemon not found"}

  def handle_get({:error, _error} = error), do: error
end
