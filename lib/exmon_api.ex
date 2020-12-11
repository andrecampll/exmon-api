defmodule ExmonApi do
  alias ExmonApi.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call

  defdelegate delete_trainer(id), to: Trainer.Delete, as: :call
end
