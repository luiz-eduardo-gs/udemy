defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_name "Robotinik"
  @computer_moves [:mov_avg, :mov_rnd, :mov_heal]
  @computer_moves_increased_heal_change [
    :mov_avg,
    :mov_rnd,
    :mov_heal,
    :mov_heal,
    :mov_heal,
    :mov_heal
  ]

  def create_player(name, mov_avg, mov_rnd, mov_heal) do
    Player.build(name, mov_avg, mov_rnd, mov_heal)
  end

  def start_game(player) do
    Player.build(@computer_name, :punch, :kick, :heal)
    |> Game.start(player)

    check_computer_move()
  end

  defp check_computer_move do
    Game.info()
    |> Map.get(:turn)
    |> handle_computer_start()
  end

  defp handle_computer_start(:player), do: Status.print_round_message(Game.info())

  defp handle_computer_start(:computer) do
    Status.print_round_message(Game.info())
    computer_move(Game.info())
  end

  def make_move(move) do
    Game.info()
    |> Map.get(:status)
    |> handle_status(move)
  end

  defp handle_status(:game_over, _move), do: Status.print_round_message(Game.info())

  defp handle_status(_other, move) do
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

  defp check_low_life(life) when life < 40,
    do: {:ok, Enum.random(@computer_moves_increased_heal_change)}

  defp check_low_life(_life), do: {:ok, Enum.random(@computer_moves)}

  defp computer_move(%{turn: :computer, status: :started}) do
    {:ok, Enum.random(@computer_moves)}
    |> do_move()
  end

  defp computer_move(%{turn: :computer, status: :continue}) do
    :computer
    |> Game.fetch_player()
    |> Map.get(:life)
    |> check_low_life()
    |> do_move()
  end

  defp computer_move(_), do: :ok
end
