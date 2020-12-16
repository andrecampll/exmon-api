defmodule ExmonApi do
  alias ExmonApi.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call

  defdelegate read_trainer(params), to: Trainer.Read, as: :call

  defdelegate update_trainer(params), to: Trainer.Update, as: :call

  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call

end
