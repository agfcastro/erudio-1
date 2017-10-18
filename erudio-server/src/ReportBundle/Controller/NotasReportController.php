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

namespace ReportBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Ps\PdfBundle\Annotation\Pdf;
use Psr\Log\LoggerInterface;
use CursoBundle\Service\TurmaFacade;
use CursoBundle\Service\DisciplinaOfertadaFacade;
use AvaliacaoBundle\Service\HabilidadeFacade;
use AvaliacaoBundle\Service\ConceitoFacade;

class NotasReportController extends Controller {
    
    private $turmaFacade;
    private $disciplinaOfertadaFacade;
    private $habilidadeFacade;
    private $conceitoFacade;
    private $logger;
    
    function __construct(TurmaFacade $turmaFacade, DisciplinaOfertadaFacade $disciplinaOfertadaFacade, 
            HabilidadeFacade $habilidadeFacade, ConceitoFacade $conceitoFacade, LoggerInterface $logger) {
        $this->turmaFacade = $turmaFacade;
        $this->disciplinaOfertadaFacade = $disciplinaOfertadaFacade;
        $this->habilidadeFacade = $habilidadeFacade;
        $this->conceitoFacade = $conceitoFacade;
        $this->logger = $logger;
    }
    
    /**
    * @Route("/diario-notas", defaults={ "_format" = "pdf" })
    * @Pdf(stylesheet = "reports/templates/stylesheet.xml")
    */
    function diarioAction(Request $request) {
        try {
            $auto = $request->query->get('auto', true);
            $media = $request->query->getInt('media', 1);
            $disciplina = $this->disciplinaOfertadaFacade->find(
                $request->query->getInt('disciplina')
            );
            $diarios = [ $this->gerarDiario($disciplina, $media, $auto) ];
            $template = $this->isSistemaQualitativo($turma->getEtapa()) 
                ? 'reports/nota/notaQualitativo.pdf.twig' 
                : 'reports/nota/notaQuantitativo.pdf.twig';
            return $this->render($template, [
                'instituicao' => $disciplina->getTurma()->getUnidadeEnsino(),
                'turma' => $turma,
                'media' => $media,
                'unidadeRegime' => $turma->getEtapa()->getSistemaAvaliacao()->getRegime()->getUnidade(),
                'enturmacoes' => $turma->getEnturmacoes(),
                'conceitos' => $this->isSistemaQualitativo($turma->getEtapa()) 
                    ? $this->conceitoFacade->findAll() : [],
                'diarios' => $diarios
            ]);
        } catch (\Exception $ex) {
            $this->logger->error($ex->getMessage());
            return new Response($ex->getMessage(), 500);
        }
    }
    
    /**
    * @Route("/diarios-notas", defaults={ "_format" = "pdf" })
    * @Pdf(stylesheet = "reports/templates/stylesheet.xml")
    */
    function diariosAction(Request $request) {
        try {
            $auto = $request->query->get('auto', true);
            $media = $request->query->getInt('media', 1);
            $turma = $this->turmaFacade->find($request->query->getInt('turma'));
            $diarios = [];
            foreach ($turma->getDisciplinas() as $disciplina) {
                $diarios[] = $this->gerarDiario($disciplina, $media, $auto);
            }
            $template = $this->isSistemaQualitativo($turma->getEtapa()) 
                ? 'reports/nota/notaQualitativo.pdf.twig' 
                : 'reports/nota/notaQuantitativo.pdf.twig';
            return $this->render($template, [
                'instituicao' => $disciplina->getTurma()->getUnidadeEnsino(),
                'turma' => $turma,
                'media' => $media,
                'unidadeRegime' => $turma->getEtapa()->getSistemaAvaliacao()->getRegime()->getUnidade(),
                'enturmacoes' => $turma->getEnturmacoes(),
                'conceitos' => $this->isSistemaQualitativo($turma->getEtapa()) 
                    ? $this->conceitoFacade->findAll() : [],
                'diarios' => $diarios
            ]);
        } catch (\Exception $ex) {
            $this->logger->error($ex->getMessage());
            return new Response($ex->getMessage(), 500);
        }
    }
    
    /**
     * Gera a estrutura de um diário de frequência, para determinada disciplina ofertada, 
     * em determinado mês.
     * 
     * @param $disciplina
     * @return array diário de notas
     */
    private function gerarDiario($disciplina, $media, $autoPreenchimento = true) {
        $avaliacoes = $autoPreenchimento ? [] : [];
        $professor = $disciplina->getProfessoresAsString();
        $diario = [
            'disciplina' => $disciplina->getNomeExibicao(),
            'avaliacoes' => $avaliacoes,
            'professor' => $professor
        ];
        if ($this->isSistemaQualitativo($disciplina->getDisciplina()->getEtapa())) {
            $diario['habilidades'] = $this->habilidadeFacade->findAll([
                'disciplina' => $disciplina->getDisciplina()->getId(),
                'media' => $media
            ]);
        }
        return $diario;
    }
    
    private function isSistemaQualitativo($etapa) {
        return $etapa->getSistemaAvaliacao()->isQualitativo();
    }
    
}
