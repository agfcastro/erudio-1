<?php

namespace SME\FilaUnicaBundle\Controller;

/**
 * This code has been auto-generated by the JMSDiExtraBundle.
 *
 * Manual changes to it will be lost.
 */
class UnidadeEscolarController__JMSInjector
{
    public static function inject($container) {
        require_once __DIR__ . '/../proxies/SME-FilaUnicaBundle-Controller-UnidadeEscolarController.php';
        $e = new \JMS\AopBundle\Aop\InterceptorLoader($container, array('SME\\FilaUnicaBundle\\Controller\\UnidadeEscolarController' => array('formAlteracaoAction' => array(0 => 'security.access.method_interceptor'), 'alterarAction' => array(0 => 'security.access.method_interceptor'))));
        $instance = new \EnhancedProxyb7349af4_6a8aac35268fbf9e4d62561b9713dc0b88710706\__CG__\SME\FilaUnicaBundle\Controller\UnidadeEscolarController();
        $instance->__CGInterception__setLoader($e);
        return $instance;
    }
}
