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

namespace AuthBundle\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;
use JMS\Serializer\Annotation as JMS;
use Symfony\Component\Security\Core\User\UserInterface;
use CoreBundle\ORM\AbstractEditableEntity;
use Doctrine\Common\Collections\Criteria;
use AuthBundle\Service\MD5Encoder;

/**
 * @ORM\Entity
 * @ORM\Table(name="edu_acesso_usuario")
 */
class Usuario extends AbstractEditableEntity implements UserInterface {
    
    /**
     * @JMS\Groups({"LIST"})     
     * @ORM\Column(name="nome_usuario", unique=true, nullable=false) 
     */
    private $username;
    
    /**
    * @JMS\Groups({"LIST"})
    * @ORM\Column(name="senha") 
    */
    private $password;
    
    /**
    * @JMS\Groups({"LIST"})    
    * @ORM\Column(name="nome_exibicao") 
    */
    private $nomeExibicao;
    
    /** 
    * @JMS\Groups({"LIST"})
    * @JMS\MaxDepth(depth = 1)
    * @JMS\Type("PessoaBundle\Entity\Pessoa")
    * @ORM\OneToOne(targetEntity="PessoaBundle\Entity\Pessoa", mappedBy="usuario")
    */
    private $pessoa;
    
    /**
    * @JMS\Exclude
    * @ORM\OneToMany(targetEntity = "Atribuicao", mappedBy = "usuario", fetch = "EXTRA_LAZY", cascade = {"all"}) 
    */
    private $atribuicoes;
    
    public function eraseCredentials() {
        
    }

    public function init() {
        $this->atribuicoes = new ArrayCollection();
    }
    
    public function getSalt() {
        $parts = explode(':', $this->password);
        return isset($parts[1]) ? $parts[1] : null;
    }

    public function getId() {
        return $this->id;
    }
    
    public function getUsername() {
        return $this->username;
    }

    public function setUsername($username) {
        $this->username = $username;
    }

    public function getPassword() {
        $parts = explode(':', $this->password);
        return $parts[0];
    }

    public function setPassword($password) {
        $this->password = $password;
    }

    public function getNomeExibicao() {
        return $this->nomeExibicao;
    }

    public function setNomeExibicao($nomeExibicao) {
        $this->nomeExibicao = $nomeExibicao;
    }
    
    function getPessoa() {
        return $this->pessoa;
    }
    
    public function getRoles() {
        return array();
    }

    /**
    * @JMS\Groups({"LIST"})
    * @JMS\VirtualProperty
    * @JMS\Type("ArrayCollection<AuthBundle\Entity\Atribuicao>")
    */
    public function getAtribuicoes() {
        return $this->atribuicoes->matching(
            Criteria::create()->where(Criteria::expr()->eq('ativo', true))
        );
    }
    
    public function equals(UserInterface $user) {
        return $user instanceof Usuario && $this->username === $user->getUsername();
    }
    
    public static function criarUsuario($pessoa, $username) {
        $usuario = new Usuario();
        $usuario->username = $username;
        $usuario->nomeExibicao = $pessoa->getNome();
        $password = substr(str_shuffle($username.str_replace(' ','',$pessoa->getNome())), 0, 6);            
        $md5 = new MD5Encoder();
        $usuario->password = $md5->encodePassword($password);
        return $usuario;
    }
}
