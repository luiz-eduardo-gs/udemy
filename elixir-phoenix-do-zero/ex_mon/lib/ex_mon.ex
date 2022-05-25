defmodule ExMon do
  alias ExMon.Player
  alias ExMon.Game

  def create_player(name, mov_avg, mov_rnd, mov_heal) do
    Player.build(name, mov_avg, mov_rnd, mov_heal)
  end

  def start_game(player) do
    computer = Player.build("Robotik", :punch, :kick, :heal)
    Game.start(computer, player)
  end
end
