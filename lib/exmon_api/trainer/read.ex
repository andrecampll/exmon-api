defmodule ExmonApi.Trainer.Read do
  alias ExmonApi.{Trainer, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format."}
      {:ok, uuid} -> read(uuid)
    end
  end

  defp read(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not found."}
      trainer -> {:ok, trainer}
    end
  end
end
