defmodule ExmonApi.Repo.Migrations.CreatePokemon do
  use Ecto.Migration

  def change do
    create table(:pokemons, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :nickname, :string
      add :weight, :float
      add :types, {:array, :string}
      add :trainer_id, references(
        :trainers,
        type: :uuid,
        on_delete: :delete_all,
      ), null: false
      timestamps()
    end
  end
end
