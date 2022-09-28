<?php

namespace LuizEduardo\DesignPattern\Impostos;

use LuizEduardo\DesignPattern\Orcamento;

abstract class ImpostoDuasAliquotas implements Imposto
{

    public function calculaImposto(Orcamento $orcamento): float
    {
        if ($this->deveAplicarTaxaMaxima($orcamento)) {
            return $this->calculaTaxaMaxima($orcamento);
        }

        return $this->calculaTaxaMinima($orcamento);
    }

    abstract protected function deveAplicarTaxaMaxima(Orcamento $orcamento): bool;

    abstract protected function calculaTaxaMinima(Orcamento $orcamento): float;

    abstract protected function calculaTaxaMaxima(Orcamento $orcamento): float;
}