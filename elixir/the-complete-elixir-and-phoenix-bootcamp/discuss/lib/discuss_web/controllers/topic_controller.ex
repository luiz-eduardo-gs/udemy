defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Topic
  alias Discuss.Topic.Repository.TopicRepository

  action_fallback DiscussWeb.FallbackController

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic} = _params) do
    with {:ok, _topic} <- TopicRepository.create_topic(topic) do
      conn
      |> put_flash(:info, "New topic created successfully!")
      |> redirect(to: Routes.topic_path(conn, :index))
    end
  end
end
