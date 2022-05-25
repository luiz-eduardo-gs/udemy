defmodule ExMon do
  alias ExMon.Player

  def create_player(name, mov_avg, mov_rnd, mov_heal) do
    Player.build(name, mov_avg, mov_rnd, mov_heal)
  end
end
