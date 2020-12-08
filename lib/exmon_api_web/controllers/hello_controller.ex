defmodule ExmonApiWeb.HelloController do
  use ExmonApiWeb, :controller

  def index(conn, _params) do
    text(conn, "Hello World")
  end
end
