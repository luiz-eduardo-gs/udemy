defmodule Discuss.Topic.Repository.TopicRepository do
  alias Discuss.{Repo, Topic}

  def list_all() do
    Repo.all(Topic)
  end

  def create_topic(attrs \\ %{}) do
    changeset = Topic.changeset(%Topic{}, attrs)

    case Repo.insert(changeset) do
      {:ok, topic} -> {:ok, topic}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, {:error_creating_topic, changeset}}
    end
  end

  def update_topic(attrs \\ %{}) do
    changeset = Topic.changeset(%Topic{}, attrs)

    case Repo.update(changeset) do
      {:ok, topic} -> {:ok, topic}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, {:error_updating_topic, changeset}}
    end
  end
end
