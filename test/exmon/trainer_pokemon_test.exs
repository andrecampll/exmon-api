defmodule ExmonApi.TrainerPokemonTest do
  use ExmonApi.DataCase

  alias ExmonApi.Trainer.Pokemon
  alias Ecto.UUID

  describe "changeset/1" do
    test "should be able to return a valid changeset" do
      trainer_id = UUID.generate()

      params = %{
        nickname: "Fofo",
        weight: 80,
        types: ["Normal"],
        name: "furret",
        trainer_id: trainer_id,
      }

      response = Pokemon.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          name: "furret",
          nickname: "Fofo",
          types: ["Normal"],
          weight: 80.0,
          trainer_id: trainer_id,
        },
        errors: [],
        valid?: true,
        data: %ExmonApi.Trainer.Pokemon{},
      } = response
    end

    test "should not be able to return a valid changeset" do
      trainer_id = UUID.generate()

      params = %{
        weight: 80,
        types: ["Normal"],
        name: "furret",
        trainer_id: trainer_id,
      }

      response = Pokemon.changeset(params)

      assert errors_on(response) == %{nickname: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "should be able to return a valid struct" do
      trainer_id = UUID.generate()

      params = %{
        nickname: "Fofo",
        weight: 80,
        types: ["Normal"],
        name: "furret",
        trainer_id: trainer_id,
      }

      response = Pokemon.build(params)

      assert {
        :ok,
        %Pokemon{
          inserted_at: nil,
          name: "furret",
          nickname: "Fofo",
          trainer_id: trainer_id,
          types: ["Normal"],
          weight: 80.0
        },
      } = response
    end
  end
end
