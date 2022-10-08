defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  def new(conn, _params) do
    text(conn, "Form to create a new topic")
  end
end
