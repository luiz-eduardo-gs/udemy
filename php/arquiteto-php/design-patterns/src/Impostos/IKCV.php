<?php

namespace LuizEduardo\DesignPattern\Impostos;

use LuizEduardo\DesignPattern\Orcamento;

class IKCV extends ImpostoDuasAliquotas implements Imposto
{

    protected function deveAplicarTaxaMaxima(Orcamento $orcamento): bool
    {
        return $orcamento->valor > 300 && $orcamento->quantidadeItems > 3;
    }

    protected function calculaTaxaMaxima(Orcamento $orcamento): float
    {
        return $orcamento->valor * 0.04;
    }

    protected function calculaTaxaMinima(Orcamento $orcamento): float
    {
        return $orcamento->valor * 0.025;
    }
}