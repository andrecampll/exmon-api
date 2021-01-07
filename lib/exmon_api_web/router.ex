defmodule ExmonApiWeb.Router do
  use ExmonApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug ExmonApiWeb.Auth.Pipeline
  end

  scope "/api", ExmonApiWeb do
    pipe_through :api

    post "/trainers", TrainersController, :create
    post "/trainers/signin", TrainersController, :sign_in
    get "/pokemons/:name", PokemonsController, :show
  end

  scope "/api", ExmonApiWeb do
    pipe_through [:api, :auth]

    resources "/trainers", TrainersController, only: [
      :show,
      :delete,
      :update,
    ]

    resources "/trainer-pokemons", TrainerPokemonsController, only: [
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
