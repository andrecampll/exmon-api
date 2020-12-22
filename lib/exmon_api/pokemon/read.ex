defmodule ExmonApi.Pokemon.Read do
  alias ExmonApi.PokeApi.Client
  alias ExmonApi.Pokemon

  def call(name) do
    name
    |> Client.get_pokemon()
    |> handle_response()
  end

  defp handle_response({:ok, pokemon}), do: {:ok, Pokemon.build(pokemon)}

  defp handle_response({:error, _pokemon} = error), do: error
end
