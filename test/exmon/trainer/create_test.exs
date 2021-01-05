defmodule ExmonApi.Trainer.CreateTest do
  use ExmonApi.DataCase

  alias ExmonApi.{Trainer, Repo}
  alias Trainer.Create

  describe "call/1" do
    test "it should be able to create a trainer" do
      params = %{name: "André", password: "123123"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{ name: "André" }} = response
      assert count_after > count_before
    end

    test "it should not be able to create a trainer" do
      params = %{name: "André"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{password: ["can't be blank"]}
    end
  end
end
