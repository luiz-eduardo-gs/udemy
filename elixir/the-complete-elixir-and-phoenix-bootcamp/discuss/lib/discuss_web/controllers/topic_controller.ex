defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.{Repo, Topic}
  alias Discuss.Topic.Repository.TopicRepository

  action_fallback DiscussWeb.FallbackController

  def index(conn, _params) do
    topics = TopicRepository.list_all()
    render(conn, "index.html", topics: topics)
  end

  def edit(conn, %{"id" => id}) do
    topic = Repo.get(Topic, id)
    changeset = Topic.changeset(%Topic{}, %{"id" => topic.id, "title" => topic.title})
    render(conn, "edit.html", changeset: changeset)
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

  def update(conn, %{"id" => _id, "topic" => topic}) do
    with {:ok, _topic} <- TopicRepository.update_topic(topic) do
      conn
      |> put_flash(:info, "New topic updated successfully!")
      |> redirect(to: Routes.topic_path(conn, :index))
    end
  end
end
