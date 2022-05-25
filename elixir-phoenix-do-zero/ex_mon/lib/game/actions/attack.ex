defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game

  @mov_avg_power 18..25
  @mov_rnd_power 10..25

  def attack_opponent(opponent, move) do
    damage = calculate_power(move)

    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponent_life(opponent)
  end

  defp calculate_power(:mov_avg), do: Enum.random(@mov_avg_power)
  defp calculate_power(:mov_rnd), do: Enum.random(@mov_rnd_power)

  defp calculate_total_life(life, damage) when life - damage < 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage

  defp update_opponent_life(life, opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(opponent)
  end

  defp update_game(player_struct, opponent) do
    Game.info()
    |> Map.put(opponent, player_struct)
    |> Game.update()
  end
end
