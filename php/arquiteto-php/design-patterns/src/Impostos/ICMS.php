<?php

namespace LuizEduardo\DesignPattern\Impostos;

use LuizEduardo\DesignPattern\Orcamento;

class ICMS implements Imposto
{
    public function calculaImposto(Orcamento $orcamento): float
    {
        return $orcamento->valor * 0.1;
    }
}