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

namespace MatriculaBundle\Service;

use Symfony\Bridge\Doctrine\RegistryInterface;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Common\Collections\ArrayCollection;
use CoreBundle\ORM\AbstractFacade;
use CoreBundle\ORM\Exception\IllegalOperationException;
use CoreBundle\ORM\Exception\IllegalUpdateException;
use CoreBundle\Event\EntityEvent;
use MatriculaBundle\Entity\DisciplinaCursada;
use MatriculaBundle\Entity\Enturmacao;
use MatriculaBundle\Entity\EtapaCursada;
use CursoBundle\Entity\Turma;

class EnturmacaoFacade extends AbstractFacade {
    
    private $disciplinaCursadaFacade;
    
    function __construct(RegistryInterface $doctrine, EventDispatcherInterface $eventDispatcher, 
            DisciplinaCursadaFacade $disciplinaCursadaFacade) {
        parent::__construct($doctrine, null, $eventDispatcher);
        $this->disciplinaCursadaFacade = $disciplinaCursadaFacade;
    }
    
    function getEntityClass() {
        return 'MatriculaBundle:Enturmacao';
    }
    
    function queryAlias() {
        return 'e';
    }
    
    function parameterMap() {
        return [
            'matricula' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('matricula = :matricula')->setParameter('matricula', $value);
            },
            'turma' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('turma = :turma')->setParameter('turma', $value);
            },
            'turma_unidadeEnsino' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('turma.unidadeEnsino = :unidadeEnsino')->setParameter('unidadeEnsino', $value);
            },
            'encerrado' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('e.encerrado = :encerrado')->setParameter('encerrado', $value);
            },
            'concluido' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('e.concluido = :concluido')->setParameter('concluido', $value);
            },
            'dataAula' => function(QueryBuilder $qb, $value) {
                $data = $value->format('Y-m-d') . ' 23:59:59';
                $qb->andWhere('e.dataCadastro <= :dataAula')
                   ->andWhere('(e.encerrado = false OR e.dataModificacao > :dataAula)')
                   ->setParameter('dataAula', $data);
            },
            'emAndamento' => function(QueryBuilder $qb, $value) {
                $qb->andWhere("e.concluido = false")->andWhere("e.encerrado = false");
            },
            'aprovado' => function(QueryBuilder $qb, $value) {
                $operator = $value ? '=' : '<>';
                $qb->join('e.etapaCursada', 'etapaCursada')
                   ->andWhere("etapaCursada.status {$operator} :aprovado")
                   ->setParameter('aprovado', EtapaCursada::STATUS_APROVADO);
            },
            'matricula_enturmado' => function(QueryBuilder $qb, $value) {
                $operator = $value ? '>' : '=';
                $qb->andWhere('(SELECT COUNT(en.id) FROM MatriculaBundle:Enturmacao AS en WHERE en.matricula = matricula'
                    . " AND en.ativo = true AND en.encerrado = false AND en.concluido = false) {$operator} 0");
            }
        ];
    }
    
    function uniqueMap($enturmacao) {
        return [[
            'matricula' => $enturmacao->getMatricula(), 
            'turma' => $enturmacao->getTurma(), 
            'encerrado' => false,
            'concluido' => false
        ]];
    }
    
    /**
     * Lista enturmaçẽos de alunos defasados de um curso ofertado, em determinada etapa.
     * 
     * @param Etapa $etapa
     * @return array alunos defasados
     */
    function getAlunosDefasados($cursoOfertado, $etapa, \DateTime $dataReferencia = null) {
        $dataLimite = $dataReferencia ? $dataReferencia 
                : \DateTime::createFromFormat('Y-m-d', (new \DateTime())->format('Y') . '-03-31');
        $idadeLimite = $etapa->getIdadeRecomendada() + $etapa->getCurso()->getLimiteDefasagem();
        $dataLimite->sub(new \DateInterval("P{$idadeLimite}Y"));
        $qb = $this->orm->getManager()->createQueryBuilder()->select('en')
            ->from($this->getEntityClass(), 'en')
            ->join('en.turma', 't')->join('t.etapa', 'e')->join('t.unidadeEnsino', 'u')
            ->join('en.matricula', 'm')->join('m.aluno', 'a')
            ->where('en.ativo = true')->andWhere('en.encerrado = false')
            ->andWhere('u.id = :unidadeEnsino')->andWhere('e.id = :etapa')
            ->andWhere('a.dataNascimento < :limiteInferior')
            ->setParameter('etapa', $etapa->getId())
            ->setParameter('unidadeEnsino', $cursoOfertado->getUnidadeEnsino()->getId())
            ->setParameter('limiteInferior', $dataLimite);
        return $qb->getQuery()->getResult();
    }
    
    /**
     * Conta alunos de uma turma. O parâmetro adicional filtra a contagem por gênero.
     * 
     * @param Turma $turma
     * @param $genero 'M' para masculino e 'F' para feminino
     * @return integer número de alunos da turma
     */
    function countByTurma(Turma $turma, $genero = '') {
        $qb = $this->orm->getManager()->createQueryBuilder()->select('COUNT(e.id)')
            ->from($this->getEntityClass(), 'e')
            ->join('e.turma', 't')->join('e.matricula', 'm')
            ->where('e.ativo = true')->andWhere('e.encerrado = false')
            ->andWhere('t.id = :turma')->setParameter('turma', $turma->getId());
        if ($genero) {
            $qb = $qb->join('m.aluno', 'a')->andWhere('a.genero = :genero')->setParameter('genero', $genero);
        }
        return $qb->getQuery()->getSingleScalarResult();
    }
    
    /**
     * Encerra uma enturmação de um aluno que está sendo transferido para outra unidade
     * de ensino ou que está sendo desligado. 
     * O segundo argumento define se as disciplinas serão igualmente encerradas, ficando 
     * com seu status permanentemente INCOMPLETO, ou se permanecerão ativas, podendo ser 
     * vinculadas a uma nova enturmação, o que tipicamente ocorre em uma transferência entre unidades.
     * 
     * @param Enturmacao $enturmacao
     */
    function encerrarPorMovimentacao(Enturmacao $enturmacao, $manterDisciplinas = true) {
        $enturmacao->encerrar();
        $this->update($enturmacao);
        if ($manterDisciplinas) {
            $this->desvincularDisciplinas($enturmacao);
        } else {
            $this->encerrarDisciplinas($enturmacao);
        }
    }
    
    /**
     * Finaliza uma enturmação de um aluno que está concluindo as disciplinas cursadas.
     * 
     * @param Enturmacao $enturmacao
     */
    function finalizar(Enturmacao $enturmacao) {
        $disciplinas = $enturmacao->getDisciplinasCursadas();
        foreach ($disciplinas as $disciplina) {
            if ($disciplina->emAberto()) {
                throw new IllegalUpdateException(
                    IllegalUpdateException::ILLEGAL_STATE_TRANSITION,
                    "Enturmação não pode ser encerrada, o aluno {$enturmacao->getAluno()->getNome()} "
                    . "possui média em aberto na disciplina {$disciplina->getNomeExibicao()}"
                );
            }
        }
        $enturmacao->concluir();
        $this->update($enturmacao);
    }
     
    function importar(Turma $turmaOrigem, Turma $turmaDestino, array $exclusoes = []) {
        if ($turmaOrigem->getEtapa()->getOrdem() + 1 != $turmaDestino->getEtapa()->getOrdem()) {
            throw new IllegalOperationException('A turma destino deve ser da etapa seguinte à de origem');
        }
        $enturmacoes = array_diff($turmaOrigem->getEnturmacoes()->toArray(), $exclusoes);
        $novasEnturmacoes = array_map(function($e) use ($turmaDestino) {
            return new Enturmacao($e->getMatricula(), $turmaDestino);
        }, array_filter($enturmacoes, function($e) {
            return $e->isAprovado() && $e->getMatricula()->isCursando();
        }));
        $this->createBatch(new ArrayCollection($novasEnturmacoes));
    }
    
    protected function selectMap() {
        return ['e', 'turma', 'matricula', 'aluno', 'vaga', 'etapa', 'unidadeEnsino'];
    }
    
    protected function prepareQuery(QueryBuilder $qb, array $params) {
        $qb->join('e.matricula', 'matricula')
           ->join('matricula.aluno', 'aluno')
           ->join('e.turma', 'turma')
           ->join('turma.etapa', 'etapa')
           ->join('turma.unidadeEnsino', 'unidadeEnsino')
           ->leftJoin('e.vaga', 'vaga')
           ->orderBy('aluno.nome');
    }
    
    protected function beforeCreate($enturmacao) {
        if (!$enturmacao->getMatricula()->isCursando()) {
            throw new IllegalOperationException('Matrícula em situação inválida para enturmação');
        }
        if ($this->possuiVagaAberta($enturmacao) == false) {
            throw new IllegalOperationException('Não existem vagas disponíveis nesta turma');
        }
        if ($enturmacao->getMatricula()->getCurso() != $enturmacao->getTurma()->getEtapa()->getCurso()) {
            throw new IllegalOperationException('Curso da matrícula e da turma são incompatíveis');
        }
    }
    
    protected function afterCreate($enturmacao) {
        $enturmacao->getMatricula()->redefinirEtapa();
        $this->orm->getManager()->flush();
        $this->vincularDisciplinas($enturmacao);
        EntityEvent::createAndDispatch($enturmacao, EntityEvent::ACTION_CREATED, $this->eventDispatcher);
    }
    
    protected function afterUpdate($enturmacao) {
        EntityEvent::createAndDispatch($enturmacao, EntityEvent::ACTION_UPDATED, $this->eventDispatcher);
    }
    
    protected function afterRemove($enturmacao) {
        $this->desvincularDisciplinas($enturmacao);
        $enturmacao->getMatricula()->resetarEtapa();
        $this->orm->getManager()->flush();
        EntityEvent::createAndDispatch($enturmacao, EntityEvent::ACTION_REMOVED, $this->eventDispatcher);
    }
    
    /**
     * Vincula disciplinas cursadas existentes à uma enturmação recém-criada, ou cria
     * novas disciplinas cursadas de acordo com aquelas oferecidas na turma.
     * 
     * @param Enturmacao $enturmacao
     */
    private function vincularDisciplinas(Enturmacao $enturmacao) {
        $matricula = $enturmacao->getMatricula();
        $disciplinasOfertadas = $enturmacao->getTurma()->getDisciplinas();
        $disciplinasEmAndamento = $this->disciplinaCursadaFacade
                ->findByMatriculaAndEtapa($matricula, $enturmacao->getTurma()->getEtapa());
        foreach ($disciplinasOfertadas as $disciplinaOfertada) {   
            $emAndamento = false;                     
            foreach ($disciplinasEmAndamento as $disciplinaCursada) {
                if ($disciplinaCursada->getDisciplina()->getId() === $disciplinaOfertada->getDisciplina()->getId()) {
                    $disciplinaCursada->vincularEnturmacao($enturmacao, $disciplinaOfertada);
                    $this->orm->getManager()->merge($disciplinaCursada);
                    $emAndamento = true;
                    break;
                }                
            }
            if (!$emAndamento) {
                $disciplinaCursada = new DisciplinaCursada($matricula, 
                        $disciplinaOfertada->getDisciplina(), DisciplinaCursada::STATUS_CURSANDO);
                $disciplinaCursada->vincularEnturmacao($enturmacao, $disciplinaOfertada);
                $this->disciplinaCursadaFacade->create($disciplinaCursada);
            }
        }
        $this->orm->getManager()->flush();
    }
    
    /**
     * Encerra disciplinas cursadas de uma enturmação, com o status informado.
     * 
     * @param Enturmacao $enturmacao
     * @param $status
     */
    private function desvincularDisciplinas(Enturmacao $enturmacao) {
        foreach ($enturmacao->getDisciplinasCursadas() as $disciplina) {
            $disciplina->desvincularEnturmacao();
            $this->orm->getManager()->merge($disciplina);
        }
        $this->orm->getManager()->flush();
    }
    
    /**
     * Encerra disciplinas cursadas de uma enturmação, com o status informado.
     * 
     * @param Enturmacao $enturmacao
     * @param $status
     */
    private function encerrarDisciplinas(Enturmacao $enturmacao, $status = DisciplinaCursada::STATUS_INCOMPLETO) {
        foreach ($enturmacao->getDisciplinasCursadas() as $disciplina) {
            $disciplina->encerrar($status);
            $this->orm->getManager()->merge($disciplina);
        }
        $this->orm->getManager()->flush();
    }
    
    /**
     * Indica se existe vaga aberta para a enturmação informada.
     * 
     * @param Enturmacao $enturmacao
     * @return true caso a turma da enturmação possua vaga disponível, e false em
     * caso contrário
     */
    function possuiVagaAberta(Enturmacao $enturmacao) {
        return $enturmacao->getTurma()->getVagasAbertas()->count() > 0;
    }
    
}