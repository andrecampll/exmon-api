defmodule ExmonApi.Trainer.Pokemon.Read do
  alias ExmonApi.{Trainer.Pokemon, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format."}
      {:ok, uuid} -> read(uuid)
    end
  end

  defp read(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokémon not found."}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
