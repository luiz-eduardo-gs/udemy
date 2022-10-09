defmodule Discuss.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss.Topic.Repository.TopicRepository

  schema "topics" do
    field :title, :string
  end

  @doc false
  def changeset(topic, attrs \\ %{}) do
    topic
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
