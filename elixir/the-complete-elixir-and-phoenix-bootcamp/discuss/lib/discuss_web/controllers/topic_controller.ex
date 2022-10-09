defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.{Repo, Topic}

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic} = _params) do
    changeset = Topic.changeset(%Topic{}, topic)
    with {:ok, topic} <- Repo.insert(changeset) do
      handle_create(conn, {:ok, topic})
    else
      {:error, changeset} -> handle_create(conn, {:error, changeset})
    end
  end

  defp handle_create(conn, {:ok, _topic}) do
    conn
    |> put_flash(:info, "New topic created successfully")
    |> redirect(to: Routes.topic_path(conn, :index))
  end

  defp handle_create(conn, {:error, _changeset}) do
    conn
    |> put_flash(:error, "Error creating new topic")
    |> redirect(to: Routes.topic_path(conn, :index))
  end
end
