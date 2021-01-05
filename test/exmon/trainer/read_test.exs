defmodule ExmonApi.Trainer.ReadTest do
  use ExmonApi.DataCase

  alias ExmonApi.{Trainer, Repo}
  alias Trainer.Read

  describe "call/1" do
    test "it should be able to read one trainer by id" do
      trainer_params = %{name: "André", password: "123123"}

      {:ok, struct} = Trainer.build(trainer_params)

      {:ok, trainer} = Repo.insert(struct)

      %Trainer{
        id: trainer_id,
      } = trainer

      response = Read.call(trainer_id)

      assert {
        :ok,
        %Trainer{
          id: trainer_id,
        },
      } = response
    end
  end
end
