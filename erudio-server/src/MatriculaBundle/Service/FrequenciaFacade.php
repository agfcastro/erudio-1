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

namespace MatriculaBundle\Service;

use Doctrine\ORM\QueryBuilder;
use CoreBundle\ORM\AbstractFacade;
use CoreBundle\ORM\Exception\IllegalOperationException;

class FrequenciaFacade extends AbstractFacade {
    
    function getEntityClass() {
        return 'MatriculaBundle:Frequencia';
    }
    
    function queryAlias() {
        return 'f';
    }
    
    function parameterMap() {
        return array (
            'disciplina' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('disciplina.id = :disciplina')->setParameter('disciplina', $value);
            },
            'matricula' => function(QueryBuilder $qb, $value) {
                $qb->join('disciplina.matricula', 'matricula')
                   ->andWhere('matricula.id = :matricula')->setParameter('matricula', $value);
            },
            'aula' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('aula.id = :aula')->setParameter('aula', $value);
            },
            'mes' => function(QueryBuilder $qb, $value) {
                $qb->join('aula.dia', 'dia')
                   ->andWhere('dia.data LIKE :mes')->setParameter('mes', '%-' . $value . '-%');
            },
            'turma' => function(QueryBuilder $qb, $value) {
                $qb->join('aula.disciplinaOfertada', 'ofertada')->join('ofertada.turma', 'turma')
                   ->andWhere('turma.id = :turma')->setParameter('turma', $value)->setMaxResults(1)->orderBy('f.id','DESC');
            }
        );
    }
    
    protected function prepareQuery(QueryBuilder $qb, array $params) {
        $qb->join('f.aula', 'aula')->join('f.disciplinaCursada', 'disciplina');
    }
    
/*    protected function beforeCreate($frequencia) {
        $dataAtual = new \DateTime();
        if ($frequencia->getAula()->getDia()->getData() > $dataAtual) {
            throw new IllegalOperationException ('Data Inválida');
        }
    } */
}


