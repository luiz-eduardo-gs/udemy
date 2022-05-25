defmodule ExMon.GameTest do
  use ExUnit.Case
  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      computer = Player.build("Robotinik", :punch, :kick, :heal)
      player = Player.build("Luiz", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "return the current game state" do
      player = Player.build("Luiz", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :punch, :kick, :heal)
      Game.start(computer, player)

      assert %{
               computer: %ExMon.Player{
                 life: 100,
                 moves: %{mov_avg: :punch, mov_heal: :heal, mov_rnd: :kick},
                 name: "Robotinik"
               },
               player: %ExMon.Player{
                 life: 100,
                 moves: %{mov_avg: :chute, mov_heal: :cura, mov_rnd: :soco},
                 name: "Luiz"
               },
               status: :started,
               turn: :player
             } == Game.info()
    end
  end

  describe "update/1" do
    test "update the game state" do
      player = Player.build("Luiz", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :punch, :kick, :heal)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{mov_avg: :punch, mov_heal: :heal, mov_rnd: :kick},
          name: "Robotinik"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{mov_avg: :chute, mov_heal: :cura, mov_rnd: :soco},
          name: "Luiz"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        computer: %ExMon.Player{
          life: 50,
          moves: %{mov_avg: :punch, mov_heal: :heal, mov_rnd: :kick},
          name: "Robotinik"
        },
        player: %ExMon.Player{
          life: 10,
          moves: %{mov_avg: :chute, mov_heal: :cura, mov_rnd: :soco},
          name: "Luiz Eduardo"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert Game.info() == expected_response
    end
  end
end
