<?php

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *    @author Municipio de Itajaí - Secretaria de Educação - DITEC         *
 *    @updated 30/06/2016                                                  *
 *    Pacote: Erudio                                                       *
 *                                                                         *
 *    Copyright (C) 2016 Prefeitura de Itajaí - Secretaria de Educação     *
 *                       DITEC - Diretoria de Tecnologias educacionais     *
 *                        ditec@itajai.sc.gov.br                           *
 *                                                                         *
 *    Este  programa  é  software livre, você pode redistribuí-lo e/ou     *
 *    modificá-lo sob os termos da Licença Pública Geral GNU, conforme     *
 *    publicada pela Free  Software  Foundation,  tanto  a versão 2 da     *
 *    Licença   como  (a  seu  critério)  qualquer  versão  mais  nova.    *
 *                                                                         *
 *    Este programa  é distribuído na expectativa de ser útil, mas SEM     *
 *    QUALQUER GARANTIA. Sem mesmo a garantia implícita de COMERCIALI-     *
 *    ZAÇÃO  ou  de ADEQUAÇÃO A QUALQUER PROPÓSITO EM PARTICULAR. Con-     *
 *    sulte  a  Licença  Pública  Geral  GNU para obter mais detalhes.     *
 *                                                                         *
 *    Você  deve  ter  recebido uma cópia da Licença Pública Geral GNU     *
 *    junto  com  este  programa. Se não, escreva para a Free Software     *
 *    Foundation,  Inc.,  59  Temple  Place,  Suite  330,  Boston,  MA     *
 *    02111-1307, USA.                                                     *
 *                                                                         *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

namespace CursoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation as JMS;
use CoreBundle\ORM\AbstractEditableEntity;

/**
* @ORM\Entity
* @ORM\Table(name = "edu_disciplina")
*/
class Disciplina extends AbstractEditableEntity {
    
    /** 
    * @JMS\Groups({"LIST"})
    * @ORM\Column(nullable = false) 
    */
    private $nome;
    
    /** 
    * @JMS\Groups({"LIST"})
    * @ORM\Column(name = "nome_exibicao", nullable = false) 
    */
    private $nomeExibicao;
    
    /** 
    * @JMS\Groups({"LIST"})
    * @ORM\Column(nullable = true) 
    */
    private $sigla;
    
    /** 
    * @JMS\Groups({"LIST"})
    * @ORM\Column(name = "carga_horaria", type = "integer", nullable = false) 
    */
    private $cargaHoraria;
    
    /**
    * @JMS\Groups({"LIST"})
    * @ORM\Column(type = "boolean", nullable = false) 
    */
    private $opcional = false;
    
    /**
    * @JMS\Groups({"LIST"})
    * @ORM\Column(type = "boolean", nullable = false)
    */
    private $ofertado = true;
    
    /**
    * @JMS\Groups({"DETAILS"})
    * @JMS\MaxDepth(depth = 1)
    * @ORM\ManyToOne(targetEntity = "Etapa", inversedBy = "disciplinas") 
    */
    private $etapa;
    
    /**
    * @JMS\Groups({"DETAILS"}) 
    * @JMS\MaxDepth(depth = 1)
    * @ORM\ManyToOne(targetEntity = "Curso", inversedBy = "disciplinas") 
    */
    private $curso;
    
    /**
    * @JMS\Groups({"DETAILS"})
    * @ORM\ManyToOne(targetEntity = "AgrupamentoDisciplina")
    * @ORM\JoinColumn(name = "disciplina_agrupamento_id") 
    */
    private $agrupamento;
    
    function getNome() {
        return $this->nome;
    }

    function getNomeExibicao() {
        return $this->nomeExibicao;
    }
    
    function getSigla() {
        return $this->sigla;
    }

    function getCargaHoraria() {
        return $this->cargaHoraria;
    }

    function getOpcional() {
        return $this->opcional;
    }

    function getEtapa() {
        return $this->etapa;
    }

    function getCurso() {
        return $this->curso;
    }
    
    function getOfertado() {
        return $this->ofertado;
    }
    
    function getAgrupamento() {
        return $this->agrupamento;
    }

    function setNome($nome) {
        $this->nome = $nome;
    }
    
    function setCargaHoraria($cargaHoraria) {
        $this->cargaHoraria = $cargaHoraria;
    }

    function setOpcional($opcional) {
        $this->opcional = $opcional;
    }

    function setNomeExibicao($nomeExibicao) {
        $this->nomeExibicao = $nomeExibicao;
    }

    function setEtapa(Etapa $etapa) {
        $this->etapa = $etapa;
    }
    
    function setOfertado($ofertado) {
        $this->ofertado = $ofertado;
    }
    
    function setAgrupamento($agrupamento) {
        $this->agrupamento = $agrupamento;
    }
    
}
