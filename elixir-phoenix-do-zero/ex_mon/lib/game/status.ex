defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message(%{status: :started} = info) do
    IO.puts("\n===== The game is started! =====\n")
    IO.inspect(info)
    IO.puts("------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n===== It's #{player}'s turn. =====\n")
    IO.inspect(info)
    IO.puts("------------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n===== the game is over. =====\n")
    IO.inspect(info)
    IO.puts("------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n===== Movement #{move} is invalid =====\n")
    IO.puts("------------------------------")
  end

  def print_move_message(:computer, :attack, damage),
    do: IO.puts("\n===== The Player attacked the computer dealing #{damage} damage. =====\n")

  def print_move_message(:player, :attack, damage),
    do: IO.puts("\n===== The Computer attacked the player dealing #{damage} damage. =====\n")
end
