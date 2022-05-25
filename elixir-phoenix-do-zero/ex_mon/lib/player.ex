defmodule ExMon.Player do
  @required_keys [:life, :mov_avg, :mov_heal, :mov_rnd, :name]
  @max_life 100

  @enforce_keys @required_keys
  defstruct @required_keys

  def build(name, mov_avg, mov_rnd, mov_heal) do
    %ExMon.Player{
      life: @max_life,
      mov_avg: mov_avg,
      mov_heal: mov_heal,
      mov_rnd: mov_rnd,
      name: name
    }
  end
end
