defmodule DiscussWeb.FallbackController do
  use DiscussWeb, :controller

  def call(conn, {:error, {:error_creating_topic, changeset}}) do
    conn
    |> put_flash(:error, "Error while trying to save topic")
    |> render("new.html", changeset: changeset)
  end
end
