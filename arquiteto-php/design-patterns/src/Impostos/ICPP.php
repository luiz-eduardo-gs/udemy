<?php

namespace LuizEduardo\DesignPattern\Impostos;

use LuizEduardo\DesignPattern\Orcamento;

class ICPP extends ImpostoDuasAliquotas implements Imposto
{

    protected function deveAplicarTaxaMaxima(Orcamento $orcamento): bool
    {
        return $orcamento->valor > 500;
    }

    protected function calculaTaxaMaxima(Orcamento $orcamento): float
    {
        return $orcamento->valor * 0.03;
    }

    protected function calculaTaxaMinima(Orcamento $orcamento): float
    {
        return $orcamento->valor * 0.02;
    }
}