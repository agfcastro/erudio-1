<?php

namespace SME\DGPBundle\Entity;

use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity(readOnly=true)
 * @ORM\Table(name="sme_dgp_vinculo_cargo")
 */
class Cargo {
    
    /**
    * @ORM\Id
    * @ORM\Column(type="integer")
    * @ORM\GeneratedValue(strategy="AUTO")
    */
    private $id;
    
    /** @ORM\Column(nullable=false, unique=true) */
    private $nome;
    
    /** @ORM\Column(name="nome_oficial", nullable=false) */
    private $nomeOficial;
    
    public function getId() {
        return $this->id;
    }

    public function getNome() {
        return $this->nome;
    }

    public function setNome($nome) {
        $this->nome = $nome;
    }

    public function getNomeOficial() {
        return $this->nomeOficial;
    }

    public function setNomeOficial($nomeOficial) {
        $this->nomeOficial = $nomeOficial;
    }
    
}
