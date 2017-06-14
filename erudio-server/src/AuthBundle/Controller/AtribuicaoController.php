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

namespace AuthBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\ConstraintViolationListInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use FOS\RestBundle\Controller\Annotations as FOS;
use FOS\RestBundle\Request\ParamFetcherInterface;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use CoreBundle\REST\AbstractEntityController;
use AuthBundle\Entity\Atribuicao;
use AuthBundle\Service\AtribuicaoFacade;

/**
 * @FOS\NamePrefix("atribuicoes")
 */
class AtribuicaoController extends AbstractEntityController {
    
    private $atribuicaoFacade;
    
    function __construct(AtribuicaoFacade $atribuicaoFacade) {
        $this->atribuicaoFacade = $atribuicaoFacade;
    }
    
    function getFacade() {
        return $this->atribuicaoFacade;
    }
    
    /**
    * @ApiDoc()
    * 
    * @FOS\Get("atribuicoes/{id}")
    */
    function getAction(Request $request, $id) {
        return $this->getOne($request, $id);
    }
    
    /**
    * @ApiDoc()
    * 
    * @FOS\Get("atribuicoes-removidas/{id}")
    */
    function getDeletedAction(Request $request, $id) {
        return $this->getOneDeleted($request, $id);
    }
    
    /**
    * @ApiDoc(
    *   resource = true,
    *   section = "Módulo Atribuições",
    *   description = "Busca de atribuições",
    *   statusCodes = {
    *       200 = "Retorno dos resultados da busca"
    *   }
    * )
    * 
    * @FOS\Get("atribuicoes")
    * @FOS\QueryParam(name = "page", requirements="\d+", default = null) 
    * @FOS\QueryParam(name = "usuario", nullable = true)
    * @FOS\QueryParam(name = "permissao", nullable = true)
    * @FOS\QueryParam(name = "entidade", nullable = true)
    * @FOS\QueryParam(name = "grupo", nullable = true)
    */
    function getListAction(Request $request, ParamFetcherInterface $paramFetcher) {
        return $this->getList($request, $paramFetcher->all());
    }
    
    /**
    * @ApiDoc(
    *   resource = true,
    *   section = "Módulo Atribuições",
    *   description = "Busca de atribuições removidas",
    *   statusCodes = {
    *       200 = "Retorno dos resultados da busca"
    *   }
    * )
    * 
    * @FOS\Get("atribuicoes-removidas")
    * @FOS\QueryParam(name = "page", requirements="\d+", default = null) 
    * @FOS\QueryParam(name = "usuario", nullable = true)
    * @FOS\QueryParam(name = "permissao", nullable = true)
    * @FOS\QueryParam(name = "entidade", nullable = true)
    * @FOS\QueryParam(name = "grupo", nullable = true)
    * @FOS\QueryParam(name = "tipoAcesso", nullable = true)
    */
    function getRemovidosAction(Request $request, ParamFetcherInterface $paramFetcher) {
        return $this->getDeletedList($request, $paramFetcher->all());
    }
    
    /**
    * @ApiDoc()
    * 
    * @FOS\Post("atribuicoes")
    * @ParamConverter("atribuicao", converter="fos_rest.request_body")
    */
    function postAction(Request $request, Atribuicao $atribuicao, ConstraintViolationListInterface $errors) {
        if(count($errors) > 0) {
            return $this->handleValidationErrors($errors);
        }
        return $this->post($request, $atribuicao, $errors);
    }
    
    /**
    * @ApiDoc()
    * 
    * @FOS\Put("atribuicoes/{id}")
    * @ParamConverter("atribuicao", converter="fos_rest.request_body")
    */
    function putAction(Request $request, $id, Atribuicao $atribuicao, ConstraintViolationListInterface $errors) {
        if(count($errors) > 0) {
            return $this->handleValidationErrors($errors);
        }
        return $this->put($request, $id, $atribuicao, $errors);
    }
    
    /**
    * @ApiDoc()
    */
    function deleteAction(Request $request, $id) {
        return $this->delete($request, $id);
    }
    
}
