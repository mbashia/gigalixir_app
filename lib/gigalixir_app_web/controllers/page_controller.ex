defmodule GigalixirAppWeb.PageController do
  use GigalixirAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
