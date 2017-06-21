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

use Doctrine\ORM\QueryBuilder;
use CoreBundle\ORM\AbstractFacade;
use CoreBundle\ORM\Exception\IllegalOperationException;
use MatriculaBundle\Entity\Matricula;
use AuthBundle\Entity\Usuario;
use AuthBundle\Service\UsuarioFacade;

class MatriculaFacade extends AbstractFacade {
    
    private $usuarioFacade;
    
    function setUsuarioFacade(UsuarioFacade $usuarioFacade) {
        $this->usuarioFacade = $usuarioFacade;
    }
    
    function getEntityClass() {
        return 'MatriculaBundle:Matricula';
    }
    
    function queryAlias() {
        return 'm';
    }
    
    function parameterMap() {
        return array (
            'aluno' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('aluno.id = :aluno')->setParameter('aluno', $value);
            },
            'aluno_nome' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('aluno.nome LIKE :nome')->setParameter('nome', '%' . $value . '%');
            },
            'aluno_dataNascimento' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('aluno.dataNascimento = :dataNascimento')->setParameter('dataNascimento', $value);
            },
            'curso' => function(QueryBuilder $qb, $value) {
                $qb->join('m.curso', 'curso')
                   ->andWhere('curso.id = :curso')->setParameter('curso', $value);
            },
            'etapa' => function(QueryBuilder $qb, $value) {
                $qb->leftJoin('m.etapa', 'etapa')
                   ->andWhere('etapa.id IS NULL OR etapa.id = :etapa')->setParameter('etapa', $value);
            },
            'unidadeEnsino' => function(QueryBuilder $qb, $value) {
                $qb->join('m.unidadeEnsino', 'unidadeEnsino')
                   ->andWhere('unidadeEnsino.id = :unidadeEnsino')->setParameter('unidadeEnsino', $value);
            },
            'codigo' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('m.codigo LIKE :codigo')->setParameter('codigo', '%' . $value . '%');
            },
            'status' => function(QueryBuilder $qb, $value) {
                $qb->andWhere('m.status = :status')->setParameter('status', $value);
            }
        );
    }
    
    protected function prepareQuery(QueryBuilder $qb, $params) {
        $qb->join('m.aluno', 'aluno');
    }
    
    function uniqueMap($matricula) {
        return [
            [
                'curso' => $matricula->getCurso()->getId(), 
                'aluno' => $matricula->getAluno()->getId(), 
                'status' => Matricula::STATUS_CURSANDO
            ]
        ];
    }
    
    protected function beforeCreate($matricula) {
        if ($this->jaExiste($matricula)) {
            throw new IllegalOperationException('Pessoa já possui matrícula neste curso');
        }
        $this->gerarCodigo($matricula);
    }
    
    protected function afterCreate($matricula) {
        $this->gerarUsuario($matricula);
    }
    
    protected function afterUpdate($matricula) {
        $this->orm->getManager()->flush();
    }
    
    private function jaExiste(Matricula $matricula) {
        $qb = $this->orm->getManager()->createQueryBuilder();
        return $qb->select('COUNT(m.id)')
            ->from($this->getEntityClass(), 'm')
            ->join('m.aluno', 'aluno')->join('m.curso', 'curso')
            ->where('m.ativo = true')
            ->andWhere('aluno.id = :aluno')->setParameter('aluno', $matricula->getAluno()->getId())
            ->andWhere('curso.id = :curso')->setParameter('curso', $matricula->getCurso()->getId())
            ->andWhere('m.status IN (:status)')
            ->setParameter('status', [Matricula::STATUS_CURSANDO, Matricula::STATUS_TRANCADO])
            ->getQuery()->getSingleScalarResult() > 0;
    }
    
    private function gerarCodigo(Matricula $matricula) {
        $now = new \DateTime();
        $ano = $now->format('Y');
        $qb = $this->orm->getManager()->createQueryBuilder()
            ->select('MAX(m.codigo)')
            ->from($this->getEntityClass(), 'm')
            ->where('m.codigo LIKE :codigo')
            ->setParameter('codigo', $ano . $matricula->getCurso()->getId() . '%');
        $numero = $qb->getQuery()->getSingleScalarResult();
        if(!$numero) {
            $numero = $ano . $matricula->getCurso()->getId() . '00000';
        }
        $matricula->definirCodigo($numero + 1);
    }
    
    private function gerarUsuario($matricula) {
        $pessoa = $matricula->getAluno();
        if (!$pessoa->getUsuario()) {
            $usuario = Usuario::criarUsuario($pessoa, $matricula->getCodigo());
            $this->usuarioFacade->create($usuario);
            $matricula->getAluno()->setUsuario($usuario);
            $this->orm->getManager()->merge($pessoa);
            $this->orm->getManager()->flush();
        }
    }
    
}

