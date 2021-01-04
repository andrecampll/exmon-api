defmodule ExmonApi.TrainerTest do
  use ExmonApi.DataCase

  alias ExmonApi.Trainer

  describe "changeset/1" do
    test "should be able to return a valid changeset" do
      params = %{name: "André", password: "123123"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          name: "André",
          password: "123123",
        },
        errors: [],
        data: %ExmonApi.Trainer{},
        valid?: true
      } = response

    end

    test "should not be able to return a valid changeset" do
      params = %{password: "123123"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          password: "123123",
        },
        data: %ExmonApi.Trainer{},
        valid?: false
      } = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end
end
