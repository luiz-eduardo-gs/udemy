<?php

namespace LuizEduardo\DesignPattern;

use LuizEduardo\DesignPattern\Descontos\Desconto;
use LuizEduardo\DesignPattern\Descontos\DescontoMaisDe500Reais;
use LuizEduardo\DesignPattern\Descontos\DescontoMaisDe5Items;
use LuizEduardo\DesignPattern\Descontos\SemDesconto;

class CalculadoraDeDescontos
{
    public function calculaDescontos(Orcamento $orcamento): float
    {
        // Nessa regra de negocio, a ordem dos descontos importa e deve seguir essa ordem
        $cadeiaDescontos = new DescontoMaisDe5Items(
            new DescontoMaisDe500Reais(
                new SemDesconto()
            )
        );

        return $cadeiaDescontos->calculaDesconto($orcamento);
    }
}