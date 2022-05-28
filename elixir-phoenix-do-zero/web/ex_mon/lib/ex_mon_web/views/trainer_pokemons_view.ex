defmodule ExMonWeb.TrainerPokemonsView do
  use ExMonWeb, :view
  alias ExMon.Trainer
  alias Trainer.Pokemon

  def render("create.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          weight: weight,
          trainer_id: trainer_id,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Pokemon created!",
      pokemon: %{
        id: id,
        trainer_id: trainer_id,
        name: name,
        nickname: nickname,
        types: types,
        weight: weight,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          weight: weight,
          trainer: %Trainer{id: trainer_id, name: trainer_name}
        }
      }) do
    %{
      id: id,
      name: name,
      nickname: nickname,
      types: types,
      weight: weight,
      trainer: %{
        id: trainer_id,
        name: trainer_name
      }
    }
  end

  def render("update.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          weight: weight,
          trainer_id: trainer_id,
          updated_at: updated_at
        }
      }) do
    %{
      message: "Pokemon updated!",
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        weight: weight,
        trainer_id: trainer_id,
        updated_at: updated_at
      }
    }
  end
end
