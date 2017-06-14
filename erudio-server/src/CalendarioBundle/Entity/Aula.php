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

namespace CalendarioBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation as JMS;
use CoreBundle\ORM\AbstractEditableEntity;

/**
* @ORM\Entity
* @ORM\Table(name = "edu_aula")
*/
class Aula extends AbstractEditableEntity {
    
    /** 
    * @JMS\Groups({"LIST"})
    * @JMS\MaxDepth(depth = 1)
    * @ORM\ManyToOne(targetEntity = "CursoBundle\Entity\DisciplinaOfertada")
    * @ORM\JoinColumn(name = "turma_disciplina_id")
    */
    private $disciplinaOfertada;
    
    /** 
    * @JMS\Groups({"LIST"})
    * @JMS\MaxDepth(depth = 1)
    * @ORM\ManyToOne(targetEntity = "Dia")
    */
    private $dia;
    
    /** 
    * @JMS\Groups({"LIST"})
    * @JMS\MaxDepth(depth = 1)
    * @ORM\ManyToOne(targetEntity = "Horario")
    * @ORM\JoinColumn(name = "quadro_horario_aula_id")
    */
    private $horario;
    
    function __construct($disciplinaOfertada, $dia, $horario) {
        $this->disciplinaOfertada = $disciplinaOfertada;
        $this->dia = $dia;
        $this->horario = $horario;
    }

    function getDisciplinaOfertada() {
        return $this->disciplinaOfertada;
    }

    function getDia() {
        return $this->dia;
    }

    function getHorario() {
        return $this->horario;
    }
    
}
