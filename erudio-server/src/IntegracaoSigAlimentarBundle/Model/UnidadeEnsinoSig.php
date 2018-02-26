<?php

namespace IntegracaoSigAlimentarBundle\Model;

use PessoaBundle\Entity\UnidadeEnsino;

class UnidadeEnsinoSig {

    public $nome;
    public $cod_escola;
    public $inep;
    public $sigla;
    public $bairro;
    public $logradouro;
    public $numero;
    public $tipoUnidade;
    
    function __construct($nome, $cod_escola, $inep, $sigla, $bairro, $logradouro, $numero, $tipoUnidade) {
        $this->nome = $nome;
        $this->cod_escola = $cod_escola;
        $this->inep = $inep;
        $this->sigla = $sigla;
        $this->bairro = $bairro;
        $this->logradouro = $logradouro;
        $this->numero = $numero;
        $this->tipoUnidade = $tipoUnidade;
    }
    
    static function fromUnidadeEnsino(UnidadeEnsino $unidade) {
        return new UnidadeEnsinoSig(
            $unidade->getNomeCompleto(),
            $unidade->getId(),
            $unidade->getCodigoInep() ? $unidade->getCodigoInep() : '',
            '',
            $unidade->getEndereco()->getBairro() ? $unidade->getEndereco()->getBairro() : '',
            $unidade->getEndereco()->getLogradouro() ? $unidade->getEndereco()->getLogradouro() : '',
            $unidade->getEndereco()->getNumero() ? $unidade->getEndereco()->getNumero() : 0,
            $unidade->getTipo()->getNome()
        );
    }
    
}
