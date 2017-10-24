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

namespace AulaBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use JMS\Serializer\Annotation as JMS;
use CoreBundle\ORM\AbstractEditableEntity;

/**
* @ORM\Entity
* @ORM\Table(name = "edu_aula_frequencia")
*/
class Frequencia extends AbstractEditableEntity {
    
    const FALTA = 'FALTA';
    const FALTA_JUSTIFICADA = 'FALTA_JUSTIFICADA';
    const PRESENCA = 'PRESENCA';
    const DISPENSA = 'DISPENSA';
    
    /** 
    * @JMS\Groups({"LIST"})  
    * @ORM\Column(type = "string", nullable = false) 
    */
    private $status;
    
    /**  
    * @JMS\Groups({"LIST"}) 
    * @ORM\Column
    */
    private $justificativa;
    
    /**  
    * @JMS\Groups({"LIST"})
    * @ORM\ManyToOne(targetEntity = "Aula") 
    */
    private $aula;
    
    /**
    * @JMS\Groups({"DETAILS"})
    * @JMS\MaxDepth(depth = 2)
    * @ORM\ManyToMany(targetEntity="MatriculaBundle\Entity\DisciplinaCursada")
    * @ORM\JoinTable(name="edu_aula_frequencia_matricula_disciplina",
    *      joinColumns={@ORM\JoinColumn(name="frequencia_id", referencedColumnName="id")},
    *      inverseJoinColumns={@ORM\JoinColumn(name="matricula_disciplina_id", referencedColumnName="id")}
    *   )
    */
    private $disciplinasCursadas;
    
    function __construct($aula, $status = self::PRESENCA, array $disciplinas = []) {
        $this->status = $status;
        $this->aula = $aula;
        $this->disciplinasCursadas = new ArrayCollection($disciplinas);
    }
    
    /**
    * @JMS\Groups({"LIST"})
    * @JMS\VirtualProperty
    * @JMS\MaxDepth(depth = 1)
    * @JMS\Type("ArrayCollection<PessoaBundle\Entity\PessoaFisica>")
    */
    function getAluno() {
        return $this->disciplinasCursadas->first()->getMatricula()->getAluno();
    }
    
    function getDisciplinasCursadas() {
        return $this->disciplinasCursadas;
    }
     
    function getStatus() {
        return $this->status;
    }

    function getJustificativa() {
        return $this->justificativa;
    }

    function getAula() {
        return $this->aula;
    }

    function setStatus($status) {
        $this->status = $status;
    }

    function setJustificativa($justificativa) {
        $this->justificativa = $justificativa;
    }
    
}
