<?php

namespace LuizEduardo\DesignPattern\Impostos;

use LuizEduardo\DesignPattern\Orcamento;

interface Imposto
{
    public function calculaImposto(Orcamento $orcamento): float;
}