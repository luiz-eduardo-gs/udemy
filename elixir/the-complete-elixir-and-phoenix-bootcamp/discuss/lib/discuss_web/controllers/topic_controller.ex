defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.{Repo, Topic}

  action_fallback DiscussWeb.FallbackController

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic} = _params) do
    changeset = Topic.changeset(%Topic{}, topic)
    with {:ok, _topic} <- Topic.save_topic(changeset) do
      conn
      |> put_flash(:info, "New topic created successfully!")
      |> redirect(to: Routes.topic_path(conn, :index))
    end
  end
end
