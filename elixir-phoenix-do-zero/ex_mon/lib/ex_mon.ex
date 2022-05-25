defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_name "Robotinik"
  @computer_moves [:mov_avg, :mov_rnd, :mov_heal]

  def create_player(name, mov_avg, mov_rnd, mov_heal) do
    Player.build(name, mov_avg, mov_rnd, mov_heal)
  end

  def start_game(player) do
    Player.build(@computer_name, :punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()

    computer_move(Game.info())
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do
    case move do
      :mov_heal -> Actions.heal()
      move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end

  defp computer_move(%{turn: :computer, status: :continue}) do
    {:ok, Enum.random(@computer_moves)}
    |> do_move()
  end

  defp computer_move(_), do: :ok
end
