defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.Status

  @computer_name "Robotinik"

  def create_player(name, mov_avg, mov_rnd, mov_heal) do
    Player.build(name, mov_avg, mov_rnd, mov_heal)
  end

  def start_game(player) do
    Player.build(@computer_name, :punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end
end
