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
use Doctrine\ORM\QueryBuilder;
use CoreBundle\ORM\AbstractFacade;
use MatriculaBundle\Entity\Matricula;
use MatriculaBundle\Entity\DisciplinaCursada;
use MatriculaBundle\Entity\Media;
use CursoBundle\Entity\Etapa;
use MatriculaBundle\Traits\CalculosMedia;

class DisciplinaCursadaFacade extends AbstractFacade {
    
    use CalculosMedia;
    
    private $mediaFacade;
    
    function __construct(RegistryInterface $doctrine, MediaFacade $mediaFacade) {
        parent::__construct($doctrine);
        $this->mediaFacade = $mediaFacade;
    }
    
    function getEntityClass() {
        return 'MatriculaBundle:DisciplinaCursada';
    }
    
    function queryAlias() {
        return 'd';
    }
    
    function parameterMap() {
        return [
            'dataCadastro' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('d.dataCadastro LIKE :dataCadastro')->setParameter('dataCadastro', '%' . $value . '%');
            },
            'status' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('d.status = :status')->setParameter('status', $value);
            },
            'enturmacao' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('enturmacao.id = :enturmacao')->setParameter('enturmacao', $value);
            },
            'turma' => function(QueryBuilder $qb, $value) {
                $qb->join('enturmacao.turma', 'turma')
                   ->andWhere('turma.id = :turma')->setParameter('turma', $value);
            },
            'disciplina' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('disciplina.id = :disciplina')->setParameter('disciplina', $value);
            },
            'etapa' => function(QueryBuilder $qb, $value) {
                $qb->join('disciplina.etapa', 'etapa')
                   ->andWhere('etapa.id = :etapa')->setParameter('etapa', $value);
            },
            'matricula' => function(QueryBuilder $qb, $value) {
                $qb->join('d.matricula', 'm')
                    ->andWhere('m.id = :matricula')->setParameter('matricula', $value);
            },
            'disciplinaOfertada' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('d.disciplinaOfertada = :disciplinaOfertada AND d.status <> :statusIncompleto')
                   ->setParameter('statusIncompleto', DisciplinaCursada::STATUS_INCOMPLETO)
                   ->setParameter('disciplinaOfertada', $value);
            }
        ];
    }
    
    function uniqueMap($disciplina) {
        return [[
            'matricula' => $disciplina->getMatricula(),
            'disciplina' => $disciplina->getDisciplina(),
            'status' => DisciplinaCursada::STATUS_CURSANDO
        ]];
    }
    
    function findAprovadas(Matricula $matricula, Etapa $etapa) {
        return $this->findByMatriculaAndEtapa($matricula, $etapa, [
            DisciplinaCursada::STATUS_APROVADO, 
            DisciplinaCursada::STATUS_DISPENSADO
        ]);
    }
    
    function findFinalizadas(Matricula $matricula, Etapa $etapa) {
        return $this->findByMatriculaAndEtapa($matricula, $etapa, [
            DisciplinaCursada::STATUS_APROVADO, 
            DisciplinaCursada::STATUS_REPROVADO,
            DisciplinaCursada::STATUS_DISPENSADO
        ]);
    }
    
    function findEmAndamento(Matricula $matricula, Etapa $etapa) {
        return $this->findByMatriculaAndEtapa($matricula, $etapa, [
            DisciplinaCursada::STATUS_CURSANDO, 
            DisciplinaCursada::STATUS_EXAME, 
            DisciplinaCursada::STATUS_DISPENSADO
        ]);
    }
    
    function findByMatriculaAndEtapa(Matricula $matricula, Etapa $etapa, $status = null) {
        $statusIn = $status ? $status : [
            DisciplinaCursada::STATUS_CURSANDO, 
            DisciplinaCursada::STATUS_EXAME, 
            DisciplinaCursada::STATUS_DISPENSADO
        ];
        return $this->orm->getRepository($this->getEntityClass())->createQueryBuilder('d')
            ->join('d.matricula', 'matricula')->join('d.disciplina', 'disciplina')->join('disciplina.etapa', 'etapa')
            ->where('d.ativo = true')
            ->andWhere('matricula.id = :matricula')->setParameter('matricula', $matricula->getId())
            ->andWhere('d.status IN (:status)')->setParameter('status', $statusIn)
            ->andWhere('etapa.id = :etapa')->setParameter('etapa', $etapa->getId())
            ->getQuery()->getResult();
    }
    
    protected function prepareQuery(QueryBuilder $qb, array $params) {
        $qb->join('d.disciplina', 'disciplina')
           ->leftJoin('d.enturmacao', 'enturmacao')
           ->addOrderBy('disciplina.nomeExibicao', 'ASC');
    }
    
    protected function afterCreate($disciplinaCursada) {
        if ($disciplinaCursada->getStatus() === DisciplinaCursada::STATUS_CURSANDO) {
            $this->gerarMedias($disciplinaCursada);
        }
    }
    
    protected function beforeRemove($disciplinaCursada) {
        if ($disciplinaCursada->getAuto() && $disciplinaCursada->getEnturmacao()) {
            throw new IllegalOperationException('Disciplinas cursadas geradas pelo sistema não podem ser excluídas');
        }
    }

    function encerrar(DisciplinaCursada $disciplina, $status = null) {
        if ($status) {
            $disciplina->encerrar($status);
        } else {
            $disciplina->setMediaFinal($this->calcularMediaFinal($disciplina));
            $disciplina->setFrequenciaTotal($this->calcularFrequenciaTotal($disciplina));
            $disciplina->atualizarStatus();
            if ($disciplina->getStatus() === DisciplinaCursada::STATUS_EXAME) {
                $this->criarMediaExame($disciplina);
            } else {
                $disciplina->encerrar();
            }
        }
        $this->orm->getManager()->flush();
    }
    
    private function gerarMedias(DisciplinaCursada $disciplinaCursada) {
        $numeroMedias = $disciplinaCursada->getDisciplina()->getEtapa()->getSistemaAvaliacao()->getQuantidadeMedias();
        for ($i = 1; $i <= $numeroMedias; $i++) {
            $media = new Media($disciplinaCursada, $i);
            $this->mediaFacade->create($media);
        }
    }
    
    private function criarMediaExame(DisciplinaCursada $disciplina) {
        $sistemaAvaliacao = $disciplina->getDisciplina()->getEtapa()->getSistemaAvaliacao();
        $mediaExame = new Media(
            $disciplina, 
            $sistemaAvaliacao->getQuantidadeMedias() + 1, 
            $sistemaAvaliacao->getPesoExame(),
            'EXAME'
        );
        $this->mediaFacade->create($mediaExame);
    }
    
}

