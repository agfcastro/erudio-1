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

namespace VinculoBundle\Service;

use Doctrine\ORM\QueryBuilder;
use CoreBundle\ORM\AbstractFacade;
use AuthBundle\Entity\Usuario;

class VinculoFacade extends AbstractFacade {
    
    function getEntityClass() {
        return 'VinculoBundle:Vinculo';
    }
    
    function queryAlias() {
        return 'v';
    }
    
    function parameterMap() {
        return array (
            'cargo' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('cargo.id = :cargo')->setParameter('cargo', $value);
            },
            'funcionario' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('funcionario.id = :funcionario')->setParameter('funcionario', $value);
            },
            'funcionario_nome' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('funcionario.nome LIKE :nome')->setParameter('nome', '%' . $value . '%');
            },
            'funcionario_cpf' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('funcionario.cpfCnpj = :cpf')->setParameter('cpf', $value);
            },
            'status' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('v.status = :status')->setParameter('status', $value);
            },
            'codigo' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('v.codigo = :codigo')->setParameter('codigo', $value);
            },
            'professor' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('cargo.professor = :professor')->setParameter('professor', $value);
            }
        );
    }
    
    protected function prepareQuery(QueryBuilder $qb, array $params) {
        $qb->join('v.funcionario', 'funcionario')->join('v.cargo', 'cargo');
    }
    
    protected function beforeCreate($vinculo) {
        $now = new \DateTime();
        $ano = $now->format('Y');
        $qb = $this->orm->getManager()->createQueryBuilder()
            ->select('MAX(v.codigo)')
            ->from($this->getEntityClass(), 'v')
            ->where('v.codigo LIKE :codigo')
            ->setParameter('codigo', $ano . $vinculo->getInstituicao()->getId() . '%');
        $numero = $qb->getQuery()->getSingleScalarResult();
        if(!$numero) {
            $numero = $ano . $vinculo->getInstituicao()->getId() . '00000';
        }
        $vinculo->definirCodigo($numero + 1);
    }
    
    protected function afterCreate($vinculo) {
        $pessoa = $vinculo->getFuncionario();
        if (!$pessoa->getUsuario()) {            
            $usuario = new Usuario();
            $usuario->criarUsuarioByVinculo($vinculo);
            $em = $this->orm->getManager();
            $em->persist($usuario);
            $pessoa->setUsuario($usuario);
            $em->merge($pessoa);
            $em->flush();
        }
    }

}
