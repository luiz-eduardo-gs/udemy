defmodule Discuss.Topic.Repository.TopicRepository do
  alias Discuss.{Repo, Topic}

  def create_topic(attrs \\ %{}) do
    changeset = Topic.changeset(%Topic{}, attrs)

    case Repo.insert(changeset) do
      {:ok, topic} -> {:ok, topic}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, {:error_creating_topic, changeset}}
    end
  end
end
