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

namespace VagaBundle\Entity;

use Doctrine\ORM\Mapping AS ORM;
use JMS\Serializer\Annotation as JMS;
use CoreBundle\ORM\AbstractEditableEntity;
use CursoBundle\Entity\Turma;
use MatriculaBundle\Entity\Enturmacao;

/**
* @ORM\Entity
* @ORM\Table(name = "edu_vaga")
*/
class Vaga extends AbstractEditableEntity {
        
    /**        
    * @JMS\Groups({"LIST"})
    * @ORM\ManyToOne(targetEntity = "CursoBundle\Entity\Turma", inversedBy = "vagas")
    */
    private $turma;
    
    /** 
    * @JMS\Groups({"LIST"})
    * @ORM\OneToOne(targetEntity = "MatriculaBundle\Entity\Enturmacao", inversedBy="vaga") 
    */
    private $enturmacao;
    
    function __construct(Turma $turma) {
        $this->turma = $turma;
    }
    
    function liberar() {
        $this->enturmacao = null;
    }
        
    function ocupar(Enturmacao $enturmacao) {
        $this->enturmacao = $enturmacao;
    }
    
    function getTurma() {
        return $this->turma;
    }

    function getEnturmacao() {
        return $this->enturmacao;
    }
    
}
