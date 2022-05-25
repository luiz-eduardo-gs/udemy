defmodule ExMonTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "returns a player" do
      assert ExMon.create_player("Luiz", :chute, :soco, :cura) == %Player{
               life: 100,
               moves: %{mov_avg: :chute, mov_heal: :cura, mov_rnd: :soco},
               name: "Luiz"
             }
    end
  end

  describe "start_game/1" do
    test "starts the game" do
      messages =
        capture_io(fn ->
          assert ExMon.create_player("Luiz", :chute, :soco, :cura)
                 |> ExMon.start_game() == :ok
        end)

      assert messages =~ "The game is started!"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup %{} do
      player = ExMon.create_player("Luiz", :chute, :soco, :cura)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:chute)
        end)

      assert messages =~ "The Player attacked the computer"
      assert messages =~ "It's computer's turn"
      assert messages =~ "status: :continue"
      assert messages =~ "turn: :player"
    end

    test "when the move is invalid, returns an error message" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:chutar)
        end)

      assert messages =~ "Movement chutar is invalid"
    end
  end
end
