defmodule ExMon do
  alias ExMon.{Game, Player}

  def create_player(name, mov_avg, mov_rnd, mov_heal) do
    Player.build(name, mov_avg, mov_rnd, mov_heal)
  end

  def start_game(player) do
    Player.build("Robotik", :punch, :kick, :heal)
    |> Game.start(player)
  end
end
