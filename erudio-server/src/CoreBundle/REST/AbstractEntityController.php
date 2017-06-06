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

namespace CoreBundle\REST;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\ConstraintViolationListInterface;
use Doctrine\ORM\NoResultException;
use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\View\View;
use FOS\RestBundle\Util\Codes;
use JMS\Serializer\Annotation as JMS;
use CoreBundle\ORM\Exception\IllegalOperationException;
use CoreBundle\ORM\Exception\UniqueViolationException;
use CoreBundle\ORM\AbstractFacade;

/**
* Controlador REST que serve como base aos demais.
* Oferece os métodos CRUD já implementados, usando a classe Facade retornada pelo método getFacade.
*/
abstract class AbstractEntityController extends FOSRestController {
    
    const SERIALIZER_GROUP_LIST = 'LIST';
    const SERIALIZER_GROUP_DETAILS = 'DETAILS';
    const PAGE_PARAM = 'page';
    
    abstract function getFacade();
    
    function getOne(Request $request, $id) {
        try {
            $entidade = $this->getFacade()->find($id);
            $view = View::create($entidade, Codes::HTTP_OK);
            $this->configureSerializationContext($view->getSerializationContext());
        } catch(\Exception $ex) {
            $view = View::create(null, Codes::HTTP_NOT_FOUND);
        }
        return $this->handleView($view);
    }

    function getList(Request $request, array $params) {
        $page = key_exists(self::PAGE_PARAM, $params) ? $params[self::PAGE_PARAM] : null;
        $resultados = $this->getFacade()->findAll($params, $page);
        $view = View::create($resultados, Codes::HTTP_OK);
        if (!is_null($page)) {
            $this->addPageLinks($request, $view, $params, $page);
        }
        $this->configureSerializationContext($view->getSerializationContext(), [self::SERIALIZER_GROUP_LIST]);
        return $this->handleView($view);
    }
    
    function post(Request $request, $entidade, ConstraintViolationListInterface $errors) {
        if(count($errors) > 0) {
            return $this->handleValidationErrors($errors);
        }
        try {
            $entidadeCriada = $this->getFacade()->create($entidade);
            $view = View::create($entidadeCriada, Codes::HTTP_OK);
            $this->configureSerializationContext($view->getSerializationContext());
        } catch (UniqueViolationException $ex) {
            $view = View::create($ex->getMessage(), Codes::HTTP_BAD_REQUEST);
        } catch (IllegalOperationException $ex) {
            $view = View::create($ex->getMessage(), Codes::HTTP_BAD_REQUEST);
        }
        return $this->handleView($view);
    }
    
    function postBatch(Request $request, $entidades, ConstraintViolationListInterface $errors) {
        if(count($errors) > 0) {
            return $this->handleValidationErrors($errors);
        }
        try {
            $this->getFacade()->createBatch($entidades);
            $view = View::create(null, Codes::HTTP_NO_CONTENT);
            $this->configureSerializationContext($view->getSerializationContext());
        } catch (UniqueViolationException $ex) {
            $view = View::create($ex->getMessage(), Codes::HTTP_BAD_REQUEST);
        }
        return $this->handleView($view);
    }
    
    function put(Request $request, $id, $entidade, ConstraintViolationListInterface $errors) {
        if(count($errors) > 0) {
            return $this->handleValidationErrors($errors);
        }
        try {
            $entidadeAtualizada = $this->getFacade()->update($id, $entidade);
            $view = View::create($entidadeAtualizada, Codes::HTTP_OK);
            $this->configureSerializationContext($view->getSerializationContext());
        } catch (UniqueViolationException $ex) {
            $view = View::create($ex->getMessage(), Codes::HTTP_BAD_REQUEST);
        }
        return $this->handleView($view);
    }
    
    function putBatch(Request $request, $entidades, ConstraintViolationListInterface $errors) {
        if(count($errors) > 0) {
            return $this->handleValidationErrors($errors);
        }
        try {
            $this->getFacade()->updateBatch($entidades);
            $view = View::create(null, Codes::HTTP_NO_CONTENT);
            $this->configureSerializationContext($view->getSerializationContext());
        } catch (UniqueViolationException $ex) {
            $view = View::create($ex->getMessage(), Codes::HTTP_BAD_REQUEST);
        } 
        return $this->handleView($view);
    }
    
    function delete(Request $request, $id) {
        try {
            $this->getFacade()->remove($id);
            $view = View::create(null, Codes::HTTP_NO_CONTENT);
        } catch(NoResultException $ex) {
            $view = View::create(null, Codes::HTTP_NOT_FOUND);
        } catch(\Exception $ex) {
            $view = View::create($ex->getMessage(), Codes::HTTP_INTERNAL_SERVER_ERROR);
        }
        return $this->handleView($view);
    }
    
    protected function addPageLinks(Request $request, View $view, array $params, $page) {
        $links = [];
        if ($this->getFacade()->count($params) / (($page + 1) * AbstractFacade::PAGE_SIZE) > 1) {
            $next = $page + 1;
            $links[] = "<{$request->getPathInfo()}?page={$next}>; rel=\"next\"";
        }
        if ($page > 0) {
            $prev = $page - 1;
            $links[] = "<{$request->getPathInfo()}?page={$prev}>; rel=\"previous\"";
        }
        $view->setHeader('Link', $links);
    }
    
    protected function handleValidationErrors(ConstraintViolationListInterface $errors) {
        return $this->handleView(View::create($errors, Codes::HTTP_BAD_REQUEST));
    }
    
    protected function configureSerializationContext($context, array $groups = 
            [self::SERIALIZER_GROUP_LIST, self::SERIALIZER_GROUP_DETAILS]) {
        $context->setGroups($groups);
        $context->enableMaxDepthChecks();
        return $context;
    }
    
}
