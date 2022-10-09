defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.{Repo, Topic}

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic} = _params) do
    changeset = Topic.changeset(%Topic{}, topic)
    Repo.insert(changeset)
    text(conn, "Created")
  end
end
