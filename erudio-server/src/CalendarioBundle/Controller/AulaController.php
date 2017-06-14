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

namespace CalendarioBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use FOS\RestBundle\Controller\Annotations as FOS;
use FOS\RestBundle\Request\ParamFetcher;
use FOS\RestBundle\View\View;
use FOS\RestBundle\Util\Codes;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use CoreBundle\REST\AbstractEntityController;
use Symfony\Component\HttpFoundation\Response;
use CoreBundle\ORM\Exception\IllegalUpdateException;

/**
 * @FOS\RouteResource("aulas")
 */
class AulaController extends AbstractEntityController {
    
    public function getFacade() {
        return $this->get('facade.calendario.aulas');
    }
    
    /**
    * @ApiDoc()
    * 
    * @FOS\Get("aulas/{id}")
    */
    function getAction(Request $request, $id) {
        return $this->getOne($request, $id);
    }
    
    /**
    *  @ApiDoc()
    * 
    *  @FOS\Get("turmas/{turma}/aulas")
    *  @FOS\QueryParam(name = "page", requirements="\d+", default = null) 
    *  @FOS\QueryParam(name = "dia", requirements="\d+", nullable = true)
    *  @FOS\QueryParam(name = "mes", requirements="\d+", nullable = true)
    *  @FOS\QueryParam(name = "disciplina", requirements="\d+", nullable = true) 
    */
    function getListAction(Request $request, ParamFetcher $paramFetcher, $turma) { 
        $params = $paramFetcher->all();
        $params['turma'] = $turma;
        return $this->getList($request, $params);
    }
    
    /**
    *  @ApiDoc()
    * 
    *  @FOS\Post("turmas/{turma}/aulas")
    */
    function postBatchAction(Request $request, $turma) {
        try {
            $this->getFacade()->gerarAulas($turma);
            $view = View::create(null, Codes::HTTP_CREATED);
        } catch (IllegalUpdateException $ex) {
            $view = View::create($ex->getMessage(), Codes::HTTP_BAD_REQUEST);
        }
        return $this->handleView($view);
    }
    
    /**
    *  @ApiDoc()
    * 
    *  @FOS\Put("turmas/{turma}/aulas")
    */
    function putBatchAction(Request $request, $turma) {
        $dataInicio = $request->query->get('dataInicio');
        $this->getFacade()->gerarNovasAulas($turma, $dataInicio);
        $view = View::create(null, Codes::HTTP_CREATED);
        return $this->handleView($view);
    }
    
}
