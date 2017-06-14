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

namespace CursoBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\ConstraintViolationListInterface;
use Doctrine\ORM\QueryBuilder;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use FOS\RestBundle\Controller\Annotations as FOS;
use FOS\RestBundle\Request\ParamFetcher;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use CoreBundle\REST\AbstractEntityResource;
use CursoBundle\Entity\Etapa;

/**
 * @FOS\RouteResource("etapas")
 */
class EtapaController extends AbstractEntityResource {
    
    function getEntityClass() {
        return 'CursoBundle:Etapa';
    }
    
    function queryAlias() {
        return 'e';
    }
    
    function parameterMap() {
        return array (
            'nome' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('e.nome LIKE :nome')->setParameter('nome', '%' . $value . '%');
            },
            'curso' => function(QueryBuilder $qb, $value) {
                $qb->join('e.curso', 'curso')
                   ->andWhere('curso.id = :curso')->setParameter('curso', $value);
            }
        );
    }
    
    /**
    * @ApiDoc()
    */
    function getAction(Request $request, $id) {
        return $this->getOne($id);
    }
    
    /**
        *   @ApiDoc()
        * 
        *   @FOS\QueryParam(name = "page", requirements="\d+", default = null) 
        *   @FOS\QueryParam(name = "nome", nullable = true) 
        *   @FOS\QueryParam(name = "curso", requirements="\d+", nullable = true) 
        */
    function cgetAction(Request $request, ParamFetcher $paramFetcher) {
        return $this->getList($paramFetcher);
    }
    
    /**
        *  @ApiDoc()
        * 
        *  @FOS\Post("etapas")
        *  @ParamConverter("etapa", converter="fos_rest.request_body")
        */
    function postAction(Request $request, Etapa $etapa, ConstraintViolationListInterface $errors) {
        if(count($errors) > 0) {
            return $this->handleValidationErrors($errors);
        }
        return $this->create($etapa);
    }
    
    /**
        *  @ApiDoc()
        * 
        *  @FOS\Put("etapas/{id}")
        *  @ParamConverter("etapa", converter="fos_rest.request_body")
        */
    function putAction(Request $request, $id, Etapa $etapa, ConstraintViolationListInterface $errors) {
        if(count($errors) > 0) {
            return $this->handleValidationErrors($errors);
        }
        return $this->update($id, $etapa);
    }
    
    /**
        *   @ApiDoc()
        */
    function deleteAction(Request $request, $id) {
        return $this->remove($id);
    }
    
    protected function beforeExecuteQuery(QueryBuilder $qb, array $params) {
        $qb->orderBy('e.ordem', 'ASC');
    }

}
