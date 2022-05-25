defmodule ExMon.Player do
  @enforce_keys [:name, :life, :mov_avg, :mov_rnd, :mov_heal]
  defstruct [:name, :life, :mov_avg, :mov_rnd, :mov_heal]

  def build(name, mov_avg, mov_rnd, mov_heal) do
    %ExMon.Player{
      name: name,
      mov_avg: mov_avg,
      mov_rnd: mov_rnd,
      mov_heal: mov_heal,
      life: 100
    }
  end
end
