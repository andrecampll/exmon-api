defmodule ExmonApiWeb.FallbackController do
  use ExmonApiWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExmonApiWeb.ErrorView)
    |> render("401.json", message: "Trainer unauthorized")
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExmonApiWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
