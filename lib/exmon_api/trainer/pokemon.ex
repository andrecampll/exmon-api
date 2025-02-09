defmodule ExmonApi.Trainer.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  alias ExmonApi.Trainer

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required [:name, :nickname, :weight, :types, :trainer_id]

  schema "pokemons" do
    field :name, :string
    field :nickname, :string
    field :weight, :float
    field :types, {:array, :string}
    belongs_to(:trainer, Trainer)
    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:nickname, min: 2)
  end

  def update_changeset(pokemon, params) do
    pokemon
    |> cast(params, [:nickname])
    |> validate_required([:nickname])
    |> validate_length(:nickname, min: 2)
  end
end
