defmodule ExmonApi do
  alias ExmonApi.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call

  defdelegate delete_trainer(id), to: Trainer.Delete, as: :call

  defdelegate read_trainer(id), to: Trainer.Read, as: :call
end
