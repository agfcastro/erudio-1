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

namespace VinculoBundle\Listener;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use AuthBundle\Service\AtribuicaoFacade;
use VinculoBundle\Event\AlocacaoEvent;

/**
* Remove a atribuição que foi gerada para o usuário da pessoa no ato da alocação,
* retirando assim suas permissões.
* 
*/
class RemoverAtribuicaoListener implements EventSubscriberInterface {
    
     private $atribuicaoFacade;
    
    function __construct(AtribuicaoFacade $atribuicaoFacade) {
        $this->atribuicaoFacade = $atribuicaoFacade;
    }
    
    static function getSubscribedEvents() {
        return [AlocacaoEvent::ALOCACAO_REMOVIDA => 'execute'];
    }
    
    function execute(AlocacaoEvent $event) {
        $alocacao = $event->getAlocacao();
        $atribuicoes = $this->atribuicaoFacade->findAll([
            'usuario' => $alocacao->getVinculo()->getFuncionario()->getUsuario(),
            'grupo' => $alocacao->getVinculo()->getCargo()->getGrupo(), 
            'instituicao' => $alocacao->getInstituicao()
        ]);
        foreach ($atribuicoes as $a) {
            $this->atribuicaoFacade->remove($a->getId());
        }
    }
    
}
