defmodule Discuss.Topic.Repository.TopicRepository do
  alias Discuss.Repo

  def insert(changeset) do
    case Repo.insert(changeset) do
      {:ok, topic} -> {:ok, topic}
      {:error, %Ecto.Changeset{} = _changeset} -> {:error, :error_saving_topic}
    end
  end
end
