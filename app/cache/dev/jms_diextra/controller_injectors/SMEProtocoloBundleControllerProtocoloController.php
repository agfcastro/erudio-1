<?php

namespace SME\ProtocoloBundle\Controller;

/**
 * This code has been auto-generated by the JMSDiExtraBundle.
 *
 * Manual changes to it will be lost.
 */
class ProtocoloController__JMSInjector
{
    public static function inject($container) {
        require_once __DIR__ . '/../proxies/SME-ProtocoloBundle-Controller-ProtocoloController.php';
        $a = new \JMS\AopBundle\Aop\InterceptorLoader($container, array('SME\\ProtocoloBundle\\Controller\\ProtocoloController' => array('tomarPosseAction' => array(0 => 'security.access.method_interceptor'), 'formAtualizacaoAction' => array(0 => 'security.access.method_interceptor'), 'atualizarAction' => array(0 => 'security.access.method_interceptor'), 'formEncaminhamentoAction' => array(0 => 'security.access.method_interceptor'), 'encaminharAction' => array(0 => 'security.access.method_interceptor'), 'cancelarEncaminhamentoAction' => array(0 => 'security.access.method_interceptor'))));
        $instance = new \EnhancedProxyb7349af4_e26cdb8e2e5d45446f7f14c6138056fe96da34b0\__CG__\SME\ProtocoloBundle\Controller\ProtocoloController();
        $instance->__CGInterception__setLoader($a);
        return $instance;
    }
}
