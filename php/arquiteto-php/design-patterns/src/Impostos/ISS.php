<?php

namespace LuizEduardo\DesignPattern\Impostos;

use LuizEduardo\DesignPattern\Orcamento;

class ISS implements Imposto
{
    public function calculaImposto(Orcamento $orcamento): float
    {
        return $orcamento->valor * 0.06;
    }
}