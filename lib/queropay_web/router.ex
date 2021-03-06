defmodule QueropayWeb.Router do
  use QueropayWeb, :router

  alias QueropayWeb.Plugs.IDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug IDChecker
  end

  scope "/api", QueropayWeb do
    pipe_through :api

    resources "/institutions", InstitutionsController, except: [:edit, :new]
    resources "/students", StudentsController, except: [:edit, :new]
    resources "/enrollments", EnrollmentsController, except: [:edit, :new]
    resources "/bills", BillsController, except: [:edit, :new, :create]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: QueropayWeb.Telemetry
    end
  end
end
