defmodule ExMon.Trainer.Pokemon.Create do
  alias ExMon.PokeApi.Client
  alias ExMon.Pokemon, as: Parser
  alias ExMon.Trainer.Pokemon
  alias ExMon.Trainer
  alias ExMon.Repo

  def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    body
    |> Parser.build()
    |> create_pokemon(params)
  end

  defp handle_response({:error, _msg} = error, _params), do: error

  defp create_pokemon(%Parser{name: name, weight: weight, types: types}, %{
         "nickname" => nickname,
         "trainer_id" => trainer_id
       }) do
    params = %{
      name: name,
      weight: weight,
      types: types,
      nickname: nickname,
      trainer_id: trainer_id
    }

    params
    |> trainer_exists?()
  end

  defp trainer_exists?(%{trainer_id: trainer_id} = params) do
    Repo.get(Trainer, trainer_id)
    |> handle_get_trainer(params)
  end

  defp handle_get_trainer(%Trainer{} = _trainer, params) do
    params
    |> Pokemon.build()
    |> handle_build()
  end

  defp handle_get_trainer(nil, _params), do: {:error, "Trainer doesn't exist"}

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
