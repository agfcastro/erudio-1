<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace ReportBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Psr\Log\LoggerInterface;
use Ps\PdfBundle\Annotation\Pdf;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use MatriculaBundle\Service\MatriculaFacade;
use MatriculaBundle\Service\HistoricoFacade;

class HistoricoReportController extends Controller {
    
    private $matriculaFacade;
    private $historicoFacade;
    
    function __construct(MatriculaFacade $matriculaFacade, HistoricoFacade $historicoFacade,
        LoggerInterface $logger) {
        $this->logger = $logger;
        $this->matriculaFacade = $matriculaFacade;
        $this->historicoFacade = $historicoFacade;
    }
    
    /**
    * @ApiDoc(
    *   resource = true,
    *   section = "Módulo Relatórios",
    *   description = "Histórico preliminar individual",
    *   statusCodes = {
    *       200 = "Documento PDF"
    *   }
    * )
    * 
    * @Route("/historico", defaults={ "_format" = "pdf" })
    * @Pdf(stylesheet = "reports/templates/stylesheet.xml")
    */
    function individualAction(Request $request) {
        try {
            $matricula = $this->matriculaFacade->find($request->query->getInt('matricula'));
            $dadosHistorico = $this->historicoFacade->gerarPreliminar($matricula);
            return $this->render('reports/historico/historico.pdf.twig', [
                'instituicao' => $matricula->getUnidadeEnsino(),
                'aluno' => $matricula->getAluno(),
                'matricula' => $matricula,
                'dados' => $dadosHistorico
            ]);
        } catch (\Exception $ex) {
            $this->logger->error($ex->getMessage());
            return new Response($ex->getMessage(), 500);
        }
    }
    
}
