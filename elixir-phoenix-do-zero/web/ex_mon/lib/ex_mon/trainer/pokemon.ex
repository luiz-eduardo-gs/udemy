defmodule ExMon.Trainer.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  alias ExMon.Trainer

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "pokemons" do
    field :name, :string
    field :nickname, :string
    field :weight, :integer
    field :types, {:array, :string}
    belongs_to(:trainer, Trainer)
    timestamps()
  end

  @required [:name, :nickname, :weight, :types, :trainer_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  defp create_changeset(module_or_pokemon, params) do
    module_or_pokemon
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:nickname, min: 2)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(pokemon, params), do: create_changeset(pokemon, params)
end
