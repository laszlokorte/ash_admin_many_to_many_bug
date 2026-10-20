defmodule ManyRepoWeb.PageController do
  use ManyRepoWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
