defmodule ExmonApi do
  alias ExmonApi.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
end
