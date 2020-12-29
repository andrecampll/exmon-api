defmodule ExmonApiWeb.TrainerPokemonsView do
  use ExmonApiWeb, :view

  alias ExmonApi.Trainer.Pokemon

  def render("create.json", %{pokemon: %Pokemon{
    id: id,
    name: name,
    nickname: nickname,
    types: types,
    trainer_id: trainer_id,
    weight: weight,
    inserted_at: inserted_at,
  }}) do
    %{
      message: "Pokemon created!",
      trainer: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{pokemon: %Pokemon{
    id: id,
    name: name,
    nickname: nickname,
    types: types,
    trainer: %{
      id: trainer_id,
      name: trainer_name,
    },
    weight: weight,
    inserted_at: inserted_at,
  }}) do
    %{
      message: "Showing pokemon",
      trainer: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer: %{
          id: trainer_id,
          name: trainer_name,
        },
        weight: weight,
        inserted_at: inserted_at
      }
    }
  end
end
