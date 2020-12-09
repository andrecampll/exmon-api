defmodule ExmonApiWeb.Router do
  use ExmonApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExmonApiWeb do
    pipe_through :api
    resources "/trainers", TrainersController, only: [
      :create,
      :show,
      :delete,
      :update,
    ]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ExmonApiWeb.Telemetry
    end
  end

  scope "/", ExmonApiWeb do
    pipe_through :api

    get "/", HelloController, :index
  end
end
