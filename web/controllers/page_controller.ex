defmodule ReactWebpackPrototype.PageController do
  use ReactWebpackPrototype.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
