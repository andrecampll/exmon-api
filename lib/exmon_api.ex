defmodule ExmonApi do
  alias ExmonApi.{Trainer, Pokemon}
  alias Trainer.Pokemon, as: TrainerPokemon

  defdelegate create_trainer(params), to: Trainer.Create, as: :call

  defdelegate read_trainer(params), to: Trainer.Read, as: :call

  defdelegate update_trainer(params), to: Trainer.Update, as: :call

  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call

  defdelegate read_pokemon(params), to: Pokemon.Read, as: :call

  defdelegate create_trainer_pokemon(params), to: TrainerPokemon.Create, as: :call

  defdelegate read_trainer_pokemon(params), to: TrainerPokemon.Read, as: :call

  defdelegate update_trainer_pokemon(params), to: TrainerPokemon.Update, as: :call

  defdelegate delete_trainer_pokemon(params), to: TrainerPokemon.Delete, as: :call
end
