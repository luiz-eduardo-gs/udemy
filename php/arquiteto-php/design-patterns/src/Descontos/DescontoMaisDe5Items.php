<?php

namespace LuizEduardo\DesignPattern\Descontos;

use LuizEduardo\DesignPattern\Orcamento;

class DescontoMaisDe5Items extends Desconto
{

    public function calculaDesconto(Orcamento $orcamento): float
    {
        if ($orcamento->quantidadeItems > 5) {
            return $orcamento->valor * 0.01;
        }

        return $this->proximoDesconto->calculaDesconto($orcamento);
    }
}