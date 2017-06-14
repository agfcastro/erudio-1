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

namespace MatriculaBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\ConstraintViolationListInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use FOS\RestBundle\Controller\Annotations as FOS;
use FOS\RestBundle\Request\ParamFetcherInterface;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use CoreBundle\REST\AbstractEntityController;
use MatriculaBundle\Entity\MovimentacaoTurma;

/**
 * @FOS\RouteResource("movimentacoes-turma")
 */
class MovimentacaoTurmaController extends AbstractEntityController {
    
    public function getFacade() {
        return $this->get('facade.matricula.movimentacoes_turma');
    }
    
    /**
    * @ApiDoc()
    * 
    * @FOS\Get("movimentacoes-turma/{id}")
    */
    function getAction(Request $request, $id) {
        return $this->getOne($request, $id);
    }
    
    /**
    * @ApiDoc()
    * 
    * @FOS\Get("movimentacoes-turma") 
    * @FOS\QueryParam(name = "page", requirements="\d+", default = null) 
    * @FOS\QueryParam(name = "matricula", requirements="\d+", nullable = true) 
    */
    function getListAction(Request $request, ParamFetcherInterface $paramFetcher) {
        return $this->getList($request, $paramFetcher->all());
    }
    
    /**
    * @ApiDoc()
    * 
    * @FOS\Post("movimentacoes-turma")
    * @ParamConverter("movimentacao", converter="fos_rest.request_body")
    */
    function postAction(Request $request, MovimentacaoTurma $movimentacao, ConstraintViolationListInterface $errors) {
        return $this->post($request, $movimentacao, $errors);
    }
    
    /**
    * @ApiDoc()
    * 
    * @FOS\Put("movimentacoes-turma/{id}")
    * @ParamConverter("movimentacao", converter="fos_rest.request_body")
    */
    function putAction(Request $request, $id, MovimentacaoTurma $movimentacao, ConstraintViolationListInterface $errors) {
        return $this->put($request, $id, $movimentacao, $errors);
    }

}
