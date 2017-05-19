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

namespace MatriculaBundle\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;
use JMS\Serializer\Annotation as JMS;
use CoreBundle\ORM\AbstractEditableEntity;
use CursoBundle\Entity\Disciplina;
use CursoBundle\Entity\DisciplinaOfertada;

/**
* @ORM\Entity
* @ORM\Table(name = "edu_matricula_disciplina")
*/
class DisciplinaCursada extends AbstractEditableEntity {
    
    const STATUS_CURSANDO = "CURSANDO",
          STATUS_APROVADO = "APROVADO",
          STATUS_REPROVADO = "REPROVADO",
          STATUS_DISPENSADO = "DISPENSADO",
          STATUS_INCOMPLETO = 'INCOMPLETO';
    
    /**
    * @JMS\Groups({"LIST"})  
    * @ORM\Column(type = "string", nullable = false) 
    */
    private $status;
    
    /** 
    * @JMS\Groups({"LIST"}) 
    * @JMS\MaxDepth(depth = 2)
    * @ORM\ManyToOne(targetEntity = "Matricula") 
    */
    private $matricula;
    
    /** 
    * @JMS\Groups({"LIST"})   
    * @ORM\ManyToOne(targetEntity = "CursoBundle\Entity\Disciplina") 
    */
    private $disciplina;
    
    /**
    * @JMS\Groups({"LIST"})  
    * @ORM\Column(name = "media_final")
    */
    private $mediaFinal;
    
    /**
    * @JMS\Groups({"LIST"})  
    * @ORM\Column(name = "frequencia_total")
    */
    private $frequenciaTotal;
    
    /**
    * @JMS\Type("DateTime<'Y-m-d\TH:i:s'>")
    * @ORM\Column(name="data_encerramento", type="datetime", nullable=false) 
    */
    protected $dataEncerramento;
    
    /** @ORM\ManyToOne(targetEntity = "Enturmacao", inversedBy="disciplinasCursadas") */
    private $enturmacao;
    
    /** 
    * @JMS\Groups({"LIST"})
    * @JMS\MaxDepth(depth = 3) 
    * @ORM\ManyToOne(targetEntity = "CursoBundle\Entity\DisciplinaOfertada")
    * @ORM\JoinColumn(name = "turma_disciplina_id")  
    */
    private $disciplinaOfertada;
    
    /**  
    * @JMS\Exclude
    * @ORM\OneToMany(targetEntity = "Media", mappedBy = "disciplinaCursada", fetch = "EXTRA_LAZY")
    */
    private $medias;
    
    function __construct(Matricula $matricula, Disciplina $disciplina) {
        $this->matricula = $matricula;
        $this->disciplina = $disciplina;
        $this->init();
    }
    
    function init() {
        $this->medias = new ArrayCollection();
        if (is_null($this->status)) {
            $this->status = self::STATUS_CURSANDO;
        }
    }
    
    /**
     * @JMS\Groups({"LIST"})
     * @JMS\VirtualProperty
     */
    function getNome() {
        return $this->disciplina->getNome();
    }
    
    /**
     * @JMS\Groups({"LIST"})
     * @JMS\VirtualProperty
     */
    function getNomeExibicao() {
        return $this->disciplina->getNomeExibicao();
    }
    
     /**
     * @JMS\Groups({"LIST"})
     * @JMS\VirtualProperty
     */
    function getSigla() {
        return $this->disciplina->getSigla();
    }
    
    /**
     * @JMS\VirtualProperty
     */
    function getAno() {
        return $this->dataEncerramento ? $this->dataEncerramento->format('Y') : date('Y');
    }
    
    function vincularEnturmacao(Enturmacao $enturmacao, DisciplinaOfertada $disciplinaOfertada) {
        if ($enturmacao->getTurma()->getId() != $disciplinaOfertada->getTurma()->getId()) {
            throw new \InvalidArgumentException('A enturmação e a disciplina ofertada devem ser da mesma turma');
        }
        $this->enturmacao = $enturmacao;
        $this->disciplinaOfertada = $disciplinaOfertada;
    }
    
    function desvincularEnturmacao() {
        $this->enturmacao = null;
        $this->disciplinaOfertada = null;
    }
    
    function encerrar($status) {
        if ($this->status == self::STATUS_CURSANDO && $status != self::STATUS_CURSANDO) {
            $this->status = $status;
            $this->dataEncerramento = new \DateTime();
        }
    }
    
    function getMedias() {
        return $this->medias;
    }
    
    function getMatricula() {
        return $this->matricula;
    }

    function getDisciplina() {
        return $this->disciplina;
    }
    
    function getEnturmacao() {
        return $this->enturmacao;
    }
    
    function getDisciplinaOfertada() {
        return $this->disciplinaOfertada;
    }
 
    function getStatus() {
        return $this->status;
    }
    
    function getMediaFinal() {
        return $this->mediaFinal;
    }

    function getFrequenciaTotal() {
        return $this->frequenciaTotal;
    }
    
    function getDataEncerramento() {
        return $this->dataEncerramento;
    }
    
    function setMediaFinal($mediaFinal) {
        $this->mediaFinal = $mediaFinal;
    }

    function setFrequenciaTotal($frequenciaTotal) {
        $this->frequenciaTotal = $frequenciaTotal;
    }
    
}
