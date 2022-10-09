defmodule DiscussWeb.FallbackController do
  use DiscussWeb, :controller

  def call(conn, {:error, :error_creating_topic}) do
    conn
    |> put_flash(:error, "Error while trying to save topic")
    |> redirect(to: Routes.topic_path(conn, :index))
  end
end
