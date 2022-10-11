defmodule DiscussWeb.FallbackController do
  use DiscussWeb, :controller

  def call(conn, {:error, {:error_creating_topic, changeset}}) do
    conn
    |> put_flash(:error, "Error while trying to create a topic")
    |> render("new.html", changeset: changeset)
  end

  def call(conn, {:error, {:error_updating_topic, changeset, topic}}) do
    conn
    |> put_flash(:error, "Error while trying to update a topic")
    |> render("edit.html", changeset: changeset, topic: topic)
  end
end
