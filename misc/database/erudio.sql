# Host: voldemort  (Version: 5.5.32-0ubuntu0.12.10.1-log)
# Date: 2016-09-01 15:54:18
# Generator: MySQL-Front 5.3  (Build 4.271)

/*!40101 SET NAMES latin1 */;

#
# Structure for table "edu_arquivo_pasta"
#

CREATE TABLE `edu_arquivo_pasta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `pasta_pai_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `arquivo_pasta_fk01` (`pasta_pai_id`),
  CONSTRAINT `arquivo_pasta_fk01` FOREIGN KEY (`pasta_pai_id`) REFERENCES `edu_arquivo_pasta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_arquivo_pasta"
#


#
# Structure for table "edu_arquivo"
#

CREATE TABLE `edu_arquivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL DEFAULT '',
  `nome_arquivo` varchar(255) NOT NULL DEFAULT '',
  `tipo` varchar(20) DEFAULT NULL,
  `tamanho` varchar(255) DEFAULT '',
  `ativo` int(11) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_modificacao` timestamp NULL DEFAULT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `pasta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasta_id` (`pasta_id`),
  CONSTRAINT `edu_arquivo_ibfk_1` FOREIGN KEY (`pasta_id`) REFERENCES `edu_arquivo_pasta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Data for table "edu_arquivo"
#


#
# Structure for table "edu_avaliacao_conceito"
#

CREATE TABLE `edu_avaliacao_conceito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `valor_min` varchar(255) NOT NULL,
  `valor_max` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_conceito"
#

REPLACE INTO `edu_avaliacao_conceito` VALUES (1,'D','D','10.00','10.00',1),(2,'ED','ED','8.00','9.00',1),(3,'PD','PD','6.00','7.00',1),(4,'ID','ID','4.00','5.00',1),(5,'ND','ND','2.00','3.00',1),(6,'HNT','HNT','0.00','0.00',1);

#
# Structure for table "edu_avaliacao_tipo"
#

CREATE TABLE `edu_avaliacao_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_tipo"
#


#
# Structure for table "edu_calendario_evento"
#

CREATE TABLE `edu_calendario_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `tipo` enum('ATIVIDADE_ESCOLAR','ATIVIDADE_ADMINISTRATIVA','INTERESSE_PUBLICO','FERIADO','RECESSO') NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario_evento"
#


#
# Structure for table "edu_cargo"
#

CREATE TABLE `edu_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `professor` tinyint(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "edu_cargo"
#

REPLACE INTO `edu_cargo` VALUES (1,'Professor',1,'2016-06-01 17:01:08','0000-00-00 00:00:00',NULL,1),(2,'Diretor',0,'2016-06-01 17:01:13','0000-00-00 00:00:00',NULL,1),(3,'Secret�rio',0,'2016-07-06 10:19:20','0000-00-00 00:00:00',NULL,1),(4,'Supervisor',0,'2016-06-01 17:02:35','0000-00-00 00:00:00',NULL,1);

#
# Structure for table "edu_modalidade_ensino"
#

CREATE TABLE `edu_modalidade_ensino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "edu_modalidade_ensino"
#

REPLACE INTO `edu_modalidade_ensino` VALUES (1,'Ensino Regular',1),(2,'Ensino de Jovens e Adultos',1),(3,'Ensino Ind�gena',1),(4,'Ensino T�cnico',1);

#
# Structure for table "edu_curso"
#

CREATE TABLE `edu_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `alfabetizatorio` tinyint(1) NOT NULL DEFAULT '0',
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `modalidade_ensino_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_fk01_idx` (`modalidade_ensino_id`),
  CONSTRAINT `curso_fk01` FOREIGN KEY (`modalidade_ensino_id`) REFERENCES `edu_modalidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_curso"
#


#
# Structure for table "edu_modulo"
#

CREATE TABLE `edu_modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_nivel_fk01_idx` (`curso_id`),
  CONSTRAINT `modulo_fk01` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_modulo"
#


#
# Structure for table "edu_permissao"
#

CREATE TABLE `edu_permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `nome_exibicao` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4D57012854BD530C` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "edu_permissao"
#

REPLACE INTO `edu_permissao` VALUES (1,'ROLE_INSTITUICAO','M�dulo Institui��es',1),(2,'ROLE_TIPO_UNIDADE','M�dulo Tipos de Unidade Escolar',1),(3,'ROLE_UNIDADE_ENSINO','M�dulo Unidades de Ensino',1),(4,'ROLE_MODULO','M�dulo M�dulos',1),(5,'ROLE_CURSO','M�dulo Cursos',1),(6,'ROLE_REGIME_ENSINO','M�dulo Regimes de Ensino',1),(7,'ROLE_ETAPA','M�dulo Etapas',1),(8,'ROLE_DISCIPLINA','M�dulo Disciplinas',1),(9,'ROLE_TURNO','M�dulo Turnos',1),(10,'ROLE_CARGO','M�dulos Cargos',1),(11,'ROLE_CALENDARIO','M�dulo Calend�rios Acad�mico',1),(12,'ROLE_MODELO_QUADRO','M�dulo Modelos de Quadro de Hor�rio',1),(13,'ROLE_EVENTOS','M�dulo Eventos',1),(14,'ROLE_TURMA','M�dulo Turmas',1),(15,'ROLE_GRADE_AULA','M�dulo Grade de Hor�rios',1),(16,'ROLE_QUADRO_HORARIO','M�dulo Quadro de Hor�rios',1),(17,'ROLE_MATRICULA','M�dulo Matr�culas e Enturma��es',1),(18,'ROLE_MOVIMENTACAO','M�dulo Movimenta��o',1),(19,'ROLE_PESSOA','M�dulo Pessoas',1),(20,'ROLE_FUNCIONARIO','M�dulo Funcion�rios',1),(21,'ROLE_AVALIACAO','M�dulo Avalia��es',1),(22,'ROLE_HABILIDADES','M�dulo Habilidades',1),(23,'ROLE_TIPOS_AVALIACAO','M�dulo Tipos de Avalia��o',1),(24,'ROLE_DIARIO_NOTAS','M�dulo Di�rio de Notas',1),(25,'ROLE_DIARIO_PRESENCA','M�dulo Di�rio de Presen�a',1),(26,'ROLE_USUARIOS','M�dulo Usu�rios',1),(27,'ROLE_PERMISSOES','M�dulo Permiss�es',1),(28,'ROLE_SUPER_ADMIN','Super Administrador',1),(29,'ROLE_HOME_PROFESSOR','Tela Inicial de Professor',1),(30,'ROLE_SOLICITAR_VAGA','M�dulo Solicita��o de Vaga',1);

#
# Structure for table "edu_quadro_horario_modelo"
#

CREATE TABLE `edu_quadro_horario_modelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `quantidade_aulas` varchar(255) NOT NULL,
  `duracao_aula` varchar(255) NOT NULL,
  `duracao_intervalo` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `posicao_intervalo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A1D49A5387CB4A1F` (`curso_id`),
  CONSTRAINT `FK_A1D49A5387CB4A1F` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario_modelo"
#


#
# Structure for table "edu_regime"
#

CREATE TABLE `edu_regime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "edu_regime"
#

REPLACE INTO `edu_regime` VALUES (1,'Trimestral','2015-11-19 16:35:16','0000-00-00 00:00:00',NULL,1),(2,'Bimestral','2016-04-13 17:29:41','2016-04-13 17:34:10',NULL,1),(3,'Semestral','2016-03-08 17:04:05','2016-03-08 17:30:06',NULL,1),(30,'Anual','2016-05-31 15:56:45','2016-04-29 14:35:01',NULL,1);

#
# Structure for table "edu_sistema_avaliacao"
#

CREATE TABLE `edu_sistema_avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `nome_identificacao` varchar(255) NOT NULL,
  `exame` tinyint(1) NOT NULL,
  `tipo` enum('QUANTITATIVO','QUALITATIVO') NOT NULL,
  `quantidade_medias` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `regime_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edu_sistema_avaliacao_idx` (`regime_id`),
  CONSTRAINT `edu_sistema_avaliacao` FOREIGN KEY (`regime_id`) REFERENCES `edu_regime` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "edu_sistema_avaliacao"
#

REPLACE INTO `edu_sistema_avaliacao` VALUES (1,'AVALIA��O QUANTITATIVA BIMESTRAL COM EXAME','QUANTITATIVA_COM_EXAME',1,'QUANTITATIVO',4,1,2),(2,'AVALIA��O CONCEITUAL TRIMESTRAL','QUALITATIVA_CONCEITUAL',1,'QUALITATIVO',3,1,1),(3,'AVALIA��O QUANTITATIVA SEMESTRAL SEM EXAME','QUANTITATIVA_SEM_EXAME',0,'QUANTITATIVO',1,1,3),(4,'SEM AVALIA��O','SEM_AVALIACAO',0,'QUALITATIVO',1,1,30);

#
# Structure for table "edu_etapa"
#

CREATE TABLE `edu_etapa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `nome_exibicao` varchar(255) NOT NULL,
  `ordem` int(11) NOT NULL,
  `limite_alunos` int(11) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `integral` tinyint(1) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  `quadro_horario_modelo_id` int(11) DEFAULT NULL,
  `sistema_avaliacao_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etapa_fk0_idx` (`curso_id`),
  KEY `etapa_fk1_idx` (`modulo_id`),
  KEY `etapa_fk04_idx` (`quadro_horario_modelo_id`),
  KEY `etapa_fk05_idx` (`sistema_avaliacao_id`),
  CONSTRAINT `etapa_fk01` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `etapa_fk02` FOREIGN KEY (`modulo_id`) REFERENCES `edu_modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `etapa_fk04` FOREIGN KEY (`quadro_horario_modelo_id`) REFERENCES `edu_quadro_horario_modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `etapa_fk05` FOREIGN KEY (`sistema_avaliacao_id`) REFERENCES `edu_sistema_avaliacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_etapa"
#


#
# Structure for table "edu_disciplina"
#

CREATE TABLE `edu_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `nome_exibicao` varchar(255) NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `opcional` tinyint(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `etapa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `disciplina_fk01_idx` (`curso_id`),
  KEY `disciplina_fk02_idx` (`etapa_id`),
  CONSTRAINT `disciplina_fk01` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `disciplina_fk02` FOREIGN KEY (`etapa_id`) REFERENCES `edu_etapa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_disciplina"
#


#
# Structure for table "edu_avaliacao_habilidade"
#

CREATE TABLE `edu_avaliacao_habilidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `media` int(11) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avaliacao_habilidade_fk01_idx` (`disciplina_id`),
  CONSTRAINT `avaliacao_habilidade_fk01` FOREIGN KEY (`disciplina_id`) REFERENCES `edu_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_habilidade"
#


#
# Structure for table "edu_tipo_unidade_ensino"
#

CREATE TABLE `edu_tipo_unidade_ensino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "edu_tipo_unidade_ensino"
#

REPLACE INTO `edu_tipo_unidade_ensino` VALUES (1,'Centro de Educa��o Infantil','CEI',1),(2,'Centro de Educa��o Integral','CEDIN',1),(3,'Centro Educacional','CE',1),(4,'Escola B�sica','EB',1),(5,'Grupo Escolar','GE',1);

#
# Structure for table "edu_turma_agrupamento"
#

CREATE TABLE `edu_turma_agrupamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma_agrupamento"
#


#
# Structure for table "edu_turno"
#

CREATE TABLE `edu_turno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "edu_turno"
#

REPLACE INTO `edu_turno` VALUES (1,'Matutino','07:30:00','11:45:00','2016-05-31 15:52:25','0000-00-00 00:00:00',NULL,1),(2,'Vespertino','13:30:00','17:45:00','2016-05-31 15:52:28','0000-00-00 00:00:00',NULL,1),(3,'Noturno','19:15:00','22:30:00','2016-05-31 15:52:22','0000-00-00 00:00:00',NULL,1),(4,'Integral','07:15:00','19:00:00','2016-05-31 15:52:58','0000-00-00 00:00:00',NULL,1);

#
# Structure for table "edu_vaga"
#

CREATE TABLE `edu_vaga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `turma_id` varchar(255) NOT NULL,
  `solicitacao_vaga_id` varchar(255) DEFAULT NULL,
  `enturmacao_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_vaga"
#


#
# Structure for table "sme_estado_civil"
#

CREATE TABLE `sme_estado_civil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D5693BA54BD530C` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 COMMENT='InnoDB free: 10240 kB';

#
# Data for table "sme_estado_civil"
#

REPLACE INTO `sme_estado_civil` VALUES (1,'Solteiro',1),(2,'Casado',1),(3,'Vi�vo',1),(4,'Separado',1),(5,'Divorciado',1),(6,'Uni�o est�vel',1);

#
# Structure for table "sme_intranet_usuario"
#

CREATE TABLE `sme_intranet_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_exibicao` varchar(255) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C67A84347878DEE5` (`nome_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "sme_intranet_usuario"
#

REPLACE INTO `sme_intranet_usuario` VALUES (1,'Administrador','admin','21232f297a57a5a743894a0e4a801fc3','2016-04-28 15:50:40','0000-00-00 00:00:00',NULL,1);

#
# Structure for table "edu_usuario_permissao"
#

CREATE TABLE `edu_usuario_permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('L','E') NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` varchar(255) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `permissao_id` int(11) DEFAULT NULL,
  `entidade_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_permissao_fk01_idx` (`usuario_id`),
  KEY `usuario_permissao_fk02_idx` (`permissao_id`),
  CONSTRAINT `usuario_permissao_fk01` FOREIGN KEY (`usuario_id`) REFERENCES `sme_intranet_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_permissao_fk02` FOREIGN KEY (`permissao_id`) REFERENCES `edu_permissao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "edu_usuario_permissao"
#

REPLACE INTO `edu_usuario_permissao` VALUES (1,'E','2016-04-29 14:59:01','0000-00-00 00:00:00',NULL,'1',1,28,'16138');

#
# Structure for table "sme_necessidade_especial"
#

CREATE TABLE `sme_necessidade_especial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sme_necessidade_especial"
#


#
# Structure for table "sme_pais"
#

CREATE TABLE `sme_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='InnoDB free: 10240 kB';

#
# Data for table "sme_pais"
#

REPLACE INTO `sme_pais` VALUES (1,'Brasil',1);

#
# Structure for table "sme_estado"
#

CREATE TABLE `sme_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pais_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_fk01_idx` (`pais_id`),
  CONSTRAINT `estado_fk01` FOREIGN KEY (`pais_id`) REFERENCES `sme_pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='InnoDB free: 10240 kB; (`pais_id`) REFER `dgp/sme_pais`(`id`';

#
# Data for table "sme_estado"
#

REPLACE INTO `sme_estado` VALUES (1,'Acre','AC',1,1),(2,'Alagoas','AL',1,1),(3,'Amap�','AP',1,1),(4,'Amazonas','AM',1,1),(5,'Bahia','BA',1,1),(6,'Cear�','CE',1,1),(7,'Distrito Federal','DF',1,1),(8,'Esp�rito Santo','ES',1,1),(9,'Goi�s','GO',1,1),(10,'Maranh�o','MA',1,1),(11,'Mato Grosso','MT',1,1),(12,'Mato Grosso do Sul','MS',1,1),(13,'Minas Gerais','MG',1,1),(14,'Par�','PA',1,1),(15,'Para�ba','PB',1,1),(16,'Paran�','PR',1,1),(17,'Pernambuco','PE',1,1),(18,'Piau�','PI',1,1),(19,'Rio de Janeiro','RJ',1,1),(20,'Rio Grande do Norte','RN',1,1),(21,'Rio Grande do Sul','RS',1,1),(22,'Rond�nia','RO',1,1),(23,'Roraima','RR',1,1),(24,'Santa Catarina','SC',1,1),(25,'S�o Paulo','SP',1,1),(26,'Sergipe','SE',1,1),(27,'Tocantins','TO',1,1);

#
# Structure for table "sme_cidade"
#

CREATE TABLE `sme_cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `ibge` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_fk01_idx` (`estado_id`),
  CONSTRAINT `cidade_fk01` FOREIGN KEY (`estado_id`) REFERENCES `sme_estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5508 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50 COMMENT='InnoDB free: 10240 kB; (`estado_id`) REFER `dgp/sme_estado`(';

#
# Data for table "sme_cidade"
#

REPLACE INTO `sme_cidade` VALUES (1,'Acrel�ndia','',NULL,1,1),(2,'Assis Brasil','',NULL,1,1),(3,'Brasil�ia','',NULL,1,1),(4,'Bujari','',NULL,1,1),(5,'Capixaba','',NULL,1,1),(6,'Cruzeiro do Sul','',NULL,1,1),(7,'Epitaciol�ndia','',NULL,1,1),(8,'Feij�','',NULL,1,1),(9,'Jord�o','',NULL,1,1),(10,'M�ncio Lima','',NULL,1,1),(11,'Manoel Urbano','',NULL,1,1),(12,'Marechal Thaumaturgo','',NULL,1,1),(13,'Pl�cido de Castro','',NULL,1,1),(14,'Porto Acre','',NULL,1,1),(15,'Porto Walter','',NULL,1,1),(16,'Rio Branco','',NULL,1,1),(17,'Rodrigues Alves','',NULL,1,1),(18,'Santa Rosa do Purus','',NULL,1,1),(19,'Sena Madureira','',NULL,1,1),(20,'Senador Guiomard','',NULL,1,1),(21,'Tarauac�','',NULL,1,1),(22,'Xapuri','',NULL,1,1),(23,'�gua Branca','',NULL,1,2),(24,'Anadia','',NULL,1,2),(25,'Arapiraca','',NULL,1,2),(26,'Atalaia','',NULL,1,2),(27,'Barra de Santo Ant�nio','',NULL,1,2),(28,'Barra de S�o Miguel','',NULL,1,2),(29,'Batalha','',NULL,1,2),(30,'Bel�m','',NULL,1,2),(31,'Belo Monte','',NULL,1,2),(32,'Boca da Mata','',NULL,1,2),(33,'Branquinha','',NULL,1,2),(34,'Cacimbinhas','',NULL,1,2),(35,'Cajueiro','',NULL,1,2),(36,'Campestre','',NULL,1,2),(37,'Campo Alegre','',NULL,1,2),(38,'Campo Grande','',NULL,1,2),(39,'Canapi','',NULL,1,2),(40,'Capela','',NULL,1,2),(41,'Carneiros','',NULL,1,2),(42,'Ch� Preta','',NULL,1,2),(43,'Coit� do N�ia','',NULL,1,2),(44,'Col�nia Leopoldina','',NULL,1,2),(45,'Coqueiro Seco','',NULL,1,2),(46,'Coruripe','',NULL,1,2),(47,'Cra�bas','',NULL,1,2),(48,'Delmiro Gouveia','',NULL,1,2),(49,'Dois Riachos','',NULL,1,2),(50,'Estrela de Alagoas','',NULL,1,2),(51,'Feira Grande','',NULL,1,2),(52,'Feliz Deserto','',NULL,1,2),(53,'Flexeiras','',NULL,1,2),(54,'Girau do Ponciano','',NULL,1,2),(55,'Ibateguara','',NULL,1,2),(56,'Igaci','',NULL,1,2),(57,'Igreja Nova','',NULL,1,2),(58,'Inhapi','',NULL,1,2),(59,'Jacar� dos Homens','',NULL,1,2),(60,'Jacu�pe','',NULL,1,2),(61,'Japaratinga','',NULL,1,2),(62,'Jaramataia','',NULL,1,2),(63,'Joaquim Gomes','',NULL,1,2),(64,'Jundi�','',NULL,1,2),(65,'Junqueiro','',NULL,1,2),(66,'Lagoa da Canoa','',NULL,1,2),(67,'Limoeiro de Anadia','',NULL,1,2),(68,'Macei�','',NULL,1,2),(69,'Major Isidoro','',NULL,1,2),(70,'Mar Vermelho','',NULL,1,2),(71,'Maragogi','',NULL,1,2),(72,'Maravilha','',NULL,1,2),(73,'Marechal Deodoro','',NULL,1,2),(74,'Maribondo','',NULL,1,2),(75,'Mata Grande','',NULL,1,2),(76,'Matriz de Camaragibe','',NULL,1,2),(77,'Messias','',NULL,1,2),(78,'Minador do Negr�o','',NULL,1,2),(79,'Monteir�polis','',NULL,1,2),(80,'Murici','',NULL,1,2),(81,'Novo Lino','',NULL,1,2),(82,'Olho d`�gua das Flores','',NULL,1,2),(83,'Olho d`�gua do Casado','',NULL,1,2),(84,'Olho d`�gua Grande','',NULL,1,2),(85,'Oliven�a','',NULL,1,2),(86,'Ouro Branco','',NULL,1,2),(87,'Palestina','',NULL,1,2),(88,'Palmeira dos �ndios','',NULL,1,2),(89,'P�o de A��car','',NULL,1,2),(90,'Pariconha','',NULL,1,2),(91,'Paripueira','',NULL,1,2),(92,'Passo de Camaragibe','',NULL,1,2),(93,'Paulo Jacinto','',NULL,1,2),(94,'Penedo','',NULL,1,2),(95,'Pia�abu�u','',NULL,1,2),(96,'Pilar','',NULL,1,2),(97,'Pindoba','',NULL,1,2),(98,'Piranhas','',NULL,1,2),(99,'Po�o das Trincheiras','',NULL,1,2),(100,'Porto Calvo','',NULL,1,2),(101,'Porto de Pedras','',NULL,1,2),(102,'Porto Real do Col�gio','',NULL,1,2),(103,'Quebrangulo','',NULL,1,2),(104,'Rio Largo','',NULL,1,2),(105,'Roteiro','',NULL,1,2),(106,'Santa Luzia do Norte','',NULL,1,2),(107,'Santana do Ipanema','',NULL,1,2),(108,'Santana do Munda�','',NULL,1,2),(109,'S�o Br�s','',NULL,1,2),(110,'S�o Jos� da Laje','',NULL,1,2),(111,'S�o Jos� da Tapera','',NULL,1,2),(112,'S�o Lu�s do Quitunde','',NULL,1,2),(113,'S�o Miguel dos Campos','',NULL,1,2),(114,'S�o Miguel dos Milagres','',NULL,1,2),(115,'S�o Sebasti�o','',NULL,1,2),(116,'Satuba','',NULL,1,2),(117,'Senador Rui Palmeira','',NULL,1,2),(118,'Tanque d`Arca','',NULL,1,2),(119,'Taquarana','',NULL,1,2),(120,'Teot�nio Vilela','',NULL,1,2),(121,'Traipu','',NULL,1,2),(122,'Uni�o dos Palmares','',NULL,1,2),(123,'Vi�osa','',NULL,1,2),(124,'Amap�','',NULL,1,3),(125,'Cal�oene','',NULL,1,3),(126,'Cutias','',NULL,1,3),(127,'Ferreira Gomes','',NULL,1,3),(128,'Itaubal','',NULL,1,3),(129,'Laranjal do Jari','',NULL,1,3),(130,'Macap�','',NULL,1,3),(131,'Mazag�o','',NULL,1,3),(132,'Oiapoque','',NULL,1,3),(133,'Pedra Branca do Amapar�','',NULL,1,3),(134,'Porto Grande','',NULL,1,3),(135,'Pracu�ba','',NULL,1,3),(136,'Santana','',NULL,1,3),(137,'Serra do Navio','',NULL,1,3),(138,'Tartarugalzinho','',NULL,1,3),(139,'Vit�ria do Jari','',NULL,1,3),(140,'Alvar�es','',NULL,1,4),(141,'Amatur�','',NULL,1,4),(142,'nam�','',NULL,1,4),(143,'Anori','',NULL,1,4),(144,'Apu�','',NULL,1,4),(145,'Atalaia do Norte','',NULL,1,4),(146,'Autazes','',NULL,1,4),(147,'Barcelos','',NULL,1,4),(148,'Barreirinha','',NULL,1,4),(149,'Benjamin Constant','',NULL,1,4),(150,'Beruri','',NULL,1,4),(151,'Boa Vista do Ramos','',NULL,1,4),(152,'Boca do Acre','',NULL,1,4),(153,'Borba','',NULL,1,4),(154,'Caapiranga','',NULL,1,4),(155,'Canutama','',NULL,1,4),(156,'Carauari','',NULL,1,4),(157,'Careiro','',NULL,1,4),(158,'Careiro da V�rzea','',NULL,1,4),(159,'Coari','',NULL,1,4),(160,'Codaj�s','',NULL,1,4),(161,'Eirunep�','',NULL,1,4),(162,'Envira','',NULL,1,4),(163,'Fonte Boa','',NULL,1,4),(164,'Guajar�','',NULL,1,4),(165,'Humait�','',NULL,1,4),(166,'Ipixuna','',NULL,1,4),(167,'Iranduba','',NULL,1,4),(168,'Itacoatiara','',NULL,1,4),(169,'Itamarati','',NULL,1,4),(170,'Itapiranga','',NULL,1,4),(171,'Japur�','',NULL,1,4),(172,'Juru�','',NULL,1,4),(173,'Juta�','',NULL,1,4),(174,'L�brea','',NULL,1,4),(175,'Manacapuru','',NULL,1,4),(176,'Manaquiri','',NULL,1,4),(177,'Manaus','',NULL,1,4),(178,'Manicor�','',NULL,1,4),(179,'Mara�','',NULL,1,4),(180,'Mau�s','',NULL,1,4),(181,'Nhamund�','',NULL,1,4),(182,'Nova Olinda do Norte','',NULL,1,4),(183,'Novo Air�o','',NULL,1,4),(184,'Novo Aripuan�','',NULL,1,4),(185,'Parintins','',NULL,1,4),(186,'Pauini','',NULL,1,4),(187,'Presidente Figueiredo','',NULL,1,4),(188,'Rio Preto da Eva','',NULL,1,4),(189,'Santa Isabel do Rio Negro','',NULL,1,4),(190,'Santo Ant�nio do I��','',NULL,1,4),(191,'S�o Gabriel da Cachoeira','',NULL,1,4),(192,'S�o Paulo de Oliven�a','',NULL,1,4),(193,'S�o Sebasti�o do Uatum�','',NULL,1,4),(194,'Silves','',NULL,1,4),(195,'Tabatinga','',NULL,1,4),(196,'Tapau�','',NULL,1,4),(197,'Tef�','',NULL,1,4),(198,'Tonantins','',NULL,1,4),(199,'Uarini','',NULL,1,4),(200,'Urucar�','',NULL,1,4),(201,'Urucurituba','',NULL,1,4),(202,'Aba�ra','',NULL,1,5),(203,'Abar�','',NULL,1,5),(204,'Acajutiba','',NULL,1,5),(205,'Adustina','',NULL,1,5),(206,'�gua Fria','',NULL,1,5),(207,'Aiquara','',NULL,1,5),(208,'Alagoinhas','',NULL,1,5),(209,'Alcoba�a','',NULL,1,5),(210,'Almadina','',NULL,1,5),(211,'Amargosa','',NULL,1,5),(212,'Am�lia Rodrigues','',NULL,1,5),(213,'Am�rica Dourada','',NULL,1,5),(214,'Anag�','',NULL,1,5),(215,'Andara�','',NULL,1,5),(216,'Andorinha','',NULL,1,5),(217,'Angical','',NULL,1,5),(218,'Anguera','',NULL,1,5),(219,'Antas','',NULL,1,5),(220,'Ant�nio Cardoso','',NULL,1,5),(221,'Ant�nio Gon�alves','',NULL,1,5),(222,'Apor�','',NULL,1,5),(223,'Apuarema','',NULL,1,5),(224,'Ara�as','',NULL,1,5),(225,'Aracatu','',NULL,1,5),(226,'Araci','',NULL,1,5),(227,'Aramari','',NULL,1,5),(228,'Arataca','',NULL,1,5),(229,'Aratu�pe','',NULL,1,5),(230,'Aurelino Leal','',NULL,1,5),(231,'Baian�polis','',NULL,1,5),(232,'Baixa Grande','',NULL,1,5),(233,'Banza�','',NULL,1,5),(234,'Barra','',NULL,1,5),(235,'Barra da Estiva','',NULL,1,5),(236,'Barra do Cho�a','',NULL,1,5),(237,'Barra do Mendes','',NULL,1,5),(238,'Barra do Rocha','',NULL,1,5),(239,'Barreiras','',NULL,1,5),(240,'Barro Alto','',NULL,1,5),(241,'Belmonte','',NULL,1,5),(242,'Belo Campo','',NULL,1,5),(243,'Biritinga','',NULL,1,5),(244,'Boa Nova','',NULL,1,5),(245,'Boa Vista do Tupim','',NULL,1,5),(246,'Bom Jesus da Lapa','',NULL,1,5),(247,'Bom Jesus da Serra','',NULL,1,5),(248,'Boninal','',NULL,1,5),(249,'Bonito','',NULL,1,5),(250,'Boquira','',NULL,1,5),(251,'Botupor�','',NULL,1,5),(252,'Brej�es','',NULL,1,5),(253,'Brejol�ndia','',NULL,1,5),(254,'Brotas de Maca�bas','',NULL,1,5),(255,'Brumado','',NULL,1,5),(256,'Buerarema','',NULL,1,5),(257,'Buritirama','',NULL,1,5),(258,'Caatiba','',NULL,1,5),(259,'Cabaceiras do Paragua�u','',NULL,1,5),(260,'Cachoeira','',NULL,1,5),(261,'Cacul�','',NULL,1,5),(262,'Ca�m','',NULL,1,5),(263,'Caetanos','',NULL,1,5),(264,'Caetit�','',NULL,1,5),(265,'Cafarnaum','',NULL,1,5),(266,'Cairu','',NULL,1,5),(267,'Caldeir�o Grande','',NULL,1,5),(268,'Camacan','',NULL,1,5),(269,'Cama�ari','',NULL,1,5),(270,'Camamu','',NULL,1,5),(271,'Campo Alegre de Lourdes','',NULL,1,5),(272,'Campo Formoso','',NULL,1,5),(273,'Can�polis','',NULL,1,5),(274,'Canarana','',NULL,1,5),(275,'Canavieiras','',NULL,1,5),(276,'Candeal','',NULL,1,5),(277,'Candeias','',NULL,1,5),(278,'Candiba','',NULL,1,5),(279,'C�ndido Sales','',NULL,1,5),(280,'Cansan��o','',NULL,1,5),(281,'Canudos','',NULL,1,5),(282,'Capela do Alto Alegre','',NULL,1,5),(283,'Capim Grosso','',NULL,1,5),(284,'Cara�bas','',NULL,1,5),(285,'Caravelas','',NULL,1,5),(286,'Cardeal da Silva','',NULL,1,5),(287,'Carinhanha','',NULL,1,5),(288,'Casa Nova','',NULL,1,5),(289,'Castro Alves','',NULL,1,5),(290,'Catol�ndia','',NULL,1,5),(291,'Catu','',NULL,1,5),(292,'Caturama','',NULL,1,5),(293,'Central','',NULL,1,5),(294,'Chorroch�','',NULL,1,5),(295,'C�cero Dantas','',NULL,1,5),(296,'Cip�','',NULL,1,5),(297,'Coaraci','',NULL,1,5),(298,'Cocos','',NULL,1,5),(299,'Concei��o da Feira','',NULL,1,5),(300,'Concei��o do Almeida','',NULL,1,5),(301,'Concei��o do Coit�','',NULL,1,5),(302,'Concei��o do Jacu�pe','',NULL,1,5),(303,'Conde','',NULL,1,5),(304,'Conde�ba','',NULL,1,5),(305,'Contendas do Sincor�','',NULL,1,5),(306,'Cora��o de Maria','',NULL,1,5),(307,'Cordeiros','',NULL,1,5),(308,'Coribe','',NULL,1,5),(309,'Coronel Jo�o S�','',NULL,1,5),(310,'Correntina','',NULL,1,5),(311,'Cotegipe','',NULL,1,5),(312,'Cravol�ndia','',NULL,1,5),(313,'Cris�polis','',NULL,1,5),(314,'Crist�polis','',NULL,1,5),(315,'Cruz das Almas','',NULL,1,5),(316,'Cura��','',NULL,1,5),(317,'D�rio Meira','',NULL,1,5),(318,'Dias d`�vila','',NULL,1,5),(319,'Dom Bas�lio','',NULL,1,5),(320,'Dom Macedo Costa','',NULL,1,5),(321,'El�sio Medrado','',NULL,1,5),(322,'Encruzilhada','',NULL,1,5),(323,'Entre Rios','',NULL,1,5),(324,'�rico Cardoso','',NULL,1,5),(325,'Esplanada','',NULL,1,5),(326,'Euclides da Cunha','',NULL,1,5),(327,'Eun�polis','',NULL,1,5),(328,'F�tima','',NULL,1,5),(329,'Feira da Mata','',NULL,1,5),(330,'Feira de Santana','',NULL,1,5),(331,'Filad�lfia','',NULL,1,5),(332,'Firmino Alves','',NULL,1,5),(333,'Floresta Azul','',NULL,1,5),(334,'Formosa do Rio Preto','',NULL,1,5),(335,'Gandu','',NULL,1,5),(336,'Gavi�o','',NULL,1,5),(337,'Gentio do Ouro','',NULL,1,5),(338,'Gl�ria','',NULL,1,5),(339,'Gongogi','',NULL,1,5),(340,'Governador Lomanto J�nior','',NULL,1,5),(341,'Governador Mangabeira','',NULL,1,5),(342,'Guajeru','',NULL,1,5),(343,'Guanambi','',NULL,1,5),(344,'Guaratinga','',NULL,1,5),(345,'Heli�polis','',NULL,1,5),(346,'Ia�u','',NULL,1,5),(347,'Ibiassuc�','',NULL,1,5),(348,'Ibicara�','',NULL,1,5),(349,'Ibicoara','',NULL,1,5),(350,'Ibicu�','',NULL,1,5),(351,'Ibipeba','',NULL,1,5),(352,'Ibipitanga','',NULL,1,5),(353,'Ibiquera','',NULL,1,5),(354,'Ibirapitanga','',NULL,1,5),(355,'Ibirapu�','',NULL,1,5),(356,'Ibirataia','',NULL,1,5),(357,'Ibitiara','',NULL,1,5),(358,'Ibitit�','',NULL,1,5),(359,'Ibotirama','',NULL,1,5),(360,'Ichu','',NULL,1,5),(361,'Igapor�','',NULL,1,5),(362,'Igrapi�na','',NULL,1,5),(363,'Igua�','',NULL,1,5),(364,'Ilh�us','',NULL,1,5),(365,'Inhambupe','',NULL,1,5),(366,'Ipecaet�','',NULL,1,5),(367,'Ipia�','',NULL,1,5),(368,'Ipir�','',NULL,1,5),(369,'Ipupiara','',NULL,1,5),(370,'Irajuba','',NULL,1,5),(371,'Iramaia','',NULL,1,5),(372,'Iraquara','',NULL,1,5),(373,'Irar�','',NULL,1,5),(374,'Irec�','',NULL,1,5),(375,'Itabela','',NULL,1,5),(376,'Itaberaba','',NULL,1,5),(377,'Itabuna','',NULL,1,5),(378,'Itacar�','',NULL,1,5),(379,'Itaet�','',NULL,1,5),(380,'Itagi','',NULL,1,5),(381,'Itagib�','',NULL,1,5),(382,'Itagimirim','',NULL,1,5),(383,'Itagua�u da Bahia','',NULL,1,5),(384,'Itaju do Col�nia','',NULL,1,5),(385,'Itaju�pe','',NULL,1,5),(386,'Itamaraju','',NULL,1,5),(387,'Itamari','',NULL,1,5),(388,'Itamb�','',NULL,1,5),(389,'Itanagra','',NULL,1,5),(390,'Itanh�m','',NULL,1,5),(391,'Itaparica','',NULL,1,5),(392,'Itap�','',NULL,1,5),(393,'Itapebi','',NULL,1,5),(394,'Itapetinga','',NULL,1,5),(395,'Itapicuru','',NULL,1,5),(396,'Itapitanga','',NULL,1,5),(397,'Itaquara','',NULL,1,5),(398,'Itarantim','',NULL,1,5),(399,'Itatim','',NULL,1,5),(400,'Itiru�u','',NULL,1,5),(401,'Iti�ba','',NULL,1,5),(402,'Itoror�','',NULL,1,5),(403,'Itua�u','',NULL,1,5),(404,'Ituber�','',NULL,1,5),(405,'Iui�','',NULL,1,5),(406,'Jaborandi','',NULL,1,5),(407,'Jacaraci','',NULL,1,5),(408,'Jacobina','',NULL,1,5),(409,'Jaguaquara','',NULL,1,5),(410,'Jaguarari','',NULL,1,5),(411,'Jaguaripe','',NULL,1,5),(412,'Janda�ra','',NULL,1,5),(413,'Jequi�','',NULL,1,5),(414,'Jeremoabo','',NULL,1,5),(415,'Jiquiri��','',NULL,1,5),(416,'Jita�na','',NULL,1,5),(417,'Jo�o Dourado','',NULL,1,5),(418,'Juazeiro','',NULL,1,5),(419,'Jucuru�u','',NULL,1,5),(420,'Jussara','',NULL,1,5),(421,'Jussari','',NULL,1,5),(422,'Jussiape','',NULL,1,5),(423,'Lafaiete Coutinho','',NULL,1,5),(424,'Lagoa Real','',NULL,1,5),(425,'Laje','',NULL,1,5),(426,'Lajed�o','',NULL,1,5),(427,'Lajedinho','',NULL,1,5),(428,'Lajedo do Tabocal','',NULL,1,5),(429,'Lamar�o','',NULL,1,5),(430,'Lap�o','',NULL,1,5),(431,'Lauro de Freitas','',NULL,1,5),(432,'Len��is','',NULL,1,5),(433,'Lic�nio de Almeida','',NULL,1,5),(434,'Livramento de Nossa Senhora','',NULL,1,5),(435,'Macajuba','',NULL,1,5),(436,'Macarani','',NULL,1,5),(437,'Maca�bas','',NULL,1,5),(438,'Macurur�','',NULL,1,5),(439,'Madre de Deus','',NULL,1,5),(440,'Maetinga','',NULL,1,5),(441,'Maiquinique','',NULL,1,5),(442,'Mairi','',NULL,1,5),(443,'Malhada','',NULL,1,5),(444,'Malhada de Pedras','',NULL,1,5),(445,'Manoel Vitorino','',NULL,1,5),(446,'Mansid�o','',NULL,1,5),(447,'Marac�s','',NULL,1,5),(448,'Maragogipe','',NULL,1,5),(449,'Mara�','',NULL,1,5),(450,'Marcion�lio Souza','',NULL,1,5),(451,'Mascote','',NULL,1,5),(452,'Mata de S�o Jo�o','',NULL,1,5),(453,'Matina','',NULL,1,5),(454,'Medeiros Neto','',NULL,1,5),(455,'Miguel Calmon','',NULL,1,5),(456,'Milagres','',NULL,1,5),(457,'Mirangaba','',NULL,1,5),(458,'Mirante','',NULL,1,5),(459,'Monte Santo','',NULL,1,5),(460,'Morpar�','',NULL,1,5),(461,'Morro do Chap�u','',NULL,1,5),(462,'Mortugaba','',NULL,1,5),(463,'Mucug�','',NULL,1,5),(464,'Mucuri','',NULL,1,5),(465,'Mulungu do Morro','',NULL,1,5),(466,'Mundo Novo','',NULL,1,5),(467,'Muniz Ferreira','',NULL,1,5),(468,'Muqu�m de S�o Francisco','',NULL,1,5),(469,'Muritiba','',NULL,1,5),(470,'Mutu�pe','',NULL,1,5),(471,'Nazar�','',NULL,1,5),(472,'Nilo Pe�anha','',NULL,1,5),(473,'Nordestina','',NULL,1,5),(474,'Nova Cana�','',NULL,1,5),(475,'Nova F�tima','',NULL,1,5),(476,'Nova Ibi�','',NULL,1,5),(477,'Nova Itarana','',NULL,1,5),(478,'Nova Reden��o','',NULL,1,5),(479,'Nova Soure','',NULL,1,5),(480,'Nova Vi�osa','',NULL,1,5),(481,'Novo Horizonte','',NULL,1,5),(482,'Novo Triunfo','',NULL,1,5),(483,'Olindina','',NULL,1,5),(484,'Oliveira dos Brejinhos','',NULL,1,5),(485,'Ouri�angas','',NULL,1,5),(486,'Ourol�ndia','',NULL,1,5),(487,'Palmas de Monte Alto','',NULL,1,5),(488,'Palmeiras','',NULL,1,5),(489,'Paramirim','',NULL,1,5),(490,'Paratinga','',NULL,1,5),(491,'Paripiranga','',NULL,1,5),(492,'Pau Brasil','',NULL,1,5),(493,'Paulo Afonso','',NULL,1,5),(494,'P� de Serra','',NULL,1,5),(495,'Pedr�o','',NULL,1,5),(496,'Pedro Alexandre','',NULL,1,5),(497,'Piat�','',NULL,1,5),(498,'Pil�o Arcado','',NULL,1,5),(499,'Pinda�','',NULL,1,5),(500,'Pindoba�u','',NULL,1,5),(501,'Pintadas','',NULL,1,5),(502,'Pira� do Norte','',NULL,1,5),(503,'Pirip�','',NULL,1,5),(504,'Piritiba','',NULL,1,5),(505,'Planaltino','',NULL,1,5),(506,'Planalto','',NULL,1,5),(507,'Po��es','',NULL,1,5),(508,'Pojuca','',NULL,1,5),(509,'Ponto Novo','',NULL,1,5),(510,'Porto Seguro','',NULL,1,5),(511,'Potiragu�','',NULL,1,5),(512,'Prado','',NULL,1,5),(513,'Presidente Dutra','',NULL,1,5),(514,'Presidente J�nio Quadros','',NULL,1,5),(515,'Presidente Tancredo Neves','',NULL,1,5),(516,'Queimadas','',NULL,1,5),(517,'Quijingue','',NULL,1,5),(518,'Quixabeira','',NULL,1,5),(519,'Rafael Jambeiro','',NULL,1,5),(520,'Remanso','',NULL,1,5),(521,'Retirol�ndia','',NULL,1,5),(522,'Riach�o das Neves','',NULL,1,5),(523,'Riach�o do Jacu�pe','',NULL,1,5),(524,'Riacho de Santana','',NULL,1,5),(525,'Ribeira do Amparo','',NULL,1,5),(526,'Ribeira do Pombal','',NULL,1,5),(527,'Ribeir�o do Largo','',NULL,1,5),(528,'Rio de Contas','',NULL,1,5),(529,'Rio do Ant�nio','',NULL,1,5),(530,'Rio do Pires','',NULL,1,5),(531,'Rio Real','',NULL,1,5),(532,'Rodelas','',NULL,1,5),(533,'Ruy Barbosa','',NULL,1,5),(534,'Salinas da Margarida','',NULL,1,5),(535,'Salvador','',NULL,1,5),(536,'Santa B�rbara','',NULL,1,5),(537,'Santa Br�gida','',NULL,1,5),(538,'Santa Cruz Cabr�lia','',NULL,1,5),(539,'Santa Cruz da Vit�ria','',NULL,1,5),(540,'Santa In�s','',NULL,1,5),(541,'Santa Luzia','',NULL,1,5),(542,'Santa Maria da Vit�ria','',NULL,1,5),(543,'Santa Rita de C�ssia','',NULL,1,5),(544,'Santa Teresinha','',NULL,1,5),(545,'Santaluz','',NULL,1,5),(546,'Santana','',NULL,1,5),(547,'Santan�polis','',NULL,1,5),(548,'Santo Amaro','',NULL,1,5),(549,'Santo Ant�nio de Jesus','',NULL,1,5),(550,'Santo Est�v�o','',NULL,1,5),(551,'S�o Desid�rio','',NULL,1,5),(552,'S�o Domingos','',NULL,1,5),(553,'S�o Felipe','',NULL,1,5),(554,'S�o F�lix','',NULL,1,5),(555,'S�o F�lix do Coribe','',NULL,1,5),(556,'S�o Francisco do Conde','',NULL,1,5),(557,'S�o Gabriel','',NULL,1,5),(558,'S�o Gon�alo dos Campos','',NULL,1,5),(559,'S�o Jos� da Vit�ria','',NULL,1,5),(560,'S�o Jos� do Jacu�pe','',NULL,1,5),(561,'S�o Miguel das Matas','',NULL,1,5),(562,'S�o Sebasti�o do Pass�','',NULL,1,5),(563,'Sapea�u','',NULL,1,5),(564,'S�tiro Dias','',NULL,1,5),(565,'Saubara','',NULL,1,5),(566,'Sa�de','',NULL,1,5),(567,'Seabra','',NULL,1,5),(568,'Sebasti�o Laranjeiras','',NULL,1,5),(569,'Senhor do Bonfim','',NULL,1,5),(570,'Sento S�','',NULL,1,5),(571,'Serra do Ramalho','',NULL,1,5),(572,'Serra Dourada','',NULL,1,5),(573,'Serra Preta','',NULL,1,5),(574,'Serrinha','',NULL,1,5),(575,'Serrol�ndia','',NULL,1,5),(576,'Sim�es Filho','',NULL,1,5),(577,'S�tio do Mato','',NULL,1,5),(578,'S�tio do Quinto','',NULL,1,5),(579,'Sobradinho','',NULL,1,5),(580,'Souto Soares','',NULL,1,5),(581,'Tabocas do Brejo Velho','',NULL,1,5),(582,'Tanha�u','',NULL,1,5),(583,'Tanque Novo','',NULL,1,5),(584,'Tanquinho','',NULL,1,5),(585,'Tapero�','',NULL,1,5),(586,'Tapiramut�','',NULL,1,5),(587,'Teixeira de Freitas','',NULL,1,5),(588,'Teodoro Sampaio','',NULL,1,5),(589,'Teofil�ndia','',NULL,1,5),(590,'Teol�ndia','',NULL,1,5),(591,'Terra Nova','',NULL,1,5),(592,'Tremedal','',NULL,1,5),(593,'Tucano','',NULL,1,5),(594,'Uau�','',NULL,1,5),(595,'Uba�ra','',NULL,1,5),(596,'Ubaitaba','',NULL,1,5),(597,'Ubat�','',NULL,1,5),(598,'Uiba�','',NULL,1,5),(599,'Umburanas','',NULL,1,5),(600,'Una','',NULL,1,5),(601,'Urandi','',NULL,1,5),(602,'Uru�uca','',NULL,1,5),(603,'Utinga','',NULL,1,5),(604,'Valen�a','',NULL,1,5),(605,'Valente','',NULL,1,5),(606,'V�rzea da Ro�a','',NULL,1,5),(607,'V�rzea do Po�o','',NULL,1,5),(608,'V�rzea Nova','',NULL,1,5),(609,'Varzedo','',NULL,1,5),(610,'Vera Cruz','',NULL,1,5),(611,'Vereda','',NULL,1,5),(612,'Vit�ria da Conquista','',NULL,1,5),(613,'Wagner','',NULL,1,5),(614,'Wanderley','',NULL,1,5),(615,'Wenceslau Guimar�es','',NULL,1,5),(616,'Xique-Xique','',NULL,1,5),(617,'Abaiara','',NULL,1,6),(618,'Acarap�','',NULL,1,6),(619,'Acara�','',NULL,1,6),(620,'Acopiara','',NULL,1,6),(621,'Aiuaba','',NULL,1,6),(622,'Alc�ntaras','',NULL,1,6),(623,'Altaneira','',NULL,1,6),(624,'Alto Santo','',NULL,1,6),(625,'Amontada','',NULL,1,6),(626,'Antonina do Norte','',NULL,1,6),(627,'Apuiar�s','',NULL,1,6),(628,'Aquiraz','',NULL,1,6),(629,'Aracati','',NULL,1,6),(630,'Aracoiaba','',NULL,1,6),(631,'Ararend�','',NULL,1,6),(632,'Araripe','',NULL,1,6),(633,'Aratuba','',NULL,1,6),(634,'Arneiroz','',NULL,1,6),(635,'Assar�','',NULL,1,6),(636,'Aurora','',NULL,1,6),(637,'Baixio','',NULL,1,6),(638,'Banabui�','',NULL,1,6),(639,'Barbalha','',NULL,1,6),(640,'Barreira','',NULL,1,6),(641,'Barro','',NULL,1,6),(642,'Barroquinha','',NULL,1,6),(643,'Baturit�','',NULL,1,6),(644,'Beberibe','',NULL,1,6),(645,'Bela Cruz','',NULL,1,6),(646,'Boa Viagem','',NULL,1,6),(647,'Brejo Santo','',NULL,1,6),(648,'Camocim','',NULL,1,6),(649,'Campos Sales','',NULL,1,6),(650,'Canind�','',NULL,1,6),(651,'Capistrano','',NULL,1,6),(652,'Caridade','',NULL,1,6),(653,'Carir�','',NULL,1,6),(654,'Cariria�u','',NULL,1,6),(655,'Cari�s','',NULL,1,6),(656,'Carnaubal','',NULL,1,6),(657,'Cascavel','',NULL,1,6),(658,'Catarina','',NULL,1,6),(659,'Catunda','',NULL,1,6),(660,'Caucaia','',NULL,1,6),(661,'Cedro','',NULL,1,6),(662,'Chaval','',NULL,1,6),(663,'Chor�','',NULL,1,6),(664,'Chorozinho','',NULL,1,6),(665,'Corea�','',NULL,1,6),(666,'Crate�s','',NULL,1,6),(667,'Crato','',NULL,1,6),(668,'Croat�','',NULL,1,6),(669,'Cruz','',NULL,1,6),(670,'Deputado Irapuan Pinheiro','',NULL,1,6),(671,'Erer�','',NULL,1,6),(672,'Eus�bio','',NULL,1,6),(673,'Farias Brito','',NULL,1,6),(674,'Forquilha','',NULL,1,6),(675,'Fortaleza','',NULL,1,6),(676,'Fortim','',NULL,1,6),(677,'Frecheirinha','',NULL,1,6),(678,'General Sampaio','',NULL,1,6),(679,'Gra�a','',NULL,1,6),(680,'Granja','',NULL,1,6),(681,'Granjeiro','',NULL,1,6),(682,'Groa�ras','',NULL,1,6),(683,'Guai�ba','',NULL,1,6),(684,'Guaraciaba do Norte','',NULL,1,6),(685,'Guaramiranga','',NULL,1,6),(686,'Hidrol�ndia','',NULL,1,6),(687,'Horizonte','',NULL,1,6),(688,'Ibaretama','',NULL,1,6),(689,'Ibiapina','',NULL,1,6),(690,'Ibicuitinga','',NULL,1,6),(691,'Icapu�','',NULL,1,6),(692,'Ic�','',NULL,1,6),(693,'Iguatu','',NULL,1,6),(694,'Independ�ncia','',NULL,1,6),(695,'Ipaporanga','',NULL,1,6),(696,'Ipaumirim','',NULL,1,6),(697,'Ipu','',NULL,1,6),(698,'Ipueiras','',NULL,1,6),(699,'Iracema','',NULL,1,6),(700,'Irau�uba','',NULL,1,6),(701,'Itai�aba','',NULL,1,6),(702,'Itaitinga','',NULL,1,6),(703,'Itapag�','',NULL,1,6),(704,'Itapipoca','',NULL,1,6),(705,'Itapi�na','',NULL,1,6),(706,'Itarema','',NULL,1,6),(707,'Itatira','',NULL,1,6),(708,'Jaguaretama','',NULL,1,6),(709,'Jaguaribara','',NULL,1,6),(710,'Jaguaribe','',NULL,1,6),(711,'Jaguaruana','',NULL,1,6),(712,'Jardim','',NULL,1,6),(713,'Jati','',NULL,1,6),(714,'Jijoca de Jericoacoara','',NULL,1,6),(715,'Juazeiro do Norte','',NULL,1,6),(716,'Juc�s','',NULL,1,6),(717,'Lavras da Mangabeira','',NULL,1,6),(718,'Limoeiro do Norte','',NULL,1,6),(719,'Madalena','',NULL,1,6),(720,'Maracana�','',NULL,1,6),(721,'Maranguape','',NULL,1,6),(722,'Marco','',NULL,1,6),(723,'Martin�pole','',NULL,1,6),(724,'Massap�','',NULL,1,6),(725,'Mauriti','',NULL,1,6),(726,'Meruoca','',NULL,1,6),(727,'Milagres','',NULL,1,6),(728,'Milh�','',NULL,1,6),(729,'Mira�ma','',NULL,1,6),(730,'Miss�o Velha','',NULL,1,6),(731,'Momba�a','',NULL,1,6),(732,'Monsenhor Tabosa','',NULL,1,6),(733,'Morada Nova','',NULL,1,6),(734,'Mora�jo','',NULL,1,6),(735,'Morrinhos','',NULL,1,6),(736,'Mucambo','',NULL,1,6),(737,'Mulungu','',NULL,1,6),(738,'Nova Olinda','',NULL,1,6),(739,'Nova Russas','',NULL,1,6),(740,'Novo Oriente','',NULL,1,6),(741,'Ocara','',NULL,1,6),(742,'Or�s','',NULL,1,6),(743,'Pacajus','',NULL,1,6),(744,'Pacatuba','',NULL,1,6),(745,'Pacoti','',NULL,1,6),(746,'Pacuj�','',NULL,1,6),(747,'Palhano','',NULL,1,6),(748,'Palm�cia','',NULL,1,6),(749,'Paracuru','',NULL,1,6),(750,'Paraipaba','',NULL,1,6),(751,'Parambu','',NULL,1,6),(752,'Paramoti','',NULL,1,6),(753,'Pedra Branca','',NULL,1,6),(754,'Penaforte','',NULL,1,6),(755,'Pentecoste','',NULL,1,6),(756,'Pereiro','',NULL,1,6),(757,'Pindoretama','',NULL,1,6),(758,'Piquet Carneiro','',NULL,1,6),(759,'Pires Ferreira','',NULL,1,6),(760,'Poranga','',NULL,1,6),(761,'Porteiras','',NULL,1,6),(762,'Potengi','',NULL,1,6),(763,'Potiretama','',NULL,1,6),(764,'Quiterian�polis','',NULL,1,6),(765,'Quixad�','',NULL,1,6),(766,'Quixel�','',NULL,1,6),(767,'Quixeramobim','',NULL,1,6),(768,'Quixer�','',NULL,1,6),(769,'Reden��o','',NULL,1,6),(770,'Reriutaba','',NULL,1,6),(771,'Russas','',NULL,1,6),(772,'Saboeiro','',NULL,1,6),(773,'Salitre','',NULL,1,6),(774,'Santa Quit�ria','',NULL,1,6),(775,'Santana do Acara�','',NULL,1,6),(776,'Santana do Cariri','',NULL,1,6),(777,'S�o Benedito','',NULL,1,6),(778,'S�o Gon�alo do Amarante','',NULL,1,6),(779,'S�o Jo�o do Jaguaribe','',NULL,1,6),(780,'S�o Lu�s do Curu','',NULL,1,6),(781,'Senador Pompeu','',NULL,1,6),(782,'Senador S�','',NULL,1,6),(783,'Sobral','',NULL,1,6),(784,'Solon�pole','',NULL,1,6),(785,'Tabuleiro do Norte','',NULL,1,6),(786,'Tamboril','',NULL,1,6),(787,'Tarrafas','',NULL,1,6),(788,'Tau�','',NULL,1,6),(789,'Teju�uoca','',NULL,1,6),(790,'Tiangu�','',NULL,1,6),(791,'Trairi','',NULL,1,6),(792,'Tururu','',NULL,1,6),(793,'Ubajara','',NULL,1,6),(794,'Umari','',NULL,1,6),(795,'Umirim','',NULL,1,6),(796,'Uruburetama','',NULL,1,6),(797,'Uruoca','',NULL,1,6),(798,'Varjota','',NULL,1,6),(799,'V�rzea Alegre','',NULL,1,6),(800,'Vi�osa do Cear�','',NULL,1,6),(801,'Bras�lia','',NULL,1,7),(802,'Afonso Cl�udio','',NULL,1,8),(803,'�gua Doce do Norte','',NULL,1,8),(804,'�guia Branca','',NULL,1,8),(805,'Alegre','',NULL,1,8),(806,'Alfredo Chaves','',NULL,1,8),(807,'Alto Rio Novo','',NULL,1,8),(808,'Anchieta','',NULL,1,8),(809,'Apiac�','',NULL,1,8),(810,'Aracruz','',NULL,1,8),(811,'Atilio Vivacqua','',NULL,1,8),(812,'Baixo Guandu','',NULL,1,8),(813,'Barra de S�o Francisco','',NULL,1,8),(814,'Boa Esperan�a','',NULL,1,8),(815,'Bom Jesus do Norte','',NULL,1,8),(816,'Brejetuba','',NULL,1,8),(817,'Cachoeiro de Itapemirim','',NULL,1,8),(818,'Cariacica','',NULL,1,8),(819,'Castelo','',NULL,1,8),(820,'Colatina','',NULL,1,8),(821,'Concei��o da Barra','',NULL,1,8),(822,'Concei��o do Castelo','',NULL,1,8),(823,'Divino de S�o Louren�o','',NULL,1,8),(824,'Domingos Martins','',NULL,1,8),(825,'Dores do Rio Preto','',NULL,1,8),(826,'Ecoporanga','',NULL,1,8),(827,'Fund�o','',NULL,1,8),(828,'Gua�u�','',NULL,1,8),(829,'Guarapari','',NULL,1,8),(830,'Ibatiba','',NULL,1,8),(831,'Ibira�u','',NULL,1,8),(832,'Ibitirama','',NULL,1,8),(833,'Iconha','',NULL,1,8),(834,'Irupi','',NULL,1,8),(835,'Itagua�u','',NULL,1,8),(836,'Itapemirim','',NULL,1,8),(837,'Itarana','',NULL,1,8),(838,'I�na','',NULL,1,8),(839,'Jaguar�','',NULL,1,8),(840,'Jer�nimo Monteiro','',NULL,1,8),(841,'Jo�o Neiva','',NULL,1,8),(842,'Laranja da Terra','',NULL,1,8),(843,'Linhares','',NULL,1,8),(844,'Manten�polis','',NULL,1,8),(845,'Marata�zes','',NULL,1,8),(846,'Marechal Floriano','',NULL,1,8),(847,'Maril�ndia','',NULL,1,8),(848,'Mimoso do Sul','',NULL,1,8),(849,'Montanha','',NULL,1,8),(850,'Mucurici','',NULL,1,8),(851,'Muniz Freire','',NULL,1,8),(852,'Muqui','',NULL,1,8),(853,'Nova Ven�cia','',NULL,1,8),(854,'Pancas','',NULL,1,8),(855,'Pedro Can�rio','',NULL,1,8),(856,'Pinheiros','',NULL,1,8),(857,'Pi�ma','',NULL,1,8),(858,'Ponto Belo','',NULL,1,8),(859,'Presidente Kennedy','',NULL,1,8),(860,'Rio Bananal','',NULL,1,8),(861,'Rio Novo do Sul','',NULL,1,8),(862,'Santa Leopoldina','',NULL,1,8),(863,'Santa Maria de Jetib�','',NULL,1,8),(864,'Santa Teresa','',NULL,1,8),(865,'S�o Domingos do Norte','',NULL,1,8),(866,'S�o Gabriel da Palha','',NULL,1,8),(867,'S�o Jos� do Cal�ado','',NULL,1,8),(868,'S�o Mateus','',NULL,1,8),(869,'S�o Roque do Cana�','',NULL,1,8),(870,'Serra','',NULL,1,8),(871,'Sooretama','',NULL,1,8),(872,'Vargem Alta','',NULL,1,8),(873,'Venda Nova do Imigrante','',NULL,1,8),(874,'Viana','',NULL,1,8),(875,'Vila Pav�o','',NULL,1,8),(876,'Vila Val�rio','',NULL,1,8),(877,'Vila Velha','',NULL,1,8),(878,'Vit�ria','',NULL,1,8),(879,'Abadia de Goi�s','',NULL,1,9),(880,'Abadi�nia','',NULL,1,9),(881,'Acre�na','',NULL,1,9),(882,'Adel�ndia','',NULL,1,9),(883,'�gua Fria de Goi�s','',NULL,1,9),(884,'�gua Limpa','',NULL,1,9),(885,'�guas Lindas de Goi�s','',NULL,1,9),(886,'Alex�nia','',NULL,1,9),(887,'Alo�ndia','',NULL,1,9),(888,'Alto Horizonte','',NULL,1,9),(889,'Alto Para�so de Goi�s','',NULL,1,9),(890,'Alvorada do Norte','',NULL,1,9),(891,'Amaralina','',NULL,1,9),(892,'Americano do Brasil','',NULL,1,9),(893,'Amorin�polis','',NULL,1,9),(894,'An�polis','',NULL,1,9),(895,'Anhanguera','',NULL,1,9),(896,'Anicuns','',NULL,1,9),(897,'Aparecida de Goi�nia','',NULL,1,9),(898,'Aparecida do Rio Doce','',NULL,1,9),(899,'Apor�','',NULL,1,9),(900,'Ara�u','',NULL,1,9),(901,'Aragar�as','',NULL,1,9),(902,'Aragoi�nia','',NULL,1,9),(903,'Araguapaz','',NULL,1,9),(904,'Aren�polis','',NULL,1,9),(905,'Aruan�','',NULL,1,9),(906,'Auril�ndia','',NULL,1,9),(907,'Avelin�polis','',NULL,1,9),(908,'Baliza','',NULL,1,9),(909,'Barro Alto','',NULL,1,9),(910,'Bela Vista de Goi�s','',NULL,1,9),(911,'Bom Jardim de Goi�s','',NULL,1,9),(912,'Bom Jesus de Goi�s','',NULL,1,9),(913,'Bonfin�polis','',NULL,1,9),(914,'Bon�polis','',NULL,1,9),(915,'Brazabrantes','',NULL,1,9),(916,'Brit�nia','',NULL,1,9),(917,'Buriti Alegre','',NULL,1,9),(918,'Buriti de Goi�s','',NULL,1,9),(919,'Buritin�polis','',NULL,1,9),(920,'Cabeceiras','',NULL,1,9),(921,'Cachoeira Alta','',NULL,1,9),(922,'Cachoeira de Goi�s','',NULL,1,9),(923,'Cachoeira Dourada','',NULL,1,9),(924,'Ca�u','',NULL,1,9),(925,'Caiap�nia','',NULL,1,9),(926,'Caldas Novas','',NULL,1,9),(927,'Caldazinha','',NULL,1,9),(928,'Campestre de Goi�s','',NULL,1,9),(929,'Campina�u','',NULL,1,9),(930,'Campinorte','',NULL,1,9),(931,'Campo Alegre de Goi�s','',NULL,1,9),(932,'Campos Belos','',NULL,1,9),(933,'Campos Verdes','',NULL,1,9),(934,'Carmo do Rio Verde','',NULL,1,9),(935,'Castel�ndia','',NULL,1,9),(936,'Catal�o','',NULL,1,9),(937,'Catura�','',NULL,1,9),(938,'Cavalcante','',NULL,1,9),(939,'Ceres','',NULL,1,9),(940,'Cezarina','',NULL,1,9),(941,'Chapad�o do C�u','',NULL,1,9),(942,'Cidade Ocidental','',NULL,1,9),(943,'Cocalzinho de Goi�s','',NULL,1,9),(944,'Colinas do Sul','',NULL,1,9),(945,'C�rrego do Ouro','',NULL,1,9),(946,'Corumb� de Goi�s','',NULL,1,9),(947,'Corumba�ba','',NULL,1,9),(948,'Cristalina','',NULL,1,9),(949,'Cristian�polis','',NULL,1,9),(950,'Crix�s','',NULL,1,9),(951,'Crom�nia','',NULL,1,9),(952,'Cumari','',NULL,1,9),(953,'Damian�polis','',NULL,1,9),(954,'Damol�ndia','',NULL,1,9),(955,'Davin�polis','',NULL,1,9),(956,'Diorama','',NULL,1,9),(957,'Divin�polis de Goi�s','',NULL,1,9),(958,'Doverl�ndia','',NULL,1,9),(959,'Edealina','',NULL,1,9),(960,'Ed�ia','',NULL,1,9),(961,'Estrela do Norte','',NULL,1,9),(962,'Faina','',NULL,1,9),(963,'Fazenda Nova','',NULL,1,9),(964,'Firmin�polis','',NULL,1,9),(965,'Flores de Goi�s','',NULL,1,9),(966,'Formosa','',NULL,1,9),(967,'Formoso','',NULL,1,9),(968,'Goian�polis','',NULL,1,9),(969,'Goiandira','',NULL,1,9),(970,'Goian�sia','',NULL,1,9),(971,'Goi�nia','',NULL,1,9),(972,'Goianira','',NULL,1,9),(973,'Goi�s','',NULL,1,9),(974,'Goiatuba','',NULL,1,9),(975,'Gouvel�ndia','',NULL,1,9),(976,'Guap�','',NULL,1,9),(977,'Guara�ta','',NULL,1,9),(978,'Guarani de Goi�s','',NULL,1,9),(979,'Guarinos','',NULL,1,9),(980,'Heitora�','',NULL,1,9),(981,'Hidrol�ndia','',NULL,1,9),(982,'Hidrolina','',NULL,1,9),(983,'Iaciara','',NULL,1,9),(984,'Inaciol�ndia','',NULL,1,9),(985,'Indiara','',NULL,1,9),(986,'Inhumas','',NULL,1,9),(987,'Ipameri','',NULL,1,9),(988,'Ipor�','',NULL,1,9),(989,'Israel�ndia','',NULL,1,9),(990,'Itabera�','',NULL,1,9),(991,'Itaguari','',NULL,1,9),(992,'Itaguaru','',NULL,1,9),(993,'Itaj�','',NULL,1,9),(994,'Itapaci','',NULL,1,9),(995,'Itapirapu�','',NULL,1,9),(996,'Itapuranga','',NULL,1,9),(997,'Itarum�','',NULL,1,9),(998,'Itau�u','',NULL,1,9),(999,'Itumbiara','',NULL,1,9),(1000,'Ivol�ndia','',NULL,1,9),(1001,'Jandaia','',NULL,1,9),(1002,'Jaragu�','',NULL,1,9),(1003,'Jata�','',NULL,1,9),(1004,'Jaupaci','',NULL,1,9),(1005,'Jes�polis','',NULL,1,9),(1006,'Jovi�nia','',NULL,1,9),(1007,'Jussara','',NULL,1,9),(1008,'Leopoldo de Bulh�es','',NULL,1,9),(1009,'Luzi�nia','',NULL,1,9),(1010,'Mairipotaba','',NULL,1,9),(1011,'Mamba�','',NULL,1,9),(1012,'Mara Rosa','',NULL,1,9),(1013,'Marzag�o','',NULL,1,9),(1014,'Matrinch�','',NULL,1,9),(1015,'Mauril�ndia','',NULL,1,9),(1016,'Mimoso de Goi�s','',NULL,1,9),(1017,'Mina�u','',NULL,1,9),(1018,'Mineiros','',NULL,1,9),(1019,'Moipor�','',NULL,1,9),(1020,'Monte Alegre de Goi�s','',NULL,1,9),(1021,'Montes Claros de Goi�s','',NULL,1,9),(1022,'Montividiu','',NULL,1,9),(1023,'Montividiu do Norte','',NULL,1,9),(1024,'Morrinhos','',NULL,1,9),(1025,'Morro Agudo de Goi�s','',NULL,1,9),(1026,'Moss�medes','',NULL,1,9),(1027,'Mozarl�ndia','',NULL,1,9),(1028,'Mundo Novo','',NULL,1,9),(1029,'Mutun�polis','',NULL,1,9),(1030,'Naz�rio','',NULL,1,9),(1031,'Ner�polis','',NULL,1,9),(1032,'Niquel�ndia','',NULL,1,9),(1033,'Nova Am�rica','',NULL,1,9),(1034,'Nova Aurora','',NULL,1,9),(1035,'Nova Crix�s','',NULL,1,9),(1036,'Nova Gl�ria','',NULL,1,9),(1037,'Nova Igua�u de Goi�s','',NULL,1,9),(1038,'Nova Roma','',NULL,1,9),(1039,'Nova Veneza','',NULL,1,9),(1040,'Novo Brasil','',NULL,1,9),(1041,'Novo Gama','',NULL,1,9),(1042,'Novo Planalto','',NULL,1,9),(1043,'Orizona','',NULL,1,9),(1044,'Ouro Verde de Goi�s','',NULL,1,9),(1045,'Ouvidor','',NULL,1,9),(1046,'Padre Bernardo','',NULL,1,9),(1047,'Palestina de Goi�s','',NULL,1,9),(1048,'Palmeiras de Goi�s','',NULL,1,9),(1049,'Palmelo','',NULL,1,9),(1050,'Palmin�polis','',NULL,1,9),(1051,'Panam�','',NULL,1,9),(1052,'Paranaiguara','',NULL,1,9),(1053,'Para�na','',NULL,1,9),(1054,'Perol�ndia','',NULL,1,9),(1055,'Petrolina de Goi�s','',NULL,1,9),(1056,'Pilar de Goi�s','',NULL,1,9),(1057,'Piracanjuba','',NULL,1,9),(1058,'Piranhas','',NULL,1,9),(1059,'Piren�polis','',NULL,1,9),(1060,'Pires do Rio','',NULL,1,9),(1061,'Planaltina','',NULL,1,9),(1062,'Pontalina','',NULL,1,9),(1063,'Porangatu','',NULL,1,9),(1064,'Porteir�o','',NULL,1,9),(1065,'Portel�ndia','',NULL,1,9),(1066,'Posse','',NULL,1,9),(1067,'Professor Jamil','',NULL,1,9),(1068,'Quirin�polis','',NULL,1,9),(1069,'Rialma','',NULL,1,9),(1070,'Rian�polis','',NULL,1,9),(1071,'Rio Quente','',NULL,1,9),(1072,'Rio Verde','',NULL,1,9),(1073,'Rubiataba','',NULL,1,9),(1074,'Sanclerl�ndia','',NULL,1,9),(1075,'Santa B�rbara de Goi�s','',NULL,1,9),(1076,'Santa Cruz de Goi�s','',NULL,1,9),(1077,'Santa F� de Goi�s','',NULL,1,9),(1078,'Santa Helena de Goi�s','',NULL,1,9),(1079,'Santa Isabel','',NULL,1,9),(1080,'Santa Rita do Araguaia','',NULL,1,9),(1081,'Santa Rita do Novo Destino','',NULL,1,9),(1082,'Santa Rosa de Goi�s','',NULL,1,9),(1083,'Santa Tereza de Goi�s','',NULL,1,9),(1084,'Santa Terezinha de Goi�s','',NULL,1,9),(1085,'Santo Ant�nio da Barra','',NULL,1,9),(1086,'Santo Ant�nio de Goi�s','',NULL,1,9),(1087,'Santo Ant�nio do Descoberto','',NULL,1,9),(1088,'S�o Domingos','',NULL,1,9),(1089,'S�o Francisco de Goi�s','',NULL,1,9),(1090,'S�o Jo�o d`Alian�a','',NULL,1,9),(1091,'S�o Jo�o da Para�na','',NULL,1,9),(1092,'S�o Lu�s de Montes Belos','',NULL,1,9),(1093,'S�o Lu�z do Norte','',NULL,1,9),(1094,'S�o Miguel do Araguaia','',NULL,1,9),(1095,'S�o Miguel do Passa Quatro','',NULL,1,9),(1096,'S�o Patr�cio','',NULL,1,9),(1097,'S�o Sim�o','',NULL,1,9),(1098,'Senador Canedo','',NULL,1,9),(1099,'Serran�polis','',NULL,1,9),(1100,'Silv�nia','',NULL,1,9),(1101,'Simol�ndia','',NULL,1,9),(1102,'S�tio d`Abadia','',NULL,1,9),(1103,'Taquaral de Goi�s','',NULL,1,9),(1104,'Teresina de Goi�s','',NULL,1,9),(1105,'Terez�polis de Goi�s','',NULL,1,9),(1106,'Tr�s Ranchos','',NULL,1,9),(1107,'Trindade','',NULL,1,9),(1108,'Trombas','',NULL,1,9),(1109,'Turv�nia','',NULL,1,9),(1110,'Turvel�ndia','',NULL,1,9),(1111,'Uirapuru','',NULL,1,9),(1112,'Urua�u','',NULL,1,9),(1113,'Uruana','',NULL,1,9),(1114,'Uruta�','',NULL,1,9),(1115,'Valpara�so de Goi�s','',NULL,1,9),(1116,'Varj�o','',NULL,1,9),(1117,'Vian�polis','',NULL,1,9),(1118,'Vicentin�polis','',NULL,1,9),(1119,'Vila Boa','',NULL,1,9),(1120,'Vila Prop�cio','',NULL,1,9),(1121,'A�ail�ndia','',NULL,1,10),(1122,'Afonso Cunha','',NULL,1,10),(1123,'�gua Doce do Maranh�o','',NULL,1,10),(1124,'Alc�ntara','',NULL,1,10),(1125,'Aldeias Altas','',NULL,1,10),(1126,'Altamira do Maranh�o','',NULL,1,10),(1127,'Alto Alegre do Maranh�o','',NULL,1,10),(1128,'Alto Alegre do Pindar�','',NULL,1,10),(1129,'Alto Parna�ba','',NULL,1,10),(1130,'Amap� do Maranh�o','',NULL,1,10),(1131,'Amarante do Maranh�o','',NULL,1,10),(1132,'Anajatuba','',NULL,1,10),(1133,'Anapurus','',NULL,1,10),(1134,'Apicum-A�u','',NULL,1,10),(1135,'Araguan�','',NULL,1,10),(1136,'Araioses','',NULL,1,10),(1137,'Arame','',NULL,1,10),(1138,'Arari','',NULL,1,10),(1139,'Axix�','',NULL,1,10),(1140,'Bacabal','',NULL,1,10),(1141,'Bacabeira','',NULL,1,10),(1142,'Bacuri','',NULL,1,10),(1143,'Bacurituba','',NULL,1,10),(1144,'Balsas','',NULL,1,10),(1145,'Bar�o de Graja�','',NULL,1,10),(1146,'Barra do Corda','',NULL,1,10),(1147,'Barreirinhas','',NULL,1,10),(1148,'Bela Vista do Maranh�o','',NULL,1,10),(1149,'Bel�gua','',NULL,1,10),(1150,'Benedito Leite','',NULL,1,10),(1151,'Bequim�o','',NULL,1,10),(1152,'Bernardo do Mearim','',NULL,1,10),(1153,'Boa Vista do Gurupi','',NULL,1,10),(1154,'Bom Jardim','',NULL,1,10),(1155,'Bom Jesus das Selvas','',NULL,1,10),(1156,'Bom Lugar','',NULL,1,10),(1157,'Brejo','',NULL,1,10),(1158,'Brejo de Areia','',NULL,1,10),(1159,'Buriti','',NULL,1,10),(1160,'Buriti Bravo','',NULL,1,10),(1161,'Buriticupu','',NULL,1,10),(1162,'Buritirana','',NULL,1,10),(1163,'Cachoeira Grande','',NULL,1,10),(1164,'Cajapi�','',NULL,1,10),(1165,'Cajari','',NULL,1,10),(1166,'Campestre do Maranh�o','',NULL,1,10),(1167,'C�ndido Mendes','',NULL,1,10),(1168,'Cantanhede','',NULL,1,10),(1169,'Capinzal do Norte','',NULL,1,10),(1170,'Carolina','',NULL,1,10),(1171,'Carutapera','',NULL,1,10),(1172,'Caxias','',NULL,1,10),(1173,'Cedral','',NULL,1,10),(1174,'Central do Maranh�o','',NULL,1,10),(1175,'Centro do Guilherme','',NULL,1,10),(1176,'Centro Novo do Maranh�o','',NULL,1,10),(1177,'Chapadinha','',NULL,1,10),(1178,'Cidel�ndia','',NULL,1,10),(1179,'Cod�','',NULL,1,10),(1180,'Coelho Neto','',NULL,1,10),(1181,'Colinas','',NULL,1,10),(1182,'Concei��o do Lago-A�u','',NULL,1,10),(1183,'Coroat�','',NULL,1,10),(1184,'Cururupu','',NULL,1,10),(1185,'Davin�polis','',NULL,1,10),(1186,'Dom Pedro','',NULL,1,10),(1187,'Duque Bacelar','',NULL,1,10),(1188,'Esperantin�polis','',NULL,1,10),(1189,'Estreito','',NULL,1,10),(1190,'Feira Nova do Maranh�o','',NULL,1,10),(1191,'Fernando Falc�o','',NULL,1,10),(1192,'Formosa da Serra Negra','',NULL,1,10),(1193,'Fortaleza dos Nogueiras','',NULL,1,10),(1194,'Fortuna','',NULL,1,10),(1195,'Godofredo Viana','',NULL,1,10),(1196,'Gon�alves Dias','',NULL,1,10),(1197,'Governador Archer','',NULL,1,10),(1198,'Governador Edison Lob�o','',NULL,1,10),(1199,'Governador Eug�nio Barros','',NULL,1,10),(1200,'Governador Luiz Rocha','',NULL,1,10),(1201,'Governador Newton Bello','',NULL,1,10),(1202,'Governador Nunes Freire','',NULL,1,10),(1203,'Gra�a Aranha','',NULL,1,10),(1204,'Graja�','',NULL,1,10),(1205,'Guimar�es','',NULL,1,10),(1206,'Humberto de Campos','',NULL,1,10),(1207,'Icatu','',NULL,1,10),(1208,'Igarap� do Meio','',NULL,1,10),(1209,'Igarap� Grande','',NULL,1,10),(1210,'Imperatriz','',NULL,1,10),(1211,'Itaipava do Graja�','',NULL,1,10),(1212,'Itapecuru Mirim','',NULL,1,10),(1213,'Itinga do Maranh�o','',NULL,1,10),(1214,'Jatob�','',NULL,1,10),(1215,'Jenipapo dos Vieiras','',NULL,1,10),(1216,'Jo�o Lisboa','',NULL,1,10),(1217,'Josel�ndia','',NULL,1,10),(1218,'Junco do Maranh�o','',NULL,1,10),(1219,'Lago da Pedra','',NULL,1,10),(1220,'Lago do Junco','',NULL,1,10),(1221,'Lago dos Rodrigues','',NULL,1,10),(1222,'Lago Verde','',NULL,1,10),(1223,'Lagoa do Mato','',NULL,1,10),(1224,'Lagoa Grande do Maranh�o','',NULL,1,10),(1225,'Lajeado Novo','',NULL,1,10),(1226,'Lima Campos','',NULL,1,10),(1227,'Loreto','',NULL,1,10),(1228,'Lu�s Domingues','',NULL,1,10),(1229,'Magalh�es de Almeida','',NULL,1,10),(1230,'Maraca�um�','',NULL,1,10),(1231,'Maraj� do Sena','',NULL,1,10),(1232,'Maranh�ozinho','',NULL,1,10),(1233,'Mata Roma','',NULL,1,10),(1234,'Matinha','',NULL,1,10),(1235,'Mat�es','',NULL,1,10),(1236,'Mat�es do Norte','',NULL,1,10),(1237,'Milagres do Maranh�o','',NULL,1,10),(1238,'Mirador','',NULL,1,10),(1239,'Miranda do Norte','',NULL,1,10),(1240,'Mirinzal','',NULL,1,10),(1241,'Mon��o','',NULL,1,10),(1242,'Montes Altos','',NULL,1,10),(1243,'Morros','',NULL,1,10),(1244,'Nina Rodrigues','',NULL,1,10),(1245,'Nova Colinas','',NULL,1,10),(1246,'Nova Iorque','',NULL,1,10),(1247,'Nova Olinda do Maranh�o','',NULL,1,10),(1248,'Olho d`�gua das Cunh�s','',NULL,1,10),(1249,'Olinda Nova do Maranh�o','',NULL,1,10),(1250,'Pa�o do Lumiar','',NULL,1,10),(1251,'Palmeir�ndia','',NULL,1,10),(1252,'Paraibano','',NULL,1,10),(1253,'Parnarama','',NULL,1,10),(1254,'Passagem Franca','',NULL,1,10),(1255,'Pastos Bons','',NULL,1,10),(1256,'Paulino Neves','',NULL,1,10),(1257,'Paulo Ramos','',NULL,1,10),(1258,'Pedreiras','',NULL,1,10),(1259,'Pedro do Ros�rio','',NULL,1,10),(1260,'Penalva','',NULL,1,10),(1261,'Peri Mirim','',NULL,1,10),(1262,'Peritor�','',NULL,1,10),(1263,'Pindar�-Mirim','',NULL,1,10),(1264,'Pinheiro','',NULL,1,10),(1265,'Pio XII','',NULL,1,10),(1266,'Pirapemas','',NULL,1,10),(1267,'Po��o de Pedras','',NULL,1,10),(1268,'Porto Franco','',NULL,1,10),(1269,'Porto Rico do Maranh�o','',NULL,1,10),(1270,'Presidente Dutra','',NULL,1,10),(1271,'Presidente Juscelino','',NULL,1,10),(1272,'Presidente M�dici','',NULL,1,10),(1273,'Presidente Sarney','',NULL,1,10),(1274,'Presidente Vargas','',NULL,1,10),(1275,'Primeira Cruz','',NULL,1,10),(1276,'Raposa','',NULL,1,10),(1277,'Riach�o','',NULL,1,10),(1278,'Ribamar Fiquene','',NULL,1,10),(1279,'Ros�rio','',NULL,1,10),(1280,'Samba�ba','',NULL,1,10),(1281,'Santa Filomena do Maranh�o','',NULL,1,10),(1282,'Santa Helena','',NULL,1,10),(1283,'Santa In�s','',NULL,1,10),(1284,'Santa Luzia','',NULL,1,10),(1285,'Santa Luzia do Paru�','',NULL,1,10),(1286,'Santa Quit�ria do Maranh�o','',NULL,1,10),(1287,'Santa Rita','',NULL,1,10),(1288,'Santana do Maranh�o','',NULL,1,10),(1289,'Santo Amaro do Maranh�o','',NULL,1,10),(1290,'Santo Ant�nio dos Lopes','',NULL,1,10),(1291,'S�o Benedito do Rio Preto','',NULL,1,10),(1292,'S�o Bento','',NULL,1,10),(1293,'S�o Bernardo','',NULL,1,10),(1294,'S�o Domingos do Azeit�o','',NULL,1,10),(1295,'S�o Domingos do Maranh�o','',NULL,1,10),(1296,'S�o F�lix de Balsas','',NULL,1,10),(1297,'S�o Francisco do Brej�o','',NULL,1,10),(1298,'S�o Francisco do Maranh�o','',NULL,1,10),(1299,'S�o Jo�o Batista','',NULL,1,10),(1300,'S�o Jo�o do Car�','',NULL,1,10),(1301,'S�o Jo�o do Para�so','',NULL,1,10),(1302,'S�o Jo�o do Soter','',NULL,1,10),(1303,'S�o Jo�o dos Patos','',NULL,1,10),(1304,'S�o Jos� de Ribamar','',NULL,1,10),(1305,'S�o Jos� dos Bas�lios','',NULL,1,10),(1306,'S�o Lu�s','',NULL,1,10),(1307,'S�o Lu�s Gonzaga do Maranh�o','',NULL,1,10),(1308,'S�o Mateus do Maranh�o','',NULL,1,10),(1309,'S�o Pedro da �gua Branca','',NULL,1,10),(1310,'S�o Pedro dos Crentes','',NULL,1,10),(1311,'S�o Raimundo das Mangabeiras','',NULL,1,10),(1312,'S�o Raimundo do Doca Bezerra','',NULL,1,10),(1313,'S�o Roberto','',NULL,1,10),(1314,'S�o Vicente Ferrer','',NULL,1,10),(1315,'Satubinha','',NULL,1,10),(1316,'Senador Alexandre Costa','',NULL,1,10),(1317,'Senador La Rocque','',NULL,1,10),(1318,'Serrano do Maranh�o','',NULL,1,10),(1319,'S�tio Novo','',NULL,1,10),(1320,'Sucupira do Norte','',NULL,1,10),(1321,'Sucupira do Riach�o','',NULL,1,10),(1322,'Tasso Fragoso','',NULL,1,10),(1323,'Timbiras','',NULL,1,10),(1324,'Timon','',NULL,1,10),(1325,'Trizidela do Vale','',NULL,1,10),(1326,'Tufil�ndia','',NULL,1,10),(1327,'Tuntum','',NULL,1,10),(1328,'Turia�u','',NULL,1,10),(1329,'Turil�ndia','',NULL,1,10),(1330,'Tut�ia','',NULL,1,10),(1331,'Urbano Santos','',NULL,1,10),(1332,'Vargem Grande','',NULL,1,10),(1333,'Viana','',NULL,1,10),(1334,'Vila Nova dos Mart�rios','',NULL,1,10),(1335,'Vit�ria do Mearim','',NULL,1,10),(1336,'Vitorino Freire','',NULL,1,10),(1337,'Z� Doca','',NULL,1,10),(1338,'Acorizal','',NULL,1,11),(1339,'�gua Boa','',NULL,1,11),(1340,'Alta Floresta','',NULL,1,11),(1341,'Alto Araguaia','',NULL,1,11),(1342,'Alto Boa Vista','',NULL,1,11),(1343,'Alto Gar�as','',NULL,1,11),(1344,'Alto Paraguai','',NULL,1,11),(1345,'Alto Taquari','',NULL,1,11),(1346,'Apiac�s','',NULL,1,11),(1347,'Araguaiana','',NULL,1,11),(1348,'Araguainha','',NULL,1,11),(1349,'Araputanga','',NULL,1,11),(1350,'Aren�polis','',NULL,1,11),(1351,'Aripuan�','',NULL,1,11),(1352,'Bar�o de Melga�o','',NULL,1,11),(1353,'Barra do Bugres','',NULL,1,11),(1354,'Barra do Gar�as','',NULL,1,11),(1355,'Brasnorte','',NULL,1,11),(1356,'C�ceres','',NULL,1,11),(1357,'Campin�polis','',NULL,1,11),(1358,'Campo Novo do Parecis','',NULL,1,11),(1359,'Campo Verde','',NULL,1,11),(1360,'Campos de J�lio','',NULL,1,11),(1361,'Canabrava do Norte','',NULL,1,11),(1362,'Canarana','',NULL,1,11),(1363,'Carlinda','',NULL,1,11),(1364,'Castanheira','',NULL,1,11),(1365,'Chapada dos Guimar�es','',NULL,1,11),(1366,'Cl�udia','',NULL,1,11),(1367,'Cocalinho','',NULL,1,11),(1368,'Col�der','',NULL,1,11),(1369,'Comodoro','',NULL,1,11),(1370,'Confresa','',NULL,1,11),(1371,'Cotrigua�u','',NULL,1,11),(1372,'Cuiab�','',NULL,1,11),(1373,'Denise','',NULL,1,11),(1374,'Diamantino','',NULL,1,11),(1375,'Dom Aquino','',NULL,1,11),(1376,'Feliz Natal','',NULL,1,11),(1377,'Figueir�polis d`Oeste','',NULL,1,11),(1378,'Ga�cha do Norte','',NULL,1,11),(1379,'General Carneiro','',NULL,1,11),(1380,'Gl�ria d`Oeste','',NULL,1,11),(1381,'Guarant� do Norte','',NULL,1,11),(1382,'Guiratinga','',NULL,1,11),(1383,'Indiava�','',NULL,1,11),(1384,'Ita�ba','',NULL,1,11),(1385,'Itiquira','',NULL,1,11),(1386,'Jaciara','',NULL,1,11),(1387,'Jangada','',NULL,1,11),(1388,'Jauru','',NULL,1,11),(1389,'Juara','',NULL,1,11),(1390,'Ju�na','',NULL,1,11),(1391,'Juruena','',NULL,1,11),(1392,'Juscimeira','',NULL,1,11),(1393,'Lambari d`Oeste','',NULL,1,11),(1394,'Lucas do Rio Verde','',NULL,1,11),(1395,'Luci�ra','',NULL,1,11),(1396,'Marcel�ndia','',NULL,1,11),(1397,'Matup�','',NULL,1,11),(1398,'Mirassol d`Oeste','',NULL,1,11),(1399,'Nobres','',NULL,1,11),(1400,'Nortel�ndia','',NULL,1,11),(1401,'Nossa Senhora do Livramento','',NULL,1,11),(1402,'Nova Bandeirantes','',NULL,1,11),(1403,'Nova Brasil�ndia','',NULL,1,11),(1404,'Nova Cana� do Norte','',NULL,1,11),(1405,'Nova Guarita','',NULL,1,11),(1406,'Nova Lacerda','',NULL,1,11),(1407,'Nova Maril�ndia','',NULL,1,11),(1408,'Nova Maring�','',NULL,1,11),(1409,'Nova Monte Verde','',NULL,1,11),(1410,'Nova Mutum','',NULL,1,11),(1411,'Nova Ol�mpia','',NULL,1,11),(1412,'Nova Ubirat�','',NULL,1,11),(1413,'Nova Xavantina','',NULL,1,11),(1414,'Novo Horizonte do Norte','',NULL,1,11),(1415,'Novo Mundo','',NULL,1,11),(1416,'Novo S�o Joaquim','',NULL,1,11),(1417,'Parana�ta','',NULL,1,11),(1418,'Paranatinga','',NULL,1,11),(1419,'Pedra Preta','',NULL,1,11),(1420,'Peixoto de Azevedo','',NULL,1,11),(1421,'Planalto da Serra','',NULL,1,11),(1422,'Pocon�','',NULL,1,11),(1423,'Pontal do Araguaia','',NULL,1,11),(1424,'Ponte Branca','',NULL,1,11),(1425,'Pontes e Lacerda','',NULL,1,11),(1426,'Porto Alegre do Norte','',NULL,1,11),(1427,'Porto dos Ga�chos','',NULL,1,11),(1428,'Porto Esperidi�o','',NULL,1,11),(1429,'Porto Estrela','',NULL,1,11),(1430,'Poxor�o','',NULL,1,11),(1431,'Primavera do Leste','',NULL,1,11),(1432,'Quer�ncia','',NULL,1,11),(1433,'Reserva do Caba�al','',NULL,1,11),(1434,'Ribeir�o Cascalheira','',NULL,1,11),(1435,'Ribeir�ozinho','',NULL,1,11),(1436,'Rio Branco','',NULL,1,11),(1437,'Rondon�polis','',NULL,1,11),(1438,'Ros�rio Oeste','',NULL,1,11),(1439,'Salto do C�u','',NULL,1,11),(1440,'Santa Carmem','',NULL,1,11),(1441,'Santa Terezinha','',NULL,1,11),(1442,'Santo Afonso','',NULL,1,11),(1443,'Santo Ant�nio do Leverger','',NULL,1,11),(1444,'S�o F�lix do Araguaia','',NULL,1,11),(1445,'S�o Jos� do Povo','',NULL,1,11),(1446,'S�o Jos� do Rio Claro','',NULL,1,11),(1447,'S�o Jos� do Xingu','',NULL,1,11),(1448,'S�o Jos� dos Quatro Marcos','',NULL,1,11),(1449,'S�o Pedro da Cipa','',NULL,1,11),(1450,'Sapezal','',NULL,1,11),(1451,'Sinop','',NULL,1,11),(1452,'Sorriso','',NULL,1,11),(1453,'Tabapor�','',NULL,1,11),(1454,'Tangar� da Serra','',NULL,1,11),(1455,'Tapurah','',NULL,1,11),(1456,'Terra Nova do Norte','',NULL,1,11),(1457,'Tesouro','',NULL,1,11),(1458,'Torixor�u','',NULL,1,11),(1459,'Uni�o do Sul','',NULL,1,11),(1460,'V�rzea Grande','',NULL,1,11),(1461,'Vera','',NULL,1,11),(1462,'Vila Bela da Sant�ssima Trindade','',NULL,1,11),(1463,'Vila Rica','',NULL,1,11),(1464,'�gua Clara','',NULL,1,12),(1465,'Alcin�polis','',NULL,1,12),(1466,'Amamba�','',NULL,1,12),(1467,'Anast�cio','',NULL,1,12),(1468,'Anauril�ndia','',NULL,1,12),(1469,'Ang�lica','',NULL,1,12),(1470,'Ant�nio Jo�o','',NULL,1,12),(1471,'Aparecida do Taboado','',NULL,1,12),(1472,'Aquidauana','',NULL,1,12),(1473,'Aral Moreira','',NULL,1,12),(1474,'Bandeirantes','',NULL,1,12),(1475,'Bataguassu','',NULL,1,12),(1476,'Bataipor�','',NULL,1,12),(1477,'Bela Vista','',NULL,1,12),(1478,'Bodoquena','',NULL,1,12),(1479,'Bonito','',NULL,1,12),(1480,'Brasil�ndia','',NULL,1,12),(1481,'Caarap�','',NULL,1,12),(1482,'Camapu�','',NULL,1,12),(1483,'Campo Grande','',NULL,1,12),(1484,'Caracol','',NULL,1,12),(1485,'Cassil�ndia','',NULL,1,12),(1486,'Chapad�o do Sul','',NULL,1,12),(1487,'Corguinho','',NULL,1,12),(1488,'Coronel Sapucaia','',NULL,1,12),(1489,'Corumb�','',NULL,1,12),(1490,'Costa Rica','',NULL,1,12),(1491,'Coxim','',NULL,1,12),(1492,'Deod�polis','',NULL,1,12),(1493,'Dois Irm�os do Buriti','',NULL,1,12),(1494,'Douradina','',NULL,1,12),(1495,'Dourados','',NULL,1,12),(1496,'Eldorado','',NULL,1,12),(1497,'F�tima do Sul','',NULL,1,12),(1498,'Gl�ria de Dourados','',NULL,1,12),(1499,'Guia Lopes da Laguna','',NULL,1,12),(1500,'Iguatemi','',NULL,1,12),(1501,'Inoc�ncia','',NULL,1,12),(1502,'Itapor�','',NULL,1,12),(1503,'Itaquira�','',NULL,1,12),(1504,'Ivinhema','',NULL,1,12),(1505,'Japor�','',NULL,1,12),(1506,'Jaraguari','',NULL,1,12),(1507,'Jardim','',NULL,1,12),(1508,'Jate�','',NULL,1,12),(1509,'Juti','',NULL,1,12),(1510,'Lad�rio','',NULL,1,12),(1511,'Laguna Carap�','',NULL,1,12),(1512,'Maracaju','',NULL,1,12),(1513,'Miranda','',NULL,1,12),(1514,'Mundo Novo','',NULL,1,12),(1515,'Navira�','',NULL,1,12),(1516,'Nioaque','',NULL,1,12),(1517,'Nova Alvorada do Sul','',NULL,1,12),(1518,'Nova Andradina','',NULL,1,12),(1519,'Novo Horizonte do Sul','',NULL,1,12),(1520,'Parana�ba','',NULL,1,12),(1521,'Paranhos','',NULL,1,12),(1522,'Pedro Gomes','',NULL,1,12),(1523,'Ponta Por�','',NULL,1,12),(1524,'Porto Murtinho','',NULL,1,12),(1525,'Ribas do Rio Pardo','',NULL,1,12),(1526,'Rio Brilhante','',NULL,1,12),(1527,'Rio Negro','',NULL,1,12),(1528,'Rio Verde de Mato Grosso','',NULL,1,12),(1529,'Rochedo','',NULL,1,12),(1530,'Santa Rita do Pardo','',NULL,1,12),(1531,'S�o Gabriel do Oeste','',NULL,1,12),(1532,'Selv�ria','',NULL,1,12),(1533,'Sete Quedas','',NULL,1,12),(1534,'Sidrol�ndia','',NULL,1,12),(1535,'Sonora','',NULL,1,12),(1536,'Tacuru','',NULL,1,12),(1537,'Taquarussu','',NULL,1,12),(1538,'Terenos','',NULL,1,12),(1539,'Tr�s Lagoas','',NULL,1,12),(1540,'Vicentina','',NULL,1,12),(1541,'Abadia dos Dourados','',NULL,1,13),(1542,'Abaet�','',NULL,1,13),(1543,'Abre Campo','',NULL,1,13),(1544,'Acaiaca','',NULL,1,13),(1545,'A�ucena','',NULL,1,13),(1546,'�gua Boa','',NULL,1,13),(1547,'�gua Comprida','',NULL,1,13),(1548,'Aguanil','',NULL,1,13),(1549,'�guas Formosas','',NULL,1,13),(1550,'�guas Vermelhas','',NULL,1,13),(1551,'Aimor�s','',NULL,1,13),(1552,'Aiuruoca','',NULL,1,13),(1553,'Alagoa','',NULL,1,13),(1554,'Albertina','',NULL,1,13),(1555,'Al�m Para�ba','',NULL,1,13),(1556,'Alfenas','',NULL,1,13),(1557,'Alfredo Vasconcelos','',NULL,1,13),(1558,'Almenara','',NULL,1,13),(1559,'Alpercata','',NULL,1,13),(1560,'Alpin�polis','',NULL,1,13),(1561,'Alterosa','',NULL,1,13),(1562,'Alto Capara�','',NULL,1,13),(1563,'Alto Jequitib�','',NULL,1,13),(1564,'Alto Rio Doce','',NULL,1,13),(1565,'Alvarenga','',NULL,1,13),(1566,'Alvin�polis','',NULL,1,13),(1567,'Alvorada de Minas','',NULL,1,13),(1568,'Amparo do Serra','',NULL,1,13),(1569,'Andradas','',NULL,1,13),(1570,'Andrel�ndia','',NULL,1,13),(1571,'Angel�ndia','',NULL,1,13),(1572,'Ant�nio Carlos','',NULL,1,13),(1573,'Ant�nio Dias','',NULL,1,13),(1574,'Ant�nio Prado de Minas','',NULL,1,13),(1575,'Ara�a�','',NULL,1,13),(1576,'Aracitaba','',NULL,1,13),(1577,'Ara�ua�','',NULL,1,13),(1578,'Araguari','',NULL,1,13),(1579,'Arantina','',NULL,1,13),(1580,'Araponga','',NULL,1,13),(1581,'Arapor�','',NULL,1,13),(1582,'Arapu�','',NULL,1,13),(1583,'Ara�jos','',NULL,1,13),(1584,'Arax�','',NULL,1,13),(1585,'Arceburgo','',NULL,1,13),(1586,'Arcos','',NULL,1,13),(1587,'Areado','',NULL,1,13),(1588,'Argirita','',NULL,1,13),(1589,'Aricanduva','',NULL,1,13),(1590,'Arinos','',NULL,1,13),(1591,'Astolfo Dutra','',NULL,1,13),(1592,'Atal�ia','',NULL,1,13),(1593,'Augusto de Lima','',NULL,1,13),(1594,'Baependi','',NULL,1,13),(1595,'Baldim','',NULL,1,13),(1596,'Bambu�','',NULL,1,13),(1597,'Bandeira','',NULL,1,13),(1598,'Bandeira do Sul','',NULL,1,13),(1599,'Bar�o de Cocais','',NULL,1,13),(1600,'Bar�o de Monte Alto','',NULL,1,13),(1601,'Barbacena','',NULL,1,13),(1602,'Barra Longa','',NULL,1,13),(1603,'Barroso','',NULL,1,13),(1604,'Bela Vista de Minas','',NULL,1,13),(1605,'Belmiro Braga','',NULL,1,13),(1606,'Belo Horizonte','',NULL,1,13),(1607,'Belo Oriente','',NULL,1,13),(1608,'Belo Vale','',NULL,1,13),(1609,'Berilo','',NULL,1,13),(1610,'Berizal','',NULL,1,13),(1611,'Bert�polis','',NULL,1,13),(1612,'Betim','',NULL,1,13),(1613,'Bias Fortes','',NULL,1,13),(1614,'Bicas','',NULL,1,13),(1615,'Biquinhas','',NULL,1,13),(1616,'Boa Esperan�a','',NULL,1,13),(1617,'Bocaina de Minas','',NULL,1,13),(1618,'Bocai�va','',NULL,1,13),(1619,'Bom Despacho','',NULL,1,13),(1620,'Bom Jardim de Minas','',NULL,1,13),(1621,'Bom Jesus da Penha','',NULL,1,13),(1622,'Bom Jesus do Amparo','',NULL,1,13),(1623,'Bom Jesus do Galho','',NULL,1,13),(1624,'Bom Repouso','',NULL,1,13),(1625,'Bom Sucesso','',NULL,1,13),(1626,'Bonfim','',NULL,1,13),(1627,'Bonfin�polis de Minas','',NULL,1,13),(1628,'Bonito de Minas','',NULL,1,13),(1629,'Borda da Mata','',NULL,1,13),(1630,'Botelhos','',NULL,1,13),(1631,'Botumirim','',NULL,1,13),(1632,'Br�s Pires','',NULL,1,13),(1633,'Brasil�ndia de Minas','',NULL,1,13),(1634,'Bras�lia de Minas','',NULL,1,13),(1635,'Bras�polis','',NULL,1,13),(1636,'Bra�nas','',NULL,1,13),(1637,'Brumadinho','',NULL,1,13),(1638,'Bueno Brand�o','',NULL,1,13),(1639,'Buen�polis','',NULL,1,13),(1640,'Bugre','',NULL,1,13),(1641,'Buritis','',NULL,1,13),(1642,'Buritizeiro','',NULL,1,13),(1643,'Cabeceira Grande','',NULL,1,13),(1644,'Cabo Verde','',NULL,1,13),(1645,'Cachoeira da Prata','',NULL,1,13),(1646,'Cachoeira de Minas','',NULL,1,13),(1647,'Cachoeira de Paje�','',NULL,1,13),(1648,'Cachoeira Dourada','',NULL,1,13),(1649,'Caetan�polis','',NULL,1,13),(1650,'Caet�','',NULL,1,13),(1651,'Caiana','',NULL,1,13),(1652,'Cajuri','',NULL,1,13),(1653,'Caldas','',NULL,1,13),(1654,'Camacho','',NULL,1,13),(1655,'Camanducaia','',NULL,1,13),(1656,'Cambu�','',NULL,1,13),(1657,'Cambuquira','',NULL,1,13),(1658,'Campan�rio','',NULL,1,13),(1659,'Campanha','',NULL,1,13),(1660,'Campestre','',NULL,1,13),(1661,'Campina Verde','',NULL,1,13),(1662,'Campo Azul','',NULL,1,13),(1663,'Campo Belo','',NULL,1,13),(1664,'Campo do Meio','',NULL,1,13),(1665,'Campo Florido','',NULL,1,13),(1666,'Campos Altos','',NULL,1,13),(1667,'Campos Gerais','',NULL,1,13),(1668,'Cana Verde','',NULL,1,13),(1669,'Cana�','',NULL,1,13),(1670,'Can�polis','',NULL,1,13),(1671,'Candeias','',NULL,1,13),(1672,'Cantagalo','',NULL,1,13),(1673,'Capara�','',NULL,1,13),(1674,'Capela Nova','',NULL,1,13),(1675,'Capelinha','',NULL,1,13),(1676,'Capetinga','',NULL,1,13),(1677,'Capim Branco','',NULL,1,13),(1678,'Capin�polis','',NULL,1,13),(1679,'Capit�o Andrade','',NULL,1,13),(1680,'Capit�o En�as','',NULL,1,13),(1681,'Capit�lio','',NULL,1,13),(1682,'Caputira','',NULL,1,13),(1683,'Cara�','',NULL,1,13),(1684,'Carana�ba','',NULL,1,13),(1685,'Caranda�','',NULL,1,13),(1686,'Carangola','',NULL,1,13),(1687,'Caratinga','',NULL,1,13),(1688,'Carbonita','',NULL,1,13),(1689,'Carea�u','',NULL,1,13),(1690,'Carlos Chagas','',NULL,1,13),(1691,'Carm�sia','',NULL,1,13),(1692,'Carmo da Cachoeira','',NULL,1,13),(1693,'Carmo da Mata','',NULL,1,13),(1694,'Carmo de Minas','',NULL,1,13),(1695,'Carmo do Cajuru','',NULL,1,13),(1696,'Carmo do Parana�ba','',NULL,1,13),(1697,'Carmo do Rio Claro','',NULL,1,13),(1698,'Carm�polis de Minas','',NULL,1,13),(1699,'Carneirinho','',NULL,1,13),(1700,'Carrancas','',NULL,1,13),(1701,'Carvalh�polis','',NULL,1,13),(1702,'Carvalhos','',NULL,1,13),(1703,'Casa Grande','',NULL,1,13),(1704,'Cascalho Rico','',NULL,1,13),(1705,'C�ssia','',NULL,1,13),(1706,'Cataguases','',NULL,1,13),(1707,'Catas Altas','',NULL,1,13),(1708,'Catas Altas da Noruega','',NULL,1,13),(1709,'Catuji','',NULL,1,13),(1710,'Catuti','',NULL,1,13),(1711,'Caxambu','',NULL,1,13),(1712,'Cedro do Abaet�','',NULL,1,13),(1713,'Central de Minas','',NULL,1,13),(1714,'Centralina','',NULL,1,13),(1715,'Ch�cara','',NULL,1,13),(1716,'Chal�','',NULL,1,13),(1717,'Chapada do Norte','',NULL,1,13),(1718,'Chapada Ga�cha','',NULL,1,13),(1719,'Chiador','',NULL,1,13),(1720,'Cipot�nea','',NULL,1,13),(1721,'Claraval','',NULL,1,13),(1722,'Claro dos Po��es','',NULL,1,13),(1723,'Cl�udio','',NULL,1,13),(1724,'Coimbra','',NULL,1,13),(1725,'Coluna','',NULL,1,13),(1726,'Comendador Gomes','',NULL,1,13),(1727,'Comercinho','',NULL,1,13),(1728,'Concei��o da Aparecida','',NULL,1,13),(1729,'Concei��o da Barra de Minas','',NULL,1,13),(1730,'Concei��o das Alagoas','',NULL,1,13),(1731,'Concei��o das Pedras','',NULL,1,13),(1732,'Concei��o de Ipanema','',NULL,1,13),(1733,'Concei��o do Mato Dentro','',NULL,1,13),(1734,'Concei��o do Par�','',NULL,1,13),(1735,'Concei��o do Rio Verde','',NULL,1,13),(1736,'Concei��o dos Ouros','',NULL,1,13),(1737,'C�nego Marinho','',NULL,1,13),(1738,'Confins','',NULL,1,13),(1739,'Congonhal','',NULL,1,13),(1740,'Congonhas','',NULL,1,13),(1741,'Congonhas do Norte','',NULL,1,13),(1742,'Conquista','',NULL,1,13),(1743,'Conselheiro Lafaiete','',NULL,1,13),(1744,'Conselheiro Pena','',NULL,1,13),(1745,'Consola��o','',NULL,1,13),(1746,'Contagem','',NULL,1,13),(1747,'Coqueiral','',NULL,1,13),(1748,'Cora��o de Jesus','',NULL,1,13),(1749,'Cordisburgo','',NULL,1,13),(1750,'Cordisl�ndia','',NULL,1,13),(1751,'Corinto','',NULL,1,13),(1752,'Coroaci','',NULL,1,13),(1753,'Coromandel','',NULL,1,13),(1754,'Coronel Fabriciano','',NULL,1,13),(1755,'Coronel Murta','',NULL,1,13),(1756,'Coronel Pacheco','',NULL,1,13),(1757,'Coronel Xavier Chaves','',NULL,1,13),(1758,'C�rrego Danta','',NULL,1,13),(1759,'C�rrego do Bom Jesus','',NULL,1,13),(1760,'C�rrego Fundo','',NULL,1,13),(1761,'C�rrego Novo','',NULL,1,13),(1762,'Couto de Magalh�es de Minas','',NULL,1,13),(1763,'Cris�lita','',NULL,1,13),(1764,'Cristais','',NULL,1,13),(1765,'Crist�lia','',NULL,1,13),(1766,'Cristiano Otoni','',NULL,1,13),(1767,'Cristina','',NULL,1,13),(1768,'Crucil�ndia','',NULL,1,13),(1769,'Cruzeiro da Fortaleza','',NULL,1,13),(1770,'Cruz�lia','',NULL,1,13),(1771,'Cuparaque','',NULL,1,13),(1772,'Curral de Dentro','',NULL,1,13),(1773,'Curvelo','',NULL,1,13),(1774,'Datas','',NULL,1,13),(1775,'Delfim Moreira','',NULL,1,13),(1776,'Delfin�polis','',NULL,1,13),(1777,'Delta','',NULL,1,13),(1778,'Descoberto','',NULL,1,13),(1779,'Desterro de Entre Rios','',NULL,1,13),(1780,'Desterro do Melo','',NULL,1,13),(1781,'Diamantina','',NULL,1,13),(1782,'Diogo de Vasconcelos','',NULL,1,13),(1783,'Dion�sio','',NULL,1,13),(1784,'Divin�sia','',NULL,1,13),(1785,'Divino','',NULL,1,13),(1786,'Divino das Laranjeiras','',NULL,1,13),(1787,'Divinol�ndia de Minas','',NULL,1,13),(1788,'Divin�polis','',NULL,1,13),(1789,'Divisa Alegre','',NULL,1,13),(1790,'Divisa Nova','',NULL,1,13),(1791,'Divis�polis','',NULL,1,13),(1792,'Dom Bosco','',NULL,1,13),(1793,'Dom Cavati','',NULL,1,13),(1794,'Dom Joaquim','',NULL,1,13),(1795,'Dom Silv�rio','',NULL,1,13),(1796,'Dom Vi�oso','',NULL,1,13),(1797,'Dona Eus�bia','',NULL,1,13),(1798,'Dores de Campos','',NULL,1,13),(1799,'Dores de Guanh�es','',NULL,1,13),(1800,'Dores do Indai�','',NULL,1,13),(1801,'Dores do Turvo','',NULL,1,13),(1802,'Dores�polis','',NULL,1,13),(1803,'Douradoquara','',NULL,1,13),(1804,'Durand�','',NULL,1,13),(1805,'El�i Mendes','',NULL,1,13),(1806,'Engenheiro Caldas','',NULL,1,13),(1807,'Engenheiro Navarro','',NULL,1,13),(1808,'Entre Folhas','',NULL,1,13),(1809,'Entre Rios de Minas','',NULL,1,13),(1810,'Erv�lia','',NULL,1,13),(1811,'Esmeraldas','',NULL,1,13),(1812,'Espera Feliz','',NULL,1,13),(1813,'Espinosa','',NULL,1,13),(1814,'Esp�rito Santo do Dourado','',NULL,1,13),(1815,'Estiva','',NULL,1,13),(1816,'Estrela Dalva','',NULL,1,13),(1817,'Estrela do Indai�','',NULL,1,13),(1818,'Estrela do Sul','',NULL,1,13),(1819,'Eugen�polis','',NULL,1,13),(1820,'Ewbank da C�mara','',NULL,1,13),(1821,'Extrema','',NULL,1,13),(1822,'Fama','',NULL,1,13),(1823,'Faria Lemos','',NULL,1,13),(1824,'Fel�cio dos Santos','',NULL,1,13),(1825,'Felisburgo','',NULL,1,13),(1826,'Felixl�ndia','',NULL,1,13),(1827,'Fernandes Tourinho','',NULL,1,13),(1828,'Ferros','',NULL,1,13),(1829,'Fervedouro','',NULL,1,13),(1830,'Florestal','',NULL,1,13),(1831,'Formiga','',NULL,1,13),(1832,'Formoso','',NULL,1,13),(1833,'Fortaleza de Minas','',NULL,1,13),(1834,'Fortuna de Minas','',NULL,1,13),(1835,'Francisco Badar�','',NULL,1,13),(1836,'Francisco Dumont','',NULL,1,13),(1837,'Francisco S�','',NULL,1,13),(1838,'Francisc�polis','',NULL,1,13),(1839,'Frei Gaspar','',NULL,1,13),(1840,'Frei Inoc�ncio','',NULL,1,13),(1841,'Frei Lagonegro','',NULL,1,13),(1842,'Fronteira','',NULL,1,13),(1843,'Fronteira dos Vales','',NULL,1,13),(1844,'Fruta de Leite','',NULL,1,13),(1845,'Frutal','',NULL,1,13),(1846,'Funil�ndia','',NULL,1,13),(1847,'Galil�ia','',NULL,1,13),(1848,'Gameleiras','',NULL,1,13),(1849,'Glaucil�ndia','',NULL,1,13),(1850,'Goiabeira','',NULL,1,13),(1851,'Goian�','',NULL,1,13),(1852,'Gon�alves','',NULL,1,13),(1853,'Gonzaga','',NULL,1,13),(1854,'Gouveia','',NULL,1,13),(1855,'Governador Valadares','',NULL,1,13),(1856,'Gr�o Mogol','',NULL,1,13),(1857,'Grupiara','',NULL,1,13),(1858,'Guanh�es','',NULL,1,13),(1859,'Guap�','',NULL,1,13),(1860,'Guaraciaba','',NULL,1,13),(1861,'Guaraciama','',NULL,1,13),(1862,'Guaran�sia','',NULL,1,13),(1863,'Guarani','',NULL,1,13),(1864,'Guarar�','',NULL,1,13),(1865,'Guarda-Mor','',NULL,1,13),(1866,'Guaxup�','',NULL,1,13),(1867,'Guidoval','',NULL,1,13),(1868,'Guimar�nia','',NULL,1,13),(1869,'Guiricema','',NULL,1,13),(1870,'Gurinhat�','',NULL,1,13),(1871,'Heliodora','',NULL,1,13),(1872,'Iapu','',NULL,1,13),(1873,'Ibertioga','',NULL,1,13),(1874,'Ibi�','',NULL,1,13),(1875,'Ibia�','',NULL,1,13),(1876,'Ibiracatu','',NULL,1,13),(1877,'Ibiraci','',NULL,1,13),(1878,'Ibirit�','',NULL,1,13),(1879,'Ibiti�ra de Minas','',NULL,1,13),(1880,'Ibituruna','',NULL,1,13),(1881,'Icara� de Minas','',NULL,1,13),(1882,'Igarap�','',NULL,1,13),(1883,'Igaratinga','',NULL,1,13),(1884,'Iguatama','',NULL,1,13),(1885,'Ijaci','',NULL,1,13),(1886,'Ilic�nea','',NULL,1,13),(1887,'Imb� de Minas','',NULL,1,13),(1888,'Inconfidentes','',NULL,1,13),(1889,'Indaiabira','',NULL,1,13),(1890,'Indian�polis','',NULL,1,13),(1891,'Inga�','',NULL,1,13),(1892,'Inhapim','',NULL,1,13),(1893,'Inha�ma','',NULL,1,13),(1894,'Inimutaba','',NULL,1,13),(1895,'Ipaba','',NULL,1,13),(1896,'Ipanema','',NULL,1,13),(1897,'Ipatinga','',NULL,1,13),(1898,'Ipia�u','',NULL,1,13),(1899,'Ipui�na','',NULL,1,13),(1900,'Ira� de Minas','',NULL,1,13),(1901,'Itabira','',NULL,1,13),(1902,'Itabirinha de Mantena','',NULL,1,13),(1903,'Itabirito','',NULL,1,13),(1904,'Itacambira','',NULL,1,13),(1905,'Itacarambi','',NULL,1,13),(1906,'Itaguara','',NULL,1,13),(1907,'Itaip�','',NULL,1,13),(1908,'Itajub�','',NULL,1,13),(1909,'Itamarandiba','',NULL,1,13),(1910,'Itamarati de Minas','',NULL,1,13),(1911,'Itambacuri','',NULL,1,13),(1912,'Itamb� do Mato Dentro','',NULL,1,13),(1913,'Itamogi','',NULL,1,13),(1914,'Itamonte','',NULL,1,13),(1915,'Itanhandu','',NULL,1,13),(1916,'Itanhomi','',NULL,1,13),(1917,'Itaobim','',NULL,1,13),(1918,'Itapagipe','',NULL,1,13),(1919,'Itapecerica','',NULL,1,13),(1920,'Itapeva','',NULL,1,13),(1921,'Itatiaiu�u','',NULL,1,13),(1922,'Ita� de Minas','',NULL,1,13),(1923,'Ita�na','',NULL,1,13),(1924,'Itaverava','',NULL,1,13),(1925,'Itinga','',NULL,1,13),(1926,'Itueta','',NULL,1,13),(1927,'Ituiutaba','',NULL,1,13),(1928,'Itumirim','',NULL,1,13),(1929,'Iturama','',NULL,1,13),(1930,'Itutinga','',NULL,1,13),(1931,'Jaboticatubas','',NULL,1,13),(1932,'Jacinto','',NULL,1,13),(1933,'Jacu�','',NULL,1,13),(1934,'Jacutinga','',NULL,1,13),(1935,'Jaguara�u','',NULL,1,13),(1936,'Ja�ba','',NULL,1,13),(1937,'Jampruca','',NULL,1,13),(1938,'Jana�ba','',NULL,1,13),(1939,'Janu�ria','',NULL,1,13),(1940,'Japara�ba','',NULL,1,13),(1941,'Japonvar','',NULL,1,13),(1942,'Jeceaba','',NULL,1,13),(1943,'Jenipapo de Minas','',NULL,1,13),(1944,'Jequeri','',NULL,1,13),(1945,'Jequita�','',NULL,1,13),(1946,'Jequitib�','',NULL,1,13),(1947,'Jequitinhonha','',NULL,1,13),(1948,'Jesu�nia','',NULL,1,13),(1949,'Joa�ma','',NULL,1,13),(1950,'Joan�sia','',NULL,1,13),(1951,'Jo�o Monlevade','',NULL,1,13),(1952,'Jo�o Pinheiro','',NULL,1,13),(1953,'Joaquim Fel�cio','',NULL,1,13),(1954,'Jord�nia','',NULL,1,13),(1955,'Jos� Gon�alves de Minas','',NULL,1,13),(1956,'Jos� Raydan','',NULL,1,13),(1957,'Josen�polis','',NULL,1,13),(1958,'Juatuba','',NULL,1,13),(1959,'Juiz de Fora','',NULL,1,13),(1960,'Juramento','',NULL,1,13),(1961,'Juruaia','',NULL,1,13),(1962,'Juven�lia','',NULL,1,13),(1963,'Ladainha','',NULL,1,13),(1964,'Lagamar','',NULL,1,13),(1965,'Lagoa da Prata','',NULL,1,13),(1966,'Lagoa dos Patos','',NULL,1,13),(1967,'Lagoa Dourada','',NULL,1,13),(1968,'Lagoa Formosa','',NULL,1,13),(1969,'Lagoa Grande','',NULL,1,13),(1970,'Lagoa Santa','',NULL,1,13),(1971,'Lajinha','',NULL,1,13),(1972,'Lambari','',NULL,1,13),(1973,'Lamim','',NULL,1,13),(1974,'Laranjal','',NULL,1,13),(1975,'Lassance','',NULL,1,13),(1976,'Lavras','',NULL,1,13),(1977,'Leandro Ferreira','',NULL,1,13),(1978,'Leme do Prado','',NULL,1,13),(1979,'Leopoldina','',NULL,1,13),(1980,'Liberdade','',NULL,1,13),(1981,'Lima Duarte','',NULL,1,13),(1982,'Limeira do Oeste','',NULL,1,13),(1983,'Lontra','',NULL,1,13),(1984,'Luisburgo','',NULL,1,13),(1985,'Luisl�ndia','',NULL,1,13),(1986,'Lumin�rias','',NULL,1,13),(1987,'Luz','',NULL,1,13),(1988,'Machacalis','',NULL,1,13),(1989,'Machado','',NULL,1,13),(1990,'Madre de Deus de Minas','',NULL,1,13),(1991,'Malacacheta','',NULL,1,13),(1992,'Mamonas','',NULL,1,13),(1993,'Manga','',NULL,1,13),(1994,'Manhua�u','',NULL,1,13),(1995,'Manhumirim','',NULL,1,13),(1996,'Mantena','',NULL,1,13),(1997,'Mar de Espanha','',NULL,1,13),(1998,'Maravilhas','',NULL,1,13),(1999,'Maria da F�','',NULL,1,13),(2000,'Mariana','',NULL,1,13),(2001,'Marilac','',NULL,1,13),(2002,'M�rio Campos','',NULL,1,13),(2003,'Marip� de Minas','',NULL,1,13),(2004,'Marli�ria','',NULL,1,13),(2005,'Marmel�polis','',NULL,1,13),(2006,'Martinho Campos','',NULL,1,13),(2007,'Martins Soares','',NULL,1,13),(2008,'Mata Verde','',NULL,1,13),(2009,'Materl�ndia','',NULL,1,13),(2010,'Mateus Leme','',NULL,1,13),(2011,'Mathias Lobato','',NULL,1,13),(2012,'Matias Barbosa','',NULL,1,13),(2013,'Matias Cardoso','',NULL,1,13),(2014,'Matip�','',NULL,1,13),(2015,'Mato Verde','',NULL,1,13),(2016,'Matozinhos','',NULL,1,13),(2017,'Matutina','',NULL,1,13),(2018,'Medeiros','',NULL,1,13),(2019,'Medina','',NULL,1,13),(2020,'Mendes Pimentel','',NULL,1,13),(2021,'Merc�s','',NULL,1,13),(2022,'Mesquita','',NULL,1,13),(2023,'Minas Novas','',NULL,1,13),(2024,'Minduri','',NULL,1,13),(2025,'Mirabela','',NULL,1,13),(2026,'Miradouro','',NULL,1,13),(2027,'Mira�','',NULL,1,13),(2028,'Mirav�nia','',NULL,1,13),(2029,'Moeda','',NULL,1,13),(2030,'Moema','',NULL,1,13),(2031,'Monjolos','',NULL,1,13),(2032,'Monsenhor Paulo','',NULL,1,13),(2033,'Montalv�nia','',NULL,1,13),(2034,'Monte Alegre de Minas','',NULL,1,13),(2035,'Monte Azul','',NULL,1,13),(2036,'Monte Belo','',NULL,1,13),(2037,'Monte Carmelo','',NULL,1,13),(2038,'Monte Formoso','',NULL,1,13),(2039,'Monte Santo de Minas','',NULL,1,13),(2040,'Monte Si�o','',NULL,1,13),(2041,'Montes Claros','',NULL,1,13),(2042,'Montezuma','',NULL,1,13),(2043,'Morada Nova de Minas','',NULL,1,13),(2044,'Morro da Gar�a','',NULL,1,13),(2045,'Morro do Pilar','',NULL,1,13),(2046,'Munhoz','',NULL,1,13),(2047,'Muria�','',NULL,1,13),(2048,'Mutum','',NULL,1,13),(2049,'Muzambinho','',NULL,1,13),(2050,'Nacip Raydan','',NULL,1,13),(2051,'Nanuque','',NULL,1,13),(2052,'Naque','',NULL,1,13),(2053,'Natal�ndia','',NULL,1,13),(2054,'Nat�rcia','',NULL,1,13),(2055,'Nazareno','',NULL,1,13),(2056,'Nepomuceno','',NULL,1,13),(2057,'Ninheira','',NULL,1,13),(2058,'Nova Bel�m','',NULL,1,13),(2059,'Nova Era','',NULL,1,13),(2060,'Nova Lima','',NULL,1,13),(2061,'Nova M�dica','',NULL,1,13),(2062,'Nova Ponte','',NULL,1,13),(2063,'Nova Porteirinha','',NULL,1,13),(2064,'Nova Resende','',NULL,1,13),(2065,'Nova Serrana','',NULL,1,13),(2066,'Nova Uni�o','',NULL,1,13),(2067,'Novo Cruzeiro','',NULL,1,13),(2068,'Novo Oriente de Minas','',NULL,1,13),(2069,'Novorizonte','',NULL,1,13),(2070,'Olaria','',NULL,1,13),(2071,'Olhos-d`�gua','',NULL,1,13),(2072,'Ol�mpio Noronha','',NULL,1,13),(2073,'Oliveira','',NULL,1,13),(2074,'Oliveira Fortes','',NULL,1,13),(2075,'On�a de Pitangui','',NULL,1,13),(2076,'Orat�rios','',NULL,1,13),(2077,'Oriz�nia','',NULL,1,13),(2078,'Ouro Branco','',NULL,1,13),(2079,'Ouro Fino','',NULL,1,13),(2080,'Ouro Preto','',NULL,1,13),(2081,'Ouro Verde de Minas','',NULL,1,13),(2082,'Padre Carvalho','',NULL,1,13),(2083,'Padre Para�so','',NULL,1,13),(2084,'Pai Pedro','',NULL,1,13),(2085,'Paineiras','',NULL,1,13),(2086,'Pains','',NULL,1,13),(2087,'Paiva','',NULL,1,13),(2088,'Palma','',NULL,1,13),(2089,'Palm�polis','',NULL,1,13),(2090,'Papagaios','',NULL,1,13),(2091,'Par� de Minas','',NULL,1,13),(2092,'Paracatu','',NULL,1,13),(2093,'Paragua�u','',NULL,1,13),(2094,'Parais�polis','',NULL,1,13),(2095,'Paraopeba','',NULL,1,13),(2096,'Passa Quatro','',NULL,1,13),(2097,'Passa Tempo','',NULL,1,13),(2098,'Passa-Vinte','',NULL,1,13),(2099,'Passab�m','',NULL,1,13),(2100,'Passos','',NULL,1,13),(2101,'Patis','',NULL,1,13),(2102,'Patos de Minas','',NULL,1,13),(2103,'Patroc�nio','',NULL,1,13),(2104,'Patroc�nio do Muria�','',NULL,1,13),(2105,'Paula C�ndido','',NULL,1,13),(2106,'Paulistas','',NULL,1,13),(2107,'Pav�o','',NULL,1,13),(2108,'Pe�anha','',NULL,1,13),(2109,'Pedra Azul','',NULL,1,13),(2110,'Pedra Bonita','',NULL,1,13),(2111,'Pedra do Anta','',NULL,1,13),(2112,'Pedra do Indai�','',NULL,1,13),(2113,'Pedra Dourada','',NULL,1,13),(2114,'Pedralva','',NULL,1,13),(2115,'Pedras de Maria da Cruz','',NULL,1,13),(2116,'Pedrin�polis','',NULL,1,13),(2117,'Pedro Leopoldo','',NULL,1,13),(2118,'Pedro Teixeira','',NULL,1,13),(2119,'Pequeri','',NULL,1,13),(2120,'Pequi','',NULL,1,13),(2121,'Perdig�o','',NULL,1,13),(2122,'Perdizes','',NULL,1,13),(2123,'Perd�es','',NULL,1,13),(2124,'Periquito','',NULL,1,13),(2125,'Pescador','',NULL,1,13),(2126,'Piau','',NULL,1,13),(2127,'Piedade de Caratinga','',NULL,1,13),(2128,'Piedade de Ponte Nova','',NULL,1,13),(2129,'Piedade do Rio Grande','',NULL,1,13),(2130,'Piedade dos Gerais','',NULL,1,13),(2131,'Pimenta','',NULL,1,13),(2132,'Pingo-d`�gua','',NULL,1,13),(2133,'Pint�polis','',NULL,1,13),(2134,'Piracema','',NULL,1,13),(2135,'Pirajuba','',NULL,1,13),(2136,'Piranga','',NULL,1,13),(2137,'Pirangu�u','',NULL,1,13),(2138,'Piranguinho','',NULL,1,13),(2139,'Pirapetinga','',NULL,1,13),(2140,'Pirapora','',NULL,1,13),(2141,'Pira�ba','',NULL,1,13),(2142,'Pitangui','',NULL,1,13),(2143,'Piumhi','',NULL,1,13),(2144,'Planura','',NULL,1,13),(2145,'Po�o Fundo','',NULL,1,13),(2146,'Po�os de Caldas','',NULL,1,13),(2147,'Pocrane','',NULL,1,13),(2148,'Pomp�u','',NULL,1,13),(2149,'Ponte Nova','',NULL,1,13),(2150,'Ponto Chique','',NULL,1,13),(2151,'Ponto dos Volantes','',NULL,1,13),(2152,'Porteirinha','',NULL,1,13),(2153,'Porto Firme','',NULL,1,13),(2154,'Pot�','',NULL,1,13),(2155,'Pouso Alegre','',NULL,1,13),(2156,'Pouso Alto','',NULL,1,13),(2157,'Prados','',NULL,1,13),(2158,'Prata','',NULL,1,13),(2159,'Prat�polis','',NULL,1,13),(2160,'Pratinha','',NULL,1,13),(2161,'Presidente Bernardes','',NULL,1,13),(2162,'Presidente Juscelino','',NULL,1,13),(2163,'Presidente Kubitschek','',NULL,1,13),(2164,'Presidente Oleg�rio','',NULL,1,13),(2165,'Prudente de Morais','',NULL,1,13),(2166,'Quartel Geral','',NULL,1,13),(2167,'Queluzito','',NULL,1,13),(2168,'Raposos','',NULL,1,13),(2169,'Raul Soares','',NULL,1,13),(2170,'Recreio','',NULL,1,13),(2171,'Reduto','',NULL,1,13),(2172,'Resende Costa','',NULL,1,13),(2173,'Resplendor','',NULL,1,13),(2174,'Ressaquinha','',NULL,1,13),(2175,'Riachinho','',NULL,1,13),(2176,'Riacho dos Machados','',NULL,1,13),(2177,'Ribeir�o das Neves','',NULL,1,13),(2178,'Ribeir�o Vermelho','',NULL,1,13),(2179,'Rio Acima','',NULL,1,13),(2180,'Rio Casca','',NULL,1,13),(2181,'Rio do Prado','',NULL,1,13),(2182,'Rio Doce','',NULL,1,13),(2183,'Rio Espera','',NULL,1,13),(2184,'Rio Manso','',NULL,1,13),(2185,'Rio Novo','',NULL,1,13),(2186,'Rio Parana�ba','',NULL,1,13),(2187,'Rio Pardo de Minas','',NULL,1,13),(2188,'Rio Piracicaba','',NULL,1,13),(2189,'Rio Pomba','',NULL,1,13),(2190,'Rio Preto','',NULL,1,13),(2191,'Rio Vermelho','',NULL,1,13),(2192,'Rit�polis','',NULL,1,13),(2193,'Rochedo de Minas','',NULL,1,13),(2194,'Rodeiro','',NULL,1,13),(2195,'Romaria','',NULL,1,13),(2196,'Ros�rio da Limeira','',NULL,1,13),(2197,'Rubelita','',NULL,1,13),(2198,'Rubim','',NULL,1,13),(2199,'Sabar�','',NULL,1,13),(2200,'Sabin�polis','',NULL,1,13),(2201,'Sacramento','',NULL,1,13),(2202,'Salinas','',NULL,1,13),(2203,'Salto da Divisa','',NULL,1,13),(2204,'Santa B�rbara','',NULL,1,13),(2205,'Santa B�rbara do Leste','',NULL,1,13),(2206,'Santa B�rbara do Monte Verde','',NULL,1,13),(2207,'Santa B�rbara do Tug�rio','',NULL,1,13),(2208,'Santa Cruz de Minas','',NULL,1,13),(2209,'Santa Cruz de Salinas','',NULL,1,13),(2210,'Santa Cruz do Escalvado','',NULL,1,13),(2211,'Santa Efig�nia de Minas','',NULL,1,13),(2212,'Santa F� de Minas','',NULL,1,13),(2213,'Santa Helena de Minas','',NULL,1,13),(2214,'Santa Juliana','',NULL,1,13),(2215,'Santa Luzia','',NULL,1,13),(2216,'Santa Margarida','',NULL,1,13),(2217,'Santa Maria de Itabira','',NULL,1,13),(2218,'Santa Maria do Salto','',NULL,1,13),(2219,'Santa Maria do Sua�u�','',NULL,1,13),(2220,'Santa Rita de Caldas','',NULL,1,13),(2221,'Santa Rita de Ibitipoca','',NULL,1,13),(2222,'Santa Rita de Jacutinga','',NULL,1,13),(2223,'Santa Rita de Minas','',NULL,1,13),(2224,'Santa Rita do Itueto','',NULL,1,13),(2225,'Santa Rita do Sapuca�','',NULL,1,13),(2226,'Santa Rosa da Serra','',NULL,1,13),(2227,'Santa Vit�ria','',NULL,1,13),(2228,'Santana da Vargem','',NULL,1,13),(2229,'Santana de Cataguases','',NULL,1,13),(2230,'Santana de Pirapama','',NULL,1,13),(2231,'Santana do Deserto','',NULL,1,13),(2232,'Santana do Garamb�u','',NULL,1,13),(2233,'Santana do Jacar�','',NULL,1,13),(2234,'Santana do Manhua�u','',NULL,1,13),(2235,'Santana do Para�so','',NULL,1,13),(2236,'Santana do Riacho','',NULL,1,13),(2237,'Santana dos Montes','',NULL,1,13),(2238,'Santo Ant�nio do Amparo','',NULL,1,13),(2239,'Santo Ant�nio do Aventureiro','',NULL,1,13),(2240,'Santo Ant�nio do Grama','',NULL,1,13),(2241,'Santo Ant�nio do Itamb�','',NULL,1,13),(2242,'Santo Ant�nio do Jacinto','',NULL,1,13),(2243,'Santo Ant�nio do Monte','',NULL,1,13),(2244,'Santo Ant�nio do Retiro','',NULL,1,13),(2245,'Santo Ant�nio do Rio Abaixo','',NULL,1,13),(2246,'Santo Hip�lito','',NULL,1,13),(2247,'Santos Dumont','',NULL,1,13),(2248,'S�o Bento Abade','',NULL,1,13),(2249,'S�o Br�s do Sua�u�','',NULL,1,13),(2250,'S�o Domingos das Dores','',NULL,1,13),(2251,'S�o Domingos do Prata','',NULL,1,13),(2252,'S�o F�lix de Minas','',NULL,1,13),(2253,'S�o Francisco','',NULL,1,13),(2254,'S�o Francisco de Paula','',NULL,1,13),(2255,'S�o Francisco de Sales','',NULL,1,13),(2256,'S�o Francisco do Gl�ria','',NULL,1,13),(2257,'S�o Geraldo','',NULL,1,13),(2258,'S�o Geraldo da Piedade','',NULL,1,13),(2259,'S�o Geraldo do Baixio','',NULL,1,13),(2260,'S�o Gon�alo do Abaet�','',NULL,1,13),(2261,'S�o Gon�alo do Par�','',NULL,1,13),(2262,'S�o Gon�alo do Rio Abaixo','',NULL,1,13),(2263,'S�o Gon�alo do Rio Preto','',NULL,1,13),(2264,'S�o Gon�alo do Sapuca�','',NULL,1,13),(2265,'S�o Gotardo','',NULL,1,13),(2266,'S�o Jo�o Batista do Gl�ria','',NULL,1,13),(2267,'S�o Jo�o da Lagoa','',NULL,1,13),(2268,'S�o Jo�o da Mata','',NULL,1,13),(2269,'S�o Jo�o da Ponte','',NULL,1,13),(2270,'S�o Jo�o das Miss�es','',NULL,1,13),(2271,'S�o Jo�o del Rei','',NULL,1,13),(2272,'S�o Jo�o do Manhua�u','',NULL,1,13),(2273,'S�o Jo�o do Manteninha','',NULL,1,13),(2274,'S�o Jo�o do Oriente','',NULL,1,13),(2275,'S�o Jo�o do Pacu�','',NULL,1,13),(2276,'S�o Jo�o do Para�so','',NULL,1,13),(2277,'S�o Jo�o Evangelista','',NULL,1,13),(2278,'S�o Jo�o Nepomuceno','',NULL,1,13),(2279,'S�o Joaquim de Bicas','',NULL,1,13),(2280,'S�o Jos� da Barra','',NULL,1,13),(2281,'S�o Jos� da Lapa','',NULL,1,13),(2282,'S�o Jos� da Safira','',NULL,1,13),(2283,'S�o Jos� da Varginha','',NULL,1,13),(2284,'S�o Jos� do Alegre','',NULL,1,13),(2285,'S�o Jos� do Divino','',NULL,1,13),(2286,'S�o Jos� do Goiabal','',NULL,1,13),(2287,'S�o Jos� do Jacuri','',NULL,1,13),(2288,'S�o Jos� do Mantimento','',NULL,1,13),(2289,'S�o Louren�o','',NULL,1,13),(2290,'S�o Miguel do Anta','',NULL,1,13),(2291,'S�o Pedro da Uni�o','',NULL,1,13),(2292,'S�o Pedro do Sua�u�','',NULL,1,13),(2293,'S�o Pedro dos Ferros','',NULL,1,13),(2294,'S�o Rom�o','',NULL,1,13),(2295,'S�o Roque de Minas','',NULL,1,13),(2296,'S�o Sebasti�o da Bela Vista','',NULL,1,13),(2297,'S�o Sebasti�o da Vargem Alegre','',NULL,1,13),(2298,'S�o Sebasti�o do Anta','',NULL,1,13),(2299,'S�o Sebasti�o do Maranh�o','',NULL,1,13),(2300,'S�o Sebasti�o do Oeste','',NULL,1,13),(2301,'S�o Sebasti�o do Para�so','',NULL,1,13),(2302,'S�o Sebasti�o do Rio Preto','',NULL,1,13),(2303,'S�o Sebasti�o do Rio Verde','',NULL,1,13),(2304,'S�o Thom� das Letras','',NULL,1,13),(2305,'S�o Tiago','',NULL,1,13),(2306,'S�o Tom�s de Aquino','',NULL,1,13),(2307,'S�o Vicente de Minas','',NULL,1,13),(2308,'Sapuca�-Mirim','',NULL,1,13),(2309,'Sardo�','',NULL,1,13),(2310,'Sarzedo','',NULL,1,13),(2311,'Sem-Peixe','',NULL,1,13),(2312,'Senador Amaral','',NULL,1,13),(2313,'Senador Cortes','',NULL,1,13),(2314,'Senador Firmino','',NULL,1,13),(2315,'Senador Jos� Bento','',NULL,1,13),(2316,'Senador Modestino Gon�alves','',NULL,1,13),(2317,'Senhora de Oliveira','',NULL,1,13),(2318,'Senhora do Porto','',NULL,1,13),(2319,'Senhora dos Rem�dios','',NULL,1,13),(2320,'Sericita','',NULL,1,13),(2321,'Seritinga','',NULL,1,13),(2322,'Serra Azul de Minas','',NULL,1,13),(2323,'Serra da Saudade','',NULL,1,13),(2324,'Serra do Salitre','',NULL,1,13),(2325,'Serra dos Aimor�s','',NULL,1,13),(2326,'Serrania','',NULL,1,13),(2327,'Serran�polis de Minas','',NULL,1,13),(2328,'Serranos','',NULL,1,13),(2329,'Serro','',NULL,1,13),(2330,'Sete Lagoas','',NULL,1,13),(2331,'Setubinha','',NULL,1,13),(2332,'Silveir�nia','',NULL,1,13),(2333,'Silvian�polis','',NULL,1,13),(2334,'Sim�o Pereira','',NULL,1,13),(2335,'Simon�sia','',NULL,1,13),(2336,'Sobr�lia','',NULL,1,13),(2337,'Soledade de Minas','',NULL,1,13),(2338,'Tabuleiro','',NULL,1,13),(2339,'Taiobeiras','',NULL,1,13),(2340,'Taparuba','',NULL,1,13),(2341,'Tapira','',NULL,1,13),(2342,'Tapira�','',NULL,1,13),(2343,'Taquara�u de Minas','',NULL,1,13),(2344,'Tarumirim','',NULL,1,13),(2345,'Teixeiras','',NULL,1,13),(2346,'Te�filo Otoni','',NULL,1,13),(2347,'Tim�teo','',NULL,1,13),(2348,'Tiradentes','',NULL,1,13),(2349,'Tiros','',NULL,1,13),(2350,'Tocantins','',NULL,1,13),(2351,'Tocos do Moji','',NULL,1,13),(2352,'Toledo','',NULL,1,13),(2353,'Tombos','',NULL,1,13),(2354,'Tr�s Cora��es','',NULL,1,13),(2355,'Tr�s Marias','',NULL,1,13),(2356,'Tr�s Pontas','',NULL,1,13),(2357,'Tumiritinga','',NULL,1,13),(2358,'Tupaciguara','',NULL,1,13),(2359,'Turmalina','',NULL,1,13),(2360,'Turvol�ndia','',NULL,1,13),(2361,'Ub�','',NULL,1,13),(2362,'Uba�','',NULL,1,13),(2363,'Ubaporanga','',NULL,1,13),(2364,'Uberaba','',NULL,1,13),(2365,'Uberl�ndia','',NULL,1,13),(2366,'Umburatiba','',NULL,1,13),(2367,'Una�','',NULL,1,13),(2368,'Uni�o de Minas','',NULL,1,13),(2369,'Uruana de Minas','',NULL,1,13),(2370,'Uruc�nia','',NULL,1,13),(2371,'Urucuia','',NULL,1,13),(2372,'Vargem Alegre','',NULL,1,13),(2373,'Vargem Bonita','',NULL,1,13),(2374,'Vargem Grande do Rio Pardo','',NULL,1,13),(2375,'Varginha','',NULL,1,13),(2376,'Varj�o de Minas','',NULL,1,13),(2377,'V�rzea da Palma','',NULL,1,13),(2378,'Varzel�ndia','',NULL,1,13),(2379,'Vazante','',NULL,1,13),(2380,'Verdel�ndia','',NULL,1,13),(2381,'Veredinha','',NULL,1,13),(2382,'Ver�ssimo','',NULL,1,13),(2383,'Vermelho Novo','',NULL,1,13),(2384,'Vespasiano','',NULL,1,13),(2385,'Vi�osa','',NULL,1,13),(2386,'Vieiras','',NULL,1,13),(2387,'Virgem da Lapa','',NULL,1,13),(2388,'Virg�nia','',NULL,1,13),(2389,'Virgin�polis','',NULL,1,13),(2390,'Virgol�ndia','',NULL,1,13),(2391,'Visconde do Rio Branco','',NULL,1,13),(2392,'Volta Grande','',NULL,1,13),(2393,'Wenceslau Braz','',NULL,1,13),(2394,'Abaetetuba','',NULL,1,14),(2395,'Abel Figueiredo','',NULL,1,14),(2396,'Acar�','',NULL,1,14),(2397,'Afu�','',NULL,1,14),(2398,'�gua Azul do Norte','',NULL,1,14),(2399,'Alenquer','',NULL,1,14),(2400,'Almeirim','',NULL,1,14),(2401,'Altamira','',NULL,1,14),(2402,'Anaj�s','',NULL,1,14),(2403,'Ananindeua','',NULL,1,14),(2404,'Anapu','',NULL,1,14),(2405,'Augusto Corr�a','',NULL,1,14),(2406,'Aurora do Par�','',NULL,1,14),(2407,'Aveiro','',NULL,1,14),(2408,'Bagre','',NULL,1,14),(2409,'Bai�o','',NULL,1,14),(2410,'Bannach','',NULL,1,14),(2411,'Barcarena','',NULL,1,14),(2412,'Bel�m','',NULL,1,14),(2413,'Belterra','',NULL,1,14),(2414,'Benevides','',NULL,1,14),(2415,'Bom Jesus do Tocantins','',NULL,1,14),(2416,'Bonito','',NULL,1,14),(2417,'Bragan�a','',NULL,1,14),(2418,'Brasil Novo','',NULL,1,14),(2419,'Brejo Grande do Araguaia','',NULL,1,14),(2420,'Breu Branco','',NULL,1,14),(2421,'Breves','',NULL,1,14),(2422,'Bujaru','',NULL,1,14),(2423,'Cachoeira do Arari','',NULL,1,14),(2424,'Cachoeira do Piri�','',NULL,1,14),(2425,'Camet�','',NULL,1,14),(2426,'Cana� dos Caraj�s','',NULL,1,14),(2427,'Capanema','',NULL,1,14),(2428,'Capit�o Po�o','',NULL,1,14),(2429,'Castanhal','',NULL,1,14),(2430,'Chaves','',NULL,1,14),(2431,'Colares','',NULL,1,14),(2432,'Concei��o do Araguaia','',NULL,1,14),(2433,'Conc�rdia do Par�','',NULL,1,14),(2434,'Cumaru do Norte','',NULL,1,14),(2435,'Curion�polis','',NULL,1,14),(2436,'Curralinho','',NULL,1,14),(2437,'Curu�','',NULL,1,14),(2438,'Curu��','',NULL,1,14),(2439,'Dom Eliseu','',NULL,1,14),(2440,'Eldorado dos Caraj�s','',NULL,1,14),(2441,'Faro','',NULL,1,14),(2442,'Floresta do Araguaia','',NULL,1,14),(2443,'Garraf�o do Norte','',NULL,1,14),(2444,'Goian�sia do Par�','',NULL,1,14),(2445,'Gurup�','',NULL,1,14),(2446,'Igarap�-A�u','',NULL,1,14),(2447,'Igarap�-Miri','',NULL,1,14),(2448,'Inhangapi','',NULL,1,14),(2449,'Ipixuna do Par�','',NULL,1,14),(2450,'Irituia','',NULL,1,14),(2451,'Itaituba','',NULL,1,14),(2452,'Itupiranga','',NULL,1,14),(2453,'Jacareacanga','',NULL,1,14),(2454,'Jacund�','',NULL,1,14),(2455,'Juruti','',NULL,1,14),(2456,'Limoeiro do Ajuru','',NULL,1,14),(2457,'M�e do Rio','',NULL,1,14),(2458,'Magalh�es Barata','',NULL,1,14),(2459,'Marab�','',NULL,1,14),(2460,'Maracan�','',NULL,1,14),(2461,'Marapanim','',NULL,1,14),(2462,'Marituba','',NULL,1,14),(2463,'Medicil�ndia','',NULL,1,14),(2464,'Melga�o','',NULL,1,14),(2465,'Mocajuba','',NULL,1,14),(2466,'Moju','',NULL,1,14),(2467,'Monte Alegre','',NULL,1,14),(2468,'Muan�','',NULL,1,14),(2469,'Nova Esperan�a do Piri�','',NULL,1,14),(2470,'Nova Ipixuna','',NULL,1,14),(2471,'Nova Timboteua','',NULL,1,14),(2472,'Novo Progresso','',NULL,1,14),(2473,'Novo Repartimento','',NULL,1,14),(2474,'�bidos','',NULL,1,14),(2475,'Oeiras do Par�','',NULL,1,14),(2476,'Oriximin�','',NULL,1,14),(2477,'Our�m','',NULL,1,14),(2478,'Ouril�ndia do Norte','',NULL,1,14),(2479,'Pacaj�','',NULL,1,14),(2480,'Palestina do Par�','',NULL,1,14),(2481,'Paragominas','',NULL,1,14),(2482,'Parauapebas','',NULL,1,14),(2483,'Pau d`Arco','',NULL,1,14),(2484,'Peixe-Boi','',NULL,1,14),(2485,'Pi�arra','',NULL,1,14),(2486,'Placas','',NULL,1,14),(2487,'Ponta de Pedras','',NULL,1,14),(2488,'Portel','',NULL,1,14),(2489,'Porto de Moz','',NULL,1,14),(2490,'Prainha','',NULL,1,14),(2491,'Primavera','',NULL,1,14),(2492,'Quatipuru','',NULL,1,14),(2493,'Reden��o','',NULL,1,14),(2494,'Rio Maria','',NULL,1,14),(2495,'Rondon do Par�','',NULL,1,14),(2496,'Rur�polis','',NULL,1,14),(2497,'Salin�polis','',NULL,1,14),(2498,'Salvaterra','',NULL,1,14),(2499,'Santa B�rbara do Par�','',NULL,1,14),(2500,'Santa Cruz do Arari','',NULL,1,14),(2501,'Santa Isabel do Par�','',NULL,1,14),(2502,'Santa Luzia do Par�','',NULL,1,14),(2503,'Santa Maria das Barreiras','',NULL,1,14),(2504,'Santa Maria do Par�','',NULL,1,14),(2505,'Santana do Araguaia','',NULL,1,14),(2506,'Santar�m','',NULL,1,14),(2507,'Santar�m Novo','',NULL,1,14),(2508,'Santo Ant�nio do Tau�','',NULL,1,14),(2509,'S�o Caetano de Odivelas','',NULL,1,14),(2510,'S�o Domingos do Araguaia','',NULL,1,14),(2511,'S�o Domingos do Capim','',NULL,1,14),(2512,'S�o F�lix do Xingu','',NULL,1,14),(2513,'S�o Francisco do Par�','',NULL,1,14),(2514,'S�o Geraldo do Araguaia','',NULL,1,14),(2515,'S�o Jo�o da Ponta','',NULL,1,14),(2516,'S�o Jo�o de Pirabas','',NULL,1,14),(2517,'S�o Jo�o do Araguaia','',NULL,1,14),(2518,'S�o Miguel do Guam�','',NULL,1,14),(2519,'S�o Sebasti�o da Boa Vista','',NULL,1,14),(2520,'Sapucaia','',NULL,1,14),(2521,'Senador Jos� Porf�rio','',NULL,1,14),(2522,'Soure','',NULL,1,14),(2523,'Tail�ndia','',NULL,1,14),(2524,'Terra Alta','',NULL,1,14),(2525,'Terra Santa','',NULL,1,14),(2526,'Tom�-A�u','',NULL,1,14),(2527,'Tracuateua','',NULL,1,14),(2528,'Trair�o','',NULL,1,14),(2529,'Tucum�','',NULL,1,14),(2530,'Tucuru�','',NULL,1,14),(2531,'Ulian�polis','',NULL,1,14),(2532,'Uruar�','',NULL,1,14),(2533,'Vigia','',NULL,1,14),(2534,'Viseu','',NULL,1,14),(2535,'Vit�ria do Xingu','',NULL,1,14),(2536,'Xinguara','',NULL,1,14),(2537,'�gua Branca','',NULL,1,15),(2538,'Aguiar','',NULL,1,15),(2539,'Alagoa Grande','',NULL,1,15),(2540,'Alagoa Nova','',NULL,1,15),(2541,'Alagoinha','',NULL,1,15),(2542,'Alcantil','',NULL,1,15),(2543,'Algod�o de Janda�ra','',NULL,1,15),(2544,'Alhandra','',NULL,1,15),(2545,'Amparo','',NULL,1,15),(2546,'Aparecida','',NULL,1,15),(2547,'Ara�agi','',NULL,1,15),(2548,'Arara','',NULL,1,15),(2549,'Araruna','',NULL,1,15),(2550,'Areia','',NULL,1,15),(2551,'Areia de Bara�nas','',NULL,1,15),(2552,'Areial','',NULL,1,15),(2553,'Aroeiras','',NULL,1,15),(2554,'Assun��o','',NULL,1,15),(2555,'Ba�a da Trai��o','',NULL,1,15),(2556,'Bananeiras','',NULL,1,15),(2557,'Bara�na','',NULL,1,15),(2558,'Barra de Santa Rosa','',NULL,1,15),(2559,'Barra de Santana','',NULL,1,15),(2560,'Barra de S�o Miguel','',NULL,1,15),(2561,'Bayeux','',NULL,1,15),(2562,'Bel�m','',NULL,1,15),(2563,'Bel�m do Brejo do Cruz','',NULL,1,15),(2564,'Bernardino Batista','',NULL,1,15),(2565,'Boa Ventura','',NULL,1,15),(2566,'Boa Vista','',NULL,1,15),(2567,'Bom Jesus','',NULL,1,15),(2568,'Bom Sucesso','',NULL,1,15),(2569,'Bonito de Santa F�','',NULL,1,15),(2570,'Boqueir�o','',NULL,1,15),(2571,'Borborema','',NULL,1,15),(2572,'Brejo do Cruz','',NULL,1,15),(2573,'Brejo dos Santos','',NULL,1,15),(2574,'Caapor�','',NULL,1,15),(2575,'Cabaceiras','',NULL,1,15),(2576,'Cabedelo','',NULL,1,15),(2577,'Cachoeira dos �ndios','',NULL,1,15),(2578,'Cacimba de Areia','',NULL,1,15),(2579,'Cacimba de Dentro','',NULL,1,15),(2580,'Cacimbas','',NULL,1,15),(2581,'Cai�ara','',NULL,1,15),(2582,'Cajazeiras','',NULL,1,15),(2583,'Cajazeirinhas','',NULL,1,15),(2584,'Caldas Brand�o','',NULL,1,15),(2585,'Camala�','',NULL,1,15),(2586,'Campina Grande','',NULL,1,15),(2587,'Campo de Santana','',NULL,1,15),(2588,'Capim','',NULL,1,15),(2589,'Cara�bas','',NULL,1,15),(2590,'Carrapateira','',NULL,1,15),(2591,'Casserengue','',NULL,1,15),(2592,'Catingueira','',NULL,1,15),(2593,'Catol� do Rocha','',NULL,1,15),(2594,'Caturit�','',NULL,1,15),(2595,'Concei��o','',NULL,1,15),(2596,'Condado','',NULL,1,15),(2597,'Conde','',NULL,1,15),(2598,'Congo','',NULL,1,15),(2599,'Coremas','',NULL,1,15),(2600,'Coxixola','',NULL,1,15),(2601,'Cruz do Esp�rito Santo','',NULL,1,15),(2602,'Cubati','',NULL,1,15),(2603,'Cuit�','',NULL,1,15),(2604,'Cuit� de Mamanguape','',NULL,1,15),(2605,'Cuitegi','',NULL,1,15),(2606,'Curral de Cima','',NULL,1,15),(2607,'Curral Velho','',NULL,1,15),(2608,'Dami�o','',NULL,1,15),(2609,'Desterro','',NULL,1,15),(2610,'Diamante','',NULL,1,15),(2611,'Dona In�s','',NULL,1,15),(2612,'Duas Estradas','',NULL,1,15),(2613,'Emas','',NULL,1,15),(2614,'Esperan�a','',NULL,1,15),(2615,'Fagundes','',NULL,1,15),(2616,'Frei Martinho','',NULL,1,15),(2617,'Gado Bravo','',NULL,1,15),(2618,'Guarabira','',NULL,1,15),(2619,'Gurinh�m','',NULL,1,15),(2620,'Gurj�o','',NULL,1,15),(2621,'Ibiara','',NULL,1,15),(2622,'Igaracy','',NULL,1,15),(2623,'Imaculada','',NULL,1,15),(2624,'Ing�','',NULL,1,15),(2625,'Itabaiana','',NULL,1,15),(2626,'Itaporanga','',NULL,1,15),(2627,'Itapororoca','',NULL,1,15),(2628,'Itatuba','',NULL,1,15),(2629,'Jacara�','',NULL,1,15),(2630,'Jeric�','',NULL,1,15),(2631,'Jo�o Pessoa','',NULL,1,15),(2632,'Juarez T�vora','',NULL,1,15),(2633,'Juazeirinho','',NULL,1,15),(2634,'Junco do Serid�','',NULL,1,15),(2635,'Juripiranga','',NULL,1,15),(2636,'Juru','',NULL,1,15),(2637,'Lagoa','',NULL,1,15),(2638,'Lagoa de Dentro','',NULL,1,15),(2639,'Lagoa Seca','',NULL,1,15),(2640,'Lastro','',NULL,1,15),(2641,'Livramento','',NULL,1,15),(2642,'Logradouro','',NULL,1,15),(2643,'Lucena','',NULL,1,15),(2644,'M�e d`�gua','',NULL,1,15),(2645,'Malta','',NULL,1,15),(2646,'Mamanguape','',NULL,1,15),(2647,'Mana�ra','',NULL,1,15),(2648,'Marca��o','',NULL,1,15),(2649,'Mari','',NULL,1,15),(2650,'Mariz�polis','',NULL,1,15),(2651,'Massaranduba','',NULL,1,15),(2652,'Mataraca','',NULL,1,15),(2653,'Matinhas','',NULL,1,15),(2654,'Mato Grosso','',NULL,1,15),(2655,'Matur�ia','',NULL,1,15),(2656,'Mogeiro','',NULL,1,15),(2657,'Montadas','',NULL,1,15),(2658,'Monte Horebe','',NULL,1,15),(2659,'Monteiro','',NULL,1,15),(2660,'Mulungu','',NULL,1,15),(2661,'Natuba','',NULL,1,15),(2662,'Nazarezinho','',NULL,1,15),(2663,'Nova Floresta','',NULL,1,15),(2664,'Nova Olinda','',NULL,1,15),(2665,'Nova Palmeira','',NULL,1,15),(2666,'Olho d`�gua','',NULL,1,15),(2667,'Olivedos','',NULL,1,15),(2668,'Ouro Velho','',NULL,1,15),(2669,'Parari','',NULL,1,15),(2670,'Passagem','',NULL,1,15),(2671,'Patos','',NULL,1,15),(2672,'Paulista','',NULL,1,15),(2673,'Pedra Branca','',NULL,1,15),(2674,'Pedra Lavrada','',NULL,1,15),(2675,'Pedras de Fogo','',NULL,1,15),(2676,'Pedro R�gis','',NULL,1,15),(2677,'Pianc�','',NULL,1,15),(2678,'Picu�','',NULL,1,15),(2679,'Pilar','',NULL,1,15),(2680,'Pil�es','',NULL,1,15),(2681,'Pil�ezinhos','',NULL,1,15),(2682,'Pirpirituba','',NULL,1,15),(2683,'Pitimbu','',NULL,1,15),(2684,'Pocinhos','',NULL,1,15),(2685,'Po�o Dantas','',NULL,1,15),(2686,'Po�o de Jos� de Moura','',NULL,1,15),(2687,'Pombal','',NULL,1,15),(2688,'Prata','',NULL,1,15),(2689,'Princesa Isabel','',NULL,1,15),(2690,'Puxinan�','',NULL,1,15),(2691,'Queimadas','',NULL,1,15),(2692,'Quixab�','',NULL,1,15),(2693,'Rem�gio','',NULL,1,15),(2694,'Riach�o','',NULL,1,15),(2695,'Riach�o do Bacamarte','',NULL,1,15),(2696,'Riach�o do Po�o','',NULL,1,15),(2697,'Riacho de Santo Ant�nio','',NULL,1,15),(2698,'Riacho dos Cavalos','',NULL,1,15),(2699,'Rio Tinto','',NULL,1,15),(2700,'Salgadinho','',NULL,1,15),(2701,'Salgado de S�o F�lix','',NULL,1,15),(2702,'Santa Cec�lia','',NULL,1,15),(2703,'Santa Cruz','',NULL,1,15),(2704,'Santa Helena','',NULL,1,15),(2705,'Santa In�s','',NULL,1,15),(2706,'Santa Luzia','',NULL,1,15),(2707,'Santa Rita','',NULL,1,15),(2708,'Santa Teresinha','',NULL,1,15),(2709,'Santana de Mangueira','',NULL,1,15),(2710,'Santana dos Garrotes','',NULL,1,15),(2711,'Santar�m','',NULL,1,15),(2712,'Santo Andr�','',NULL,1,15),(2713,'S�o Bentinho','',NULL,1,15),(2714,'S�o Bento','',NULL,1,15),(2715,'S�o Domingos de Pombal','',NULL,1,15),(2716,'S�o Domingos do Cariri','',NULL,1,15),(2717,'S�o Francisco','',NULL,1,15),(2718,'S�o Jo�o do Cariri','',NULL,1,15),(2719,'S�o Jo�o do Rio do Peixe','',NULL,1,15),(2720,'S�o Jo�o do Tigre','',NULL,1,15),(2721,'S�o Jos� da Lagoa Tapada','',NULL,1,15),(2722,'S�o Jos� de Caiana','',NULL,1,15),(2723,'S�o Jos� de Espinharas','',NULL,1,15),(2724,'S�o Jos� de Piranhas','',NULL,1,15),(2725,'S�o Jos� de Princesa','',NULL,1,15),(2726,'S�o Jos� do Bonfim','',NULL,1,15),(2727,'S�o Jos� do Brejo do Cruz','',NULL,1,15),(2728,'S�o Jos� do Sabugi','',NULL,1,15),(2729,'S�o Jos� dos Cordeiros','',NULL,1,15),(2730,'S�o Jos� dos Ramos','',NULL,1,15),(2731,'S�o Mamede','',NULL,1,15),(2732,'S�o Miguel de Taipu','',NULL,1,15),(2733,'S�o Sebasti�o de Lagoa de Ro�a','',NULL,1,15),(2734,'S�o Sebasti�o do Umbuzeiro','',NULL,1,15),(2735,'Sap�','',NULL,1,15),(2736,'Serid�','',NULL,1,15),(2737,'Serra Branca','',NULL,1,15),(2738,'Serra da Raiz','',NULL,1,15),(2739,'Serra Grande','',NULL,1,15),(2740,'Serra Redonda','',NULL,1,15),(2741,'Serraria','',NULL,1,15),(2742,'Sert�ozinho','',NULL,1,15),(2743,'Sobrado','',NULL,1,15),(2744,'Sol�nea','',NULL,1,15),(2745,'Soledade','',NULL,1,15),(2746,'Soss�go','',NULL,1,15),(2747,'Sousa','',NULL,1,15),(2748,'Sum�','',NULL,1,15),(2749,'Tapero�','',NULL,1,15),(2750,'Tavares','',NULL,1,15),(2751,'Teixeira','',NULL,1,15),(2752,'Ten�rio','',NULL,1,15),(2753,'Triunfo','',NULL,1,15),(2754,'Uira�na','',NULL,1,15),(2755,'Umbuzeiro','',NULL,1,15),(2756,'V�rzea','',NULL,1,15),(2757,'Vieir�polis','',NULL,1,15),(2758,'Vista Serrana','',NULL,1,15),(2759,'Zabel�','',NULL,1,15),(2760,'Abati�','',NULL,1,16),(2761,'Adrian�polis','',NULL,1,16),(2762,'Agudos do Sul','',NULL,1,16),(2763,'Almirante Tamandar�','',NULL,1,16),(2764,'Altamira do Paran�','',NULL,1,16),(2765,'Alto Paran�','',NULL,1,16),(2766,'Alto Piquiri','',NULL,1,16),(2767,'Alt�nia','',NULL,1,16),(2768,'Alvorada do Sul','',NULL,1,16),(2769,'Amapor�','',NULL,1,16),(2770,'Amp�re','',NULL,1,16),(2771,'Anahy','',NULL,1,16),(2772,'Andir�','',NULL,1,16),(2773,'�ngulo','',NULL,1,16),(2774,'Antonina','',NULL,1,16),(2775,'Ant�nio Olinto','',NULL,1,16),(2776,'Apucarana','',NULL,1,16),(2777,'Arapongas','',NULL,1,16),(2778,'Arapoti','',NULL,1,16),(2779,'Arapu�','',NULL,1,16),(2780,'Araruna','',NULL,1,16),(2781,'Arauc�ria','',NULL,1,16),(2782,'Ariranha do Iva�','',NULL,1,16),(2783,'Assa�','',NULL,1,16),(2784,'Assis Chateaubriand','',NULL,1,16),(2785,'Astorga','',NULL,1,16),(2786,'Atalaia','',NULL,1,16),(2787,'Balsa Nova','',NULL,1,16),(2788,'Bandeirantes','',NULL,1,16),(2789,'Barbosa Ferraz','',NULL,1,16),(2790,'Barra do Jacar�','',NULL,1,16),(2791,'Barrac�o','',NULL,1,16),(2792,'Bela Vista da Caroba','',NULL,1,16),(2793,'Bela Vista do Para�so','',NULL,1,16),(2794,'Bituruna','',NULL,1,16),(2795,'Boa Esperan�a','',NULL,1,16),(2796,'Boa Esperan�a do Igua�u','',NULL,1,16),(2797,'Boa Ventura de S�o Roque','',NULL,1,16),(2798,'Boa Vista da Aparecida','',NULL,1,16),(2799,'Bocai�va do Sul','',NULL,1,16),(2800,'Bom Jesus do Sul','',NULL,1,16),(2801,'Bom Sucesso','',NULL,1,16),(2802,'Bom Sucesso do Sul','',NULL,1,16),(2803,'Borraz�polis','',NULL,1,16),(2804,'Braganey','',NULL,1,16),(2805,'Brasil�ndia do Sul','',NULL,1,16),(2806,'Cafeara','',NULL,1,16),(2807,'Cafel�ndia','',NULL,1,16),(2808,'Cafezal do Sul','',NULL,1,16),(2809,'Calif�rnia','',NULL,1,16),(2810,'Cambar�','',NULL,1,16),(2811,'Camb�','',NULL,1,16),(2812,'Cambira','',NULL,1,16),(2813,'Campina da Lagoa','',NULL,1,16),(2814,'Campina do Sim�o','',NULL,1,16),(2815,'Campina Grande do Sul','',NULL,1,16),(2816,'Campo Bonito','',NULL,1,16),(2817,'Campo do Tenente','',NULL,1,16),(2818,'Campo Largo','',NULL,1,16),(2819,'Campo Magro','',NULL,1,16),(2820,'Campo Mour�o','',NULL,1,16),(2821,'C�ndido de Abreu','',NULL,1,16),(2822,'Cand�i','',NULL,1,16),(2823,'Cantagalo','',NULL,1,16),(2824,'Capanema','',NULL,1,16),(2825,'Capit�o Le�nidas Marques','',NULL,1,16),(2826,'Carambe�','',NULL,1,16),(2827,'Carl�polis','',NULL,1,16),(2828,'Cascavel','',NULL,1,16),(2829,'Castro','',NULL,1,16),(2830,'Catanduvas','',NULL,1,16),(2831,'Centen�rio do Sul','',NULL,1,16),(2832,'Cerro Azul','',NULL,1,16),(2833,'C�u Azul','',NULL,1,16),(2834,'Chopinzinho','',NULL,1,16),(2835,'Cianorte','',NULL,1,16),(2836,'Cidade Ga�cha','',NULL,1,16),(2837,'Clevel�ndia','',NULL,1,16),(2838,'Colombo','',NULL,1,16),(2839,'Colorado','',NULL,1,16),(2840,'Congonhinhas','',NULL,1,16),(2841,'Conselheiro Mairinck','',NULL,1,16),(2842,'Contenda','',NULL,1,16),(2843,'Corb�lia','',NULL,1,16),(2844,'Corn�lio Proc�pio','',NULL,1,16),(2845,'Coronel Domingos Soares','',NULL,1,16),(2846,'Coronel Vivida','',NULL,1,16),(2847,'Corumbata� do Sul','',NULL,1,16),(2848,'Cruz Machado','',NULL,1,16),(2849,'Cruzeiro do Igua�u','',NULL,1,16),(2850,'Cruzeiro do Oeste','',NULL,1,16),(2851,'Cruzeiro do Sul','',NULL,1,16),(2852,'Cruzmaltina','',NULL,1,16),(2853,'Curitiba','',NULL,1,16),(2854,'Curi�va','',NULL,1,16),(2855,'Diamante d`Oeste','',NULL,1,16),(2856,'Diamante do Norte','',NULL,1,16),(2857,'Diamante do Sul','',NULL,1,16),(2858,'Dois Vizinhos','',NULL,1,16),(2859,'Douradina','',NULL,1,16),(2860,'Doutor Camargo','',NULL,1,16),(2861,'Doutor Ulysses','',NULL,1,16),(2862,'En�as Marques','',NULL,1,16),(2863,'Engenheiro Beltr�o','',NULL,1,16),(2864,'Entre Rios do Oeste','',NULL,1,16),(2865,'Esperan�a Nova','',NULL,1,16),(2866,'Espig�o Alto do Igua�u','',NULL,1,16),(2867,'Farol','',NULL,1,16),(2868,'Faxinal','',NULL,1,16),(2869,'Fazenda Rio Grande','',NULL,1,16),(2870,'F�nix','',NULL,1,16),(2871,'Fernandes Pinheiro','',NULL,1,16),(2872,'Figueira','',NULL,1,16),(2873,'Flor da Serra do Sul','',NULL,1,16),(2874,'Flora�','',NULL,1,16),(2875,'Floresta','',NULL,1,16),(2876,'Florest�polis','',NULL,1,16),(2877,'Fl�rida','',NULL,1,16),(2878,'Formosa do Oeste','',NULL,1,16),(2879,'Foz do Igua�u','',NULL,1,16),(2880,'Foz do Jord�o','',NULL,1,16),(2881,'Francisco Alves','',NULL,1,16),(2882,'Francisco Beltr�o','',NULL,1,16),(2883,'General Carneiro','',NULL,1,16),(2884,'Godoy Moreira','',NULL,1,16),(2885,'Goioer�','',NULL,1,16),(2886,'Goioxim','',NULL,1,16),(2887,'Grandes Rios','',NULL,1,16),(2888,'Gua�ra','',NULL,1,16),(2889,'Guaira��','',NULL,1,16),(2890,'Guamiranga','',NULL,1,16),(2891,'Guapirama','',NULL,1,16),(2892,'Guaporema','',NULL,1,16),(2893,'Guaraci','',NULL,1,16),(2894,'Guarania�u','',NULL,1,16),(2895,'Guarapuava','',NULL,1,16),(2896,'Guaraque�aba','',NULL,1,16),(2897,'Guaratuba','',NULL,1,16),(2898,'Hon�rio Serpa','',NULL,1,16),(2899,'Ibaiti','',NULL,1,16),(2900,'Ibema','',NULL,1,16),(2901,'Ibipor�','',NULL,1,16),(2902,'Icara�ma','',NULL,1,16),(2903,'Iguara�u','',NULL,1,16),(2904,'Iguatu','',NULL,1,16),(2905,'Imba�','',NULL,1,16),(2906,'Imbituva','',NULL,1,16),(2907,'In�cio Martins','',NULL,1,16),(2908,'Inaj�','',NULL,1,16),(2909,'Indian�polis','',NULL,1,16),(2910,'Ipiranga','',NULL,1,16),(2911,'Ipor�','',NULL,1,16),(2912,'Iracema do Oeste','',NULL,1,16),(2913,'Irati','',NULL,1,16),(2914,'Iretama','',NULL,1,16),(2915,'Itaguaj�','',NULL,1,16),(2916,'Itaipul�ndia','',NULL,1,16),(2917,'Itambarac�','',NULL,1,16),(2918,'Itamb�','',NULL,1,16),(2919,'Itapejara d`Oeste','',NULL,1,16),(2920,'Itaperu�u','',NULL,1,16),(2921,'Ita�na do Sul','',NULL,1,16),(2922,'Iva�','',NULL,1,16),(2923,'Ivaipor�','',NULL,1,16),(2924,'Ivat�','',NULL,1,16),(2925,'Ivatuba','',NULL,1,16),(2926,'Jaboti','',NULL,1,16),(2927,'Jacarezinho','',NULL,1,16),(2928,'Jaguapit�','',NULL,1,16),(2929,'Jaguaria�va','',NULL,1,16),(2930,'Jandaia do Sul','',NULL,1,16),(2931,'Jani�polis','',NULL,1,16),(2932,'Japira','',NULL,1,16),(2933,'Japur�','',NULL,1,16),(2934,'Jardim Alegre','',NULL,1,16),(2935,'Jardim Olinda','',NULL,1,16),(2936,'Jataizinho','',NULL,1,16),(2937,'Jesu�tas','',NULL,1,16),(2938,'Joaquim T�vora','',NULL,1,16),(2939,'Jundia� do Sul','',NULL,1,16),(2940,'Juranda','',NULL,1,16),(2941,'Jussara','',NULL,1,16),(2942,'Kalor�','',NULL,1,16),(2943,'Lapa','',NULL,1,16),(2944,'Laranjal','',NULL,1,16),(2945,'Laranjeiras do Sul','',NULL,1,16),(2946,'Le�polis','',NULL,1,16),(2947,'Lidian�polis','',NULL,1,16),(2948,'Lindoeste','',NULL,1,16),(2949,'Loanda','',NULL,1,16),(2950,'Lobato','',NULL,1,16),(2951,'Londrina','',NULL,1,16),(2952,'Luiziana','',NULL,1,16),(2953,'Lunardelli','',NULL,1,16),(2954,'Lupion�polis','',NULL,1,16),(2955,'Mallet','',NULL,1,16),(2956,'Mambor�','',NULL,1,16),(2957,'Mandagua�u','',NULL,1,16),(2958,'Mandaguari','',NULL,1,16),(2959,'Mandirituba','',NULL,1,16),(2960,'Manfrin�polis','',NULL,1,16),(2961,'Mangueirinha','',NULL,1,16),(2962,'Manoel Ribas','',NULL,1,16),(2963,'Marechal C�ndido Rondon','',NULL,1,16),(2964,'Maria Helena','',NULL,1,16),(2965,'Marialva','',NULL,1,16),(2966,'Maril�ndia do Sul','',NULL,1,16),(2967,'Marilena','',NULL,1,16),(2968,'Mariluz','',NULL,1,16),(2969,'Maring�','',NULL,1,16),(2970,'Mari�polis','',NULL,1,16),(2971,'Marip�','',NULL,1,16),(2972,'Marmeleiro','',NULL,1,16),(2973,'Marquinho','',NULL,1,16),(2974,'Marumbi','',NULL,1,16),(2975,'Matel�ndia','',NULL,1,16),(2976,'Matinhos','',NULL,1,16),(2977,'Mato Rico','',NULL,1,16),(2978,'Mau� da Serra','',NULL,1,16),(2979,'Medianeira','',NULL,1,16),(2980,'Mercedes','',NULL,1,16),(2981,'Mirador','',NULL,1,16),(2982,'Miraselva','',NULL,1,16),(2983,'Missal','',NULL,1,16),(2984,'Moreira Sales','',NULL,1,16),(2985,'Morretes','',NULL,1,16),(2986,'Munhoz de Melo','',NULL,1,16),(2987,'Nossa Senhora das Gra�as','',NULL,1,16),(2988,'Nova Alian�a do Iva�','',NULL,1,16),(2989,'Nova Am�rica da Colina','',NULL,1,16),(2990,'Nova Aurora','',NULL,1,16),(2991,'Nova Cantu','',NULL,1,16),(2992,'Nova Esperan�a','',NULL,1,16),(2993,'Nova Esperan�a do Sudoeste','',NULL,1,16),(2994,'Nova F�tima','',NULL,1,16),(2995,'Nova Laranjeiras','',NULL,1,16),(2996,'Nova Londrina','',NULL,1,16),(2997,'Nova Ol�mpia','',NULL,1,16),(2998,'Nova Prata do Igua�u','',NULL,1,16),(2999,'Nova Santa B�rbara','',NULL,1,16),(3000,'Nova Santa Rosa','',NULL,1,16),(3001,'Nova Tebas','',NULL,1,16),(3002,'Novo Itacolomi','',NULL,1,16),(3003,'Ortigueira','',NULL,1,16),(3004,'Ourizona','',NULL,1,16),(3005,'Ouro Verde do Oeste','',NULL,1,16),(3006,'Pai�andu','',NULL,1,16),(3007,'Palmas','',NULL,1,16),(3008,'Palmeira','',NULL,1,16),(3009,'Palmital','',NULL,1,16),(3010,'Palotina','',NULL,1,16),(3011,'Para�so do Norte','',NULL,1,16),(3012,'Paranacity','',NULL,1,16),(3013,'Paranagu�','',NULL,1,16),(3014,'Paranapoema','',NULL,1,16),(3015,'Paranava�','',NULL,1,16),(3016,'Pato Bragado','',NULL,1,16),(3017,'Pato Branco','',NULL,1,16),(3018,'Paula Freitas','',NULL,1,16),(3019,'Paulo Frontin','',NULL,1,16),(3020,'Peabiru','',NULL,1,16),(3021,'Perobal','',NULL,1,16),(3022,'P�rola','',NULL,1,16),(3023,'P�rola d`Oeste','',NULL,1,16),(3024,'Pi�n','',NULL,1,16),(3025,'Pinhais','',NULL,1,16),(3026,'Pinhal de S�o Bento','',NULL,1,16),(3027,'Pinhal�o','',NULL,1,16),(3028,'Pinh�o','',NULL,1,16),(3029,'Pira� do Sul','',NULL,1,16),(3030,'Piraquara','',NULL,1,16),(3031,'Pitanga','',NULL,1,16),(3032,'Pitangueiras','',NULL,1,16),(3033,'Planaltina do Paran�','',NULL,1,16),(3034,'Planalto','',NULL,1,16),(3035,'Ponta Grossa','',NULL,1,16);
REPLACE INTO `sme_cidade` VALUES (3036,'Pontal do Paran�','',NULL,1,16),(3037,'Porecatu','',NULL,1,16),(3038,'Porto Amazonas','',NULL,1,16),(3039,'Porto Barreiro','',NULL,1,16),(3040,'Porto Rico','',NULL,1,16),(3041,'Porto Vit�ria','',NULL,1,16),(3042,'Prado Ferreira','',NULL,1,16),(3043,'Pranchita','',NULL,1,16),(3044,'Presidente Castelo Branco','',NULL,1,16),(3045,'Primeiro de Maio','',NULL,1,16),(3046,'Prudent�polis','',NULL,1,16),(3047,'Quarto Centen�rio','',NULL,1,16),(3048,'Quatigu�','',NULL,1,16),(3049,'Quatro Barras','',NULL,1,16),(3050,'Quatro Pontes','',NULL,1,16),(3051,'Quedas do Igua�u','',NULL,1,16),(3052,'Quer�ncia do Norte','',NULL,1,16),(3053,'Quinta do Sol','',NULL,1,16),(3054,'Quitandinha','',NULL,1,16),(3055,'Ramil�ndia','',NULL,1,16),(3056,'Rancho Alegre','',NULL,1,16),(3057,'Rancho Alegre d`Oeste','',NULL,1,16),(3058,'Realeza','',NULL,1,16),(3059,'Rebou�as','',NULL,1,16),(3060,'Renascen�a','',NULL,1,16),(3061,'Reserva','',NULL,1,16),(3062,'Reserva do Igua�u','',NULL,1,16),(3063,'Ribeir�o Claro','',NULL,1,16),(3064,'Ribeir�o do Pinhal','',NULL,1,16),(3065,'Rio Azul','',NULL,1,16),(3066,'Rio Bom','',NULL,1,16),(3067,'Rio Bonito do Igua�u','',NULL,1,16),(3068,'Rio Branco do Iva�','',NULL,1,16),(3069,'Rio Branco do Sul','',NULL,1,16),(3070,'Rio Negro','',NULL,1,16),(3071,'Rol�ndia','',NULL,1,16),(3072,'Roncador','',NULL,1,16),(3073,'Rondon','',NULL,1,16),(3074,'Ros�rio do Iva�','',NULL,1,16),(3075,'Sab�udia','',NULL,1,16),(3076,'Salgado Filho','',NULL,1,16),(3077,'Salto do Itarar�','',NULL,1,16),(3078,'Salto do Lontra','',NULL,1,16),(3079,'Santa Am�lia','',NULL,1,16),(3080,'Santa Cec�lia do Pav�o','',NULL,1,16),(3081,'Santa Cruz de Monte Castelo','',NULL,1,16),(3082,'Santa F�','',NULL,1,16),(3083,'Santa Helena','',NULL,1,16),(3084,'Santa In�s','',NULL,1,16),(3085,'Santa Isabel do Iva�','',NULL,1,16),(3086,'Santa Izabel do Oeste','',NULL,1,16),(3087,'Santa L�cia','',NULL,1,16),(3088,'Santa Maria do Oeste','',NULL,1,16),(3089,'Santa Mariana','',NULL,1,16),(3090,'Santa M�nica','',NULL,1,16),(3091,'Santa Tereza do Oeste','',NULL,1,16),(3092,'Santa Terezinha de Itaipu','',NULL,1,16),(3093,'Santana do Itarar�','',NULL,1,16),(3094,'Santo Ant�nio da Platina','',NULL,1,16),(3095,'Santo Ant�nio do Caiu�','',NULL,1,16),(3096,'Santo Ant�nio do Para�so','',NULL,1,16),(3097,'Santo Ant�nio do Sudoeste','',NULL,1,16),(3098,'Santo In�cio','',NULL,1,16),(3099,'S�o Carlos do Iva�','',NULL,1,16),(3100,'S�o Jer�nimo da Serra','',NULL,1,16),(3101,'S�o Jo�o','',NULL,1,16),(3102,'S�o Jo�o do Caiu�','',NULL,1,16),(3103,'S�o Jo�o do Iva�','',NULL,1,16),(3104,'S�o Jo�o do Triunfo','',NULL,1,16),(3105,'S�o Jorge d`Oeste','',NULL,1,16),(3106,'S�o Jorge do Iva�','',NULL,1,16),(3107,'S�o Jorge do Patroc�nio','',NULL,1,16),(3108,'S�o Jos� da Boa Vista','',NULL,1,16),(3109,'S�o Jos� das Palmeiras','',NULL,1,16),(3110,'S�o Jos� dos Pinhais','',NULL,1,16),(3111,'S�o Manoel do Paran�','',NULL,1,16),(3112,'S�o Mateus do Sul','',NULL,1,16),(3113,'S�o Miguel do Igua�u','',NULL,1,16),(3114,'S�o Pedro do Igua�u','',NULL,1,16),(3115,'S�o Pedro do Iva�','',NULL,1,16),(3116,'S�o Pedro do Paran�','',NULL,1,16),(3117,'S�o Sebasti�o da Amoreira','',NULL,1,16),(3118,'S�o Tom�','',NULL,1,16),(3119,'Sapopema','',NULL,1,16),(3120,'Sarandi','',NULL,1,16),(3121,'Saudade do Igua�u','',NULL,1,16),(3122,'Seng�s','',NULL,1,16),(3123,'Serran�polis do Igua�u','',NULL,1,16),(3124,'Sertaneja','',NULL,1,16),(3125,'Sertan�polis','',NULL,1,16),(3126,'Siqueira Campos','',NULL,1,16),(3127,'Sulina','',NULL,1,16),(3128,'Tamarana','',NULL,1,16),(3129,'Tamboara','',NULL,1,16),(3130,'Tapejara','',NULL,1,16),(3131,'Tapira','',NULL,1,16),(3132,'Teixeira Soares','',NULL,1,16),(3133,'Tel�maco Borba','',NULL,1,16),(3134,'Terra Boa','',NULL,1,16),(3135,'Terra Rica','',NULL,1,16),(3136,'Terra Roxa','',NULL,1,16),(3137,'Tibagi','',NULL,1,16),(3138,'Tijucas do Sul','',NULL,1,16),(3139,'Toledo','',NULL,1,16),(3140,'Tomazina','',NULL,1,16),(3141,'Tr�s Barras do Paran�','',NULL,1,16),(3142,'Tunas do Paran�','',NULL,1,16),(3143,'Tuneiras do Oeste','',NULL,1,16),(3144,'Tup�ssi','',NULL,1,16),(3145,'Turvo','',NULL,1,16),(3146,'Ubirat�','',NULL,1,16),(3147,'Umuarama','',NULL,1,16),(3148,'Uni�o da Vit�ria','',NULL,1,16),(3149,'Uniflor','',NULL,1,16),(3150,'Ura�','',NULL,1,16),(3151,'Ventania','',NULL,1,16),(3152,'Vera Cruz do Oeste','',NULL,1,16),(3153,'Ver�','',NULL,1,16),(3154,'Vila Alta','',NULL,1,16),(3155,'Virmond','',NULL,1,16),(3156,'Vitorino','',NULL,1,16),(3157,'Wenceslau Braz','',NULL,1,16),(3158,'Xambr�','',NULL,1,16),(3159,'Abreu e Lima','',NULL,1,17),(3160,'Afogados da Ingazeira','',NULL,1,17),(3161,'Afr�nio','',NULL,1,17),(3162,'Agrestina','',NULL,1,17),(3163,'�gua Preta','',NULL,1,17),(3164,'�guas Belas','',NULL,1,17),(3165,'Alagoinha','',NULL,1,17),(3166,'Alian�a','',NULL,1,17),(3167,'Altinho','',NULL,1,17),(3168,'Amaraji','',NULL,1,17),(3169,'Angelim','',NULL,1,17),(3170,'Ara�oiaba','',NULL,1,17),(3171,'Araripina','',NULL,1,17),(3172,'Arcoverde','',NULL,1,17),(3173,'Barra de Guabiraba','',NULL,1,17),(3174,'Barreiros','',NULL,1,17),(3175,'Bel�m de Maria','',NULL,1,17),(3176,'Bel�m de S�o Francisco','',NULL,1,17),(3177,'Belo Jardim','',NULL,1,17),(3178,'Bet�nia','',NULL,1,17),(3179,'Bezerros','',NULL,1,17),(3180,'Bodoc�','',NULL,1,17),(3181,'Bom Conselho','',NULL,1,17),(3182,'Bom Jardim','',NULL,1,17),(3183,'Bonito','',NULL,1,17),(3184,'Brej�o','',NULL,1,17),(3185,'Brejinho','',NULL,1,17),(3186,'Brejo da Madre de Deus','',NULL,1,17),(3187,'Buenos Aires','',NULL,1,17),(3188,'Bu�que','',NULL,1,17),(3189,'Cabo de Santo Agostinho','',NULL,1,17),(3190,'Cabrob�','',NULL,1,17),(3191,'Cachoeirinha','',NULL,1,17),(3192,'Caet�s','',NULL,1,17),(3193,'Cal�ado','',NULL,1,17),(3194,'Calumbi','',NULL,1,17),(3195,'Camaragibe','',NULL,1,17),(3196,'Camocim de S�o F�lix','',NULL,1,17),(3197,'Camutanga','',NULL,1,17),(3198,'Canhotinho','',NULL,1,17),(3199,'Capoeiras','',NULL,1,17),(3200,'Carna�ba','',NULL,1,17),(3201,'Carnaubeira da Penha','',NULL,1,17),(3202,'Carpina','',NULL,1,17),(3203,'Caruaru','',NULL,1,17),(3204,'Casinhas','',NULL,1,17),(3205,'Catende','',NULL,1,17),(3206,'Cedro','',NULL,1,17),(3207,'Ch� de Alegria','',NULL,1,17),(3208,'Ch� Grande','',NULL,1,17),(3209,'Condado','',NULL,1,17),(3210,'Correntes','',NULL,1,17),(3211,'Cort�s','',NULL,1,17),(3212,'Cumaru','',NULL,1,17),(3213,'Cupira','',NULL,1,17),(3214,'Cust�dia','',NULL,1,17),(3215,'Dormentes','',NULL,1,17),(3216,'Escada','',NULL,1,17),(3217,'Exu','',NULL,1,17),(3218,'Feira Nova','',NULL,1,17),(3219,'Fernando de Noronha','',NULL,1,17),(3220,'Ferreiros','',NULL,1,17),(3221,'Flores','',NULL,1,17),(3222,'Floresta','',NULL,1,17),(3223,'Frei Miguelinho','',NULL,1,17),(3224,'Gameleira','',NULL,1,17),(3225,'Garanhuns','',NULL,1,17),(3226,'Gl�ria do Goit�','',NULL,1,17),(3227,'Goiana','',NULL,1,17),(3228,'Granito','',NULL,1,17),(3229,'Gravat�','',NULL,1,17),(3230,'Iati','',NULL,1,17),(3231,'Ibimirim','',NULL,1,17),(3232,'Ibirajuba','',NULL,1,17),(3233,'Igarassu','',NULL,1,17),(3234,'Iguaraci','',NULL,1,17),(3235,'Inaj�','',NULL,1,17),(3236,'Ingazeira','',NULL,1,17),(3237,'Ipojuca','',NULL,1,17),(3238,'Ipubi','',NULL,1,17),(3239,'Itacuruba','',NULL,1,17),(3240,'Ita�ba','',NULL,1,17),(3241,'Itamarac�','',NULL,1,17),(3242,'Itamb�','',NULL,1,17),(3243,'Itapetim','',NULL,1,17),(3244,'Itapissuma','',NULL,1,17),(3245,'Itaquitinga','',NULL,1,17),(3246,'Jaboat�o dos Guararapes','',NULL,1,17),(3247,'Jaqueira','',NULL,1,17),(3248,'Jata�ba','',NULL,1,17),(3249,'Jatob�','',NULL,1,17),(3250,'Jo�o Alfredo','',NULL,1,17),(3251,'Joaquim Nabuco','',NULL,1,17),(3252,'Jucati','',NULL,1,17),(3253,'Jupi','',NULL,1,17),(3254,'Jurema','',NULL,1,17),(3255,'Lagoa do Carro','',NULL,1,17),(3256,'Lagoa do Itaenga','',NULL,1,17),(3257,'Lagoa do Ouro','',NULL,1,17),(3258,'Lagoa dos Gatos','',NULL,1,17),(3259,'Lagoa Grande','',NULL,1,17),(3260,'Lajedo','',NULL,1,17),(3261,'Limoeiro','',NULL,1,17),(3262,'Macaparana','',NULL,1,17),(3263,'Machados','',NULL,1,17),(3264,'Manari','',NULL,1,17),(3265,'Maraial','',NULL,1,17),(3266,'Mirandiba','',NULL,1,17),(3267,'Moreil�ndia','',NULL,1,17),(3268,'Moreno','',NULL,1,17),(3269,'Nazar� da Mata','',NULL,1,17),(3270,'Olinda','',NULL,1,17),(3271,'Orob�','',NULL,1,17),(3272,'Oroc�','',NULL,1,17),(3273,'Ouricuri','',NULL,1,17),(3274,'Palmares','',NULL,1,17),(3275,'Palmeirina','',NULL,1,17),(3276,'Panelas','',NULL,1,17),(3277,'Paranatama','',NULL,1,17),(3278,'Parnamirim','',NULL,1,17),(3279,'Passira','',NULL,1,17),(3280,'Paudalho','',NULL,1,17),(3281,'Paulista','',NULL,1,17),(3282,'Pedra','',NULL,1,17),(3283,'Pesqueira','',NULL,1,17),(3284,'Petrol�ndia','',NULL,1,17),(3285,'Petrolina','',NULL,1,17),(3286,'Po��o','',NULL,1,17),(3287,'Pombos','',NULL,1,17),(3288,'Primavera','',NULL,1,17),(3289,'Quipap�','',NULL,1,17),(3290,'Quixaba','',NULL,1,17),(3291,'Recife','',NULL,1,17),(3292,'Riacho das Almas','',NULL,1,17),(3293,'Ribeir�o','',NULL,1,17),(3294,'Rio Formoso','',NULL,1,17),(3295,'Sair�','',NULL,1,17),(3296,'Salgadinho','',NULL,1,17),(3297,'Salgueiro','',NULL,1,17),(3298,'Salo�','',NULL,1,17),(3299,'Sanhar�','',NULL,1,17),(3300,'Santa Cruz','',NULL,1,17),(3301,'Santa Cruz da Baixa Verde','',NULL,1,17),(3302,'Santa Cruz do Capibaribe','',NULL,1,17),(3303,'Santa Filomena','',NULL,1,17),(3304,'Santa Maria da Boa Vista','',NULL,1,17),(3305,'Santa Maria do Cambuc�','',NULL,1,17),(3306,'Santa Terezinha','',NULL,1,17),(3307,'S�o Benedito do Sul','',NULL,1,17),(3308,'S�o Bento do Una','',NULL,1,17),(3309,'S�o Caitano','',NULL,1,17),(3310,'S�o Jo�o','',NULL,1,17),(3311,'S�o Joaquim do Monte','',NULL,1,17),(3312,'S�o Jos� da Coroa Grande','',NULL,1,17),(3313,'S�o Jos� do Belmonte','',NULL,1,17),(3314,'S�o Jos� do Egito','',NULL,1,17),(3315,'S�o Louren�o da Mata','',NULL,1,17),(3316,'S�o Vicente Ferrer','',NULL,1,17),(3317,'Serra Talhada','',NULL,1,17),(3318,'Serrita','',NULL,1,17),(3319,'Sert�nia','',NULL,1,17),(3320,'Sirinha�m','',NULL,1,17),(3321,'Solid�o','',NULL,1,17),(3322,'Surubim','',NULL,1,17),(3323,'Tabira','',NULL,1,17),(3324,'Tacaimb�','',NULL,1,17),(3325,'Tacaratu','',NULL,1,17),(3326,'Tamandar�','',NULL,1,17),(3327,'Taquaritinga do Norte','',NULL,1,17),(3328,'Terezinha','',NULL,1,17),(3329,'Terra Nova','',NULL,1,17),(3330,'Timba�ba','',NULL,1,17),(3331,'Toritama','',NULL,1,17),(3332,'Tracunha�m','',NULL,1,17),(3333,'Trindade','',NULL,1,17),(3334,'Triunfo','',NULL,1,17),(3335,'Tupanatinga','',NULL,1,17),(3336,'Tuparetama','',NULL,1,17),(3337,'Venturosa','',NULL,1,17),(3338,'Verdejante','',NULL,1,17),(3339,'Vertente do L�rio','',NULL,1,17),(3340,'Vertentes','',NULL,1,17),(3341,'Vic�ncia','',NULL,1,17),(3342,'Vit�ria de Santo Ant�o','',NULL,1,17),(3343,'Xex�u','',NULL,1,17),(3344,'Acau�','',NULL,1,18),(3345,'Agricol�ndia','',NULL,1,18),(3346,'�gua Branca','',NULL,1,18),(3347,'Alagoinha do Piau�','',NULL,1,18),(3348,'Alegrete do Piau�','',NULL,1,18),(3349,'Alto Long�','',NULL,1,18),(3350,'Altos','',NULL,1,18),(3351,'Alvorada do Gurgu�ia','',NULL,1,18),(3352,'Amarante','',NULL,1,18),(3353,'Angical do Piau�','',NULL,1,18),(3354,'An�sio de Abreu','',NULL,1,18),(3355,'Ant�nio Almeida','',NULL,1,18),(3356,'Aroazes','',NULL,1,18),(3357,'Arraial','',NULL,1,18),(3358,'Assun��o do Piau�','',NULL,1,18),(3359,'Avelino Lopes','',NULL,1,18),(3360,'Baixa Grande do Ribeiro','',NULL,1,18),(3361,'Barra d`Alc�ntara','',NULL,1,18),(3362,'Barras','',NULL,1,18),(3363,'Barreiras do Piau�','',NULL,1,18),(3364,'Barro Duro','',NULL,1,18),(3365,'Batalha','',NULL,1,18),(3366,'Bela Vista do Piau�','',NULL,1,18),(3367,'Bel�m do Piau�','',NULL,1,18),(3368,'Beneditinos','',NULL,1,18),(3369,'Bertol�nia','',NULL,1,18),(3370,'Bet�nia do Piau�','',NULL,1,18),(3371,'Boa Hora','',NULL,1,18),(3372,'Bocaina','',NULL,1,18),(3373,'Bom Jesus','',NULL,1,18),(3374,'Bom Princ�pio do Piau�','',NULL,1,18),(3375,'Bonfim do Piau�','',NULL,1,18),(3376,'Boqueir�o do Piau�','',NULL,1,18),(3377,'Brasileira','',NULL,1,18),(3378,'Brejo do Piau�','',NULL,1,18),(3379,'Buriti dos Lopes','',NULL,1,18),(3380,'Buriti dos Montes','',NULL,1,18),(3381,'Cabeceiras do Piau�','',NULL,1,18),(3382,'Cajazeiras do Piau�','',NULL,1,18),(3383,'Cajueiro da Praia','',NULL,1,18),(3384,'Caldeir�o Grande do Piau�','',NULL,1,18),(3385,'Campinas do Piau�','',NULL,1,18),(3386,'Campo Alegre do Fidalgo','',NULL,1,18),(3387,'Campo Grande do Piau�','',NULL,1,18),(3388,'Campo Largo do Piau�','',NULL,1,18),(3389,'Campo Maior','',NULL,1,18),(3390,'Canavieira','',NULL,1,18),(3391,'Canto do Buriti','',NULL,1,18),(3392,'Capit�o de Campos','',NULL,1,18),(3393,'Capit�o Gerv�sio Oliveira','',NULL,1,18),(3394,'Caracol','',NULL,1,18),(3395,'Cara�bas do Piau�','',NULL,1,18),(3396,'Caridade do Piau�','',NULL,1,18),(3397,'Castelo do Piau�','',NULL,1,18),(3398,'Caxing�','',NULL,1,18),(3399,'Cocal','',NULL,1,18),(3400,'Cocal de Telha','',NULL,1,18),(3401,'Cocal dos Alves','',NULL,1,18),(3402,'Coivaras','',NULL,1,18),(3403,'Col�nia do Gurgu�ia','',NULL,1,18),(3404,'Col�nia do Piau�','',NULL,1,18),(3405,'Concei��o do Canind�','',NULL,1,18),(3406,'Coronel Jos� Dias','',NULL,1,18),(3407,'Corrente','',NULL,1,18),(3408,'Cristal�ndia do Piau�','',NULL,1,18),(3409,'Cristino Castro','',NULL,1,18),(3410,'Curimat�','',NULL,1,18),(3411,'Currais','',NULL,1,18),(3412,'Curral Novo do Piau�','',NULL,1,18),(3413,'Curralinhos','',NULL,1,18),(3414,'Demerval Lob�o','',NULL,1,18),(3415,'Dirceu Arcoverde','',NULL,1,18),(3416,'Dom Expedito Lopes','',NULL,1,18),(3417,'Dom Inoc�ncio','',NULL,1,18),(3418,'Domingos Mour�o','',NULL,1,18),(3419,'Elesb�o Veloso','',NULL,1,18),(3420,'Eliseu Martins','',NULL,1,18),(3421,'Esperantina','',NULL,1,18),(3422,'Fartura do Piau�','',NULL,1,18),(3423,'Flores do Piau�','',NULL,1,18),(3424,'Floresta do Piau�','',NULL,1,18),(3425,'Floriano','',NULL,1,18),(3426,'Francin�polis','',NULL,1,18),(3427,'Francisco Ayres','',NULL,1,18),(3428,'Francisco Macedo','',NULL,1,18),(3429,'Francisco Santos','',NULL,1,18),(3430,'Fronteiras','',NULL,1,18),(3431,'Geminiano','',NULL,1,18),(3432,'Gilbu�s','',NULL,1,18),(3433,'Guadalupe','',NULL,1,18),(3434,'Guaribas','',NULL,1,18),(3435,'Hugo Napole�o','',NULL,1,18),(3436,'Ilha Grande','',NULL,1,18),(3437,'Inhuma','',NULL,1,18),(3438,'Ipiranga do Piau�','',NULL,1,18),(3439,'Isa�as Coelho','',NULL,1,18),(3440,'Itain�polis','',NULL,1,18),(3441,'Itaueira','',NULL,1,18),(3442,'Jacobina do Piau�','',NULL,1,18),(3443,'Jaic�s','',NULL,1,18),(3444,'Jardim do Mulato','',NULL,1,18),(3445,'Jatob� do Piau�','',NULL,1,18),(3446,'Jerumenha','',NULL,1,18),(3447,'Jo�o Costa','',NULL,1,18),(3448,'Joaquim Pires','',NULL,1,18),(3449,'Joca Marques','',NULL,1,18),(3450,'Jos� de Freitas','',NULL,1,18),(3451,'Juazeiro do Piau�','',NULL,1,18),(3452,'J�lio Borges','',NULL,1,18),(3453,'Jurema','',NULL,1,18),(3454,'Lagoa Alegre','',NULL,1,18),(3455,'Lagoa de S�o Francisco','',NULL,1,18),(3456,'Lagoa do Barro do Piau�','',NULL,1,18),(3457,'Lagoa do Piau�','',NULL,1,18),(3458,'Lagoa do S�tio','',NULL,1,18),(3459,'Lagoinha do Piau�','',NULL,1,18),(3460,'Landri Sales','',NULL,1,18),(3461,'Lu�s Correia','',NULL,1,18),(3462,'Luzil�ndia','',NULL,1,18),(3463,'Madeiro','',NULL,1,18),(3464,'Manoel Em�dio','',NULL,1,18),(3465,'Marcol�ndia','',NULL,1,18),(3466,'Marcos Parente','',NULL,1,18),(3467,'Massap� do Piau�','',NULL,1,18),(3468,'Matias Ol�mpio','',NULL,1,18),(3469,'Miguel Alves','',NULL,1,18),(3470,'Miguel Le�o','',NULL,1,18),(3471,'Milton Brand�o','',NULL,1,18),(3472,'Monsenhor Gil','',NULL,1,18),(3473,'Monsenhor Hip�lito','',NULL,1,18),(3474,'Monte Alegre do Piau�','',NULL,1,18),(3475,'Morro Cabe�a no Tempo','',NULL,1,18),(3476,'Morro do Chap�u do Piau�','',NULL,1,18),(3477,'Murici dos Portelas','',NULL,1,18),(3478,'Nazar� do Piau�','',NULL,1,18),(3479,'Nossa Senhora de Nazar�','',NULL,1,18),(3480,'Nossa Senhora dos Rem�dios','',NULL,1,18),(3481,'Nova Santa Rita','',NULL,1,18),(3482,'Novo Oriente do Piau�','',NULL,1,18),(3483,'Novo Santo Ant�nio','',NULL,1,18),(3484,'Oeiras','',NULL,1,18),(3485,'Olho d`�gua do Piau�','',NULL,1,18),(3486,'Padre Marcos','',NULL,1,18),(3487,'Paes Landim','',NULL,1,18),(3488,'Paje� do Piau�','',NULL,1,18),(3489,'Palmeira do Piau�','',NULL,1,18),(3490,'Palmeirais','',NULL,1,18),(3491,'Paquet�','',NULL,1,18),(3492,'Parnagu�','',NULL,1,18),(3493,'Parna�ba','',NULL,1,18),(3494,'Passagem Franca do Piau�','',NULL,1,18),(3495,'Patos do Piau�','',NULL,1,18),(3496,'Paulistana','',NULL,1,18),(3497,'Pavussu','',NULL,1,18),(3498,'Pedro II','',NULL,1,18),(3499,'Pedro Laurentino','',NULL,1,18),(3500,'Picos','',NULL,1,18),(3501,'Pimenteiras','',NULL,1,18),(3502,'Pio IX','',NULL,1,18),(3503,'Piracuruca','',NULL,1,18),(3504,'Piripiri','',NULL,1,18),(3505,'Porto','',NULL,1,18),(3506,'Porto Alegre do Piau�','',NULL,1,18),(3507,'Prata do Piau�','',NULL,1,18),(3508,'Queimada Nova','',NULL,1,18),(3509,'Reden��o do Gurgu�ia','',NULL,1,18),(3510,'Regenera��o','',NULL,1,18),(3511,'Riacho Frio','',NULL,1,18),(3512,'Ribeira do Piau�','',NULL,1,18),(3513,'Ribeiro Gon�alves','',NULL,1,18),(3514,'Rio Grande do Piau�','',NULL,1,18),(3515,'Santa Cruz do Piau�','',NULL,1,18),(3516,'Santa Cruz dos Milagres','',NULL,1,18),(3517,'Santa Filomena','',NULL,1,18),(3518,'Santa Luz','',NULL,1,18),(3519,'Santa Rosa do Piau�','',NULL,1,18),(3520,'Santana do Piau�','',NULL,1,18),(3521,'Santo Ant�nio de Lisboa','',NULL,1,18),(3522,'Santo Ant�nio dos Milagres','',NULL,1,18),(3523,'Santo In�cio do Piau�','',NULL,1,18),(3524,'S�o Braz do Piau�','',NULL,1,18),(3525,'S�o F�lix do Piau�','',NULL,1,18),(3526,'S�o Francisco de Assis do Piau�','',NULL,1,18),(3527,'S�o Francisco do Piau�','',NULL,1,18),(3528,'S�o Gon�alo do Gurgu�ia','',NULL,1,18),(3529,'S�o Gon�alo do Piau�','',NULL,1,18),(3530,'S�o Jo�o da Canabrava','',NULL,1,18),(3531,'S�o Jo�o da Fronteira','',NULL,1,18),(3532,'S�o Jo�o da Serra','',NULL,1,18),(3533,'S�o Jo�o da Varjota','',NULL,1,18),(3534,'S�o Jo�o do Arraial','',NULL,1,18),(3535,'S�o Jo�o do Piau�','',NULL,1,18),(3536,'S�o Jos� do Divino','',NULL,1,18),(3537,'S�o Jos� do Peixe','',NULL,1,18),(3538,'S�o Jos� do Piau�','',NULL,1,18),(3539,'S�o Juli�o','',NULL,1,18),(3540,'S�o Louren�o do Piau�','',NULL,1,18),(3541,'S�o Luis do Piau�','',NULL,1,18),(3542,'S�o Miguel da Baixa Grande','',NULL,1,18),(3543,'S�o Miguel do Fidalgo','',NULL,1,18),(3544,'S�o Miguel do Tapuio','',NULL,1,18),(3545,'S�o Pedro do Piau�','',NULL,1,18),(3546,'S�o Raimundo Nonato','',NULL,1,18),(3547,'Sebasti�o Barros','',NULL,1,18),(3548,'Sebasti�o Leal','',NULL,1,18),(3549,'Sigefredo Pacheco','',NULL,1,18),(3550,'Sim�es','',NULL,1,18),(3551,'Simpl�cio Mendes','',NULL,1,18),(3552,'Socorro do Piau�','',NULL,1,18),(3553,'Sussuapara','',NULL,1,18),(3554,'Tamboril do Piau�','',NULL,1,18),(3555,'Tanque do Piau�','',NULL,1,18),(3556,'Teresina','',NULL,1,18),(3557,'Uni�o','',NULL,1,18),(3558,'Uru�u�','',NULL,1,18),(3559,'Valen�a do Piau�','',NULL,1,18),(3560,'V�rzea Branca','',NULL,1,18),(3561,'V�rzea Grande','',NULL,1,18),(3562,'Vera Mendes','',NULL,1,18),(3563,'Vila Nova do Piau�','',NULL,1,18),(3564,'Wall Ferraz','',NULL,1,18),(3565,'Angra dos Reis','',NULL,1,19),(3566,'Aperib�','',NULL,1,19),(3567,'Araruama','',NULL,1,19),(3568,'Areal','',NULL,1,19),(3569,'Arma��o dos B�zios','',NULL,1,19),(3570,'Arraial do Cabo','',NULL,1,19),(3571,'Barra do Pira�','',NULL,1,19),(3572,'Barra Mansa','',NULL,1,19),(3573,'Belford Roxo','',NULL,1,19),(3574,'Bom Jardim','',NULL,1,19),(3575,'Bom Jesus do Itabapoana','',NULL,1,19),(3576,'Cabo Frio','',NULL,1,19),(3577,'Cachoeiras de Macacu','',NULL,1,19),(3578,'Cambuci','',NULL,1,19),(3579,'Campos dos Goytacazes','',NULL,1,19),(3580,'Cantagalo','',NULL,1,19),(3581,'Carapebus','',NULL,1,19),(3582,'Cardoso Moreira','',NULL,1,19),(3583,'Carmo','',NULL,1,19),(3584,'Casimiro de Abreu','',NULL,1,19),(3585,'Comendador Levy Gasparian','',NULL,1,19),(3586,'Concei��o de Macabu','',NULL,1,19),(3587,'Cordeiro','',NULL,1,19),(3588,'Duas Barras','',NULL,1,19),(3589,'Duque de Caxias','',NULL,1,19),(3590,'Engenheiro Paulo de Frontin','',NULL,1,19),(3591,'Guapimirim','',NULL,1,19),(3592,'Iguaba Grande','',NULL,1,19),(3593,'Itabora�','',NULL,1,19),(3594,'Itagua�','',NULL,1,19),(3595,'Italva','',NULL,1,19),(3596,'Itaocara','',NULL,1,19),(3597,'Itaperuna','',NULL,1,19),(3598,'Itatiaia','',NULL,1,19),(3599,'Japeri','',NULL,1,19),(3600,'Laje do Muria�','',NULL,1,19),(3601,'Maca�','',NULL,1,19),(3602,'Macuco','',NULL,1,19),(3603,'Mag�','',NULL,1,19),(3604,'Mangaratiba','',NULL,1,19),(3605,'Maric�','',NULL,1,19),(3606,'Mendes','',NULL,1,19),(3607,'Miguel Pereira','',NULL,1,19),(3608,'Miracema','',NULL,1,19),(3609,'Natividade','',NULL,1,19),(3610,'Nil�polis','',NULL,1,19),(3611,'Niter�i','',NULL,1,19),(3612,'Nova Friburgo','',NULL,1,19),(3613,'Nova Igua�u','',NULL,1,19),(3614,'Paracambi','',NULL,1,19),(3615,'Para�ba do Sul','',NULL,1,19),(3616,'Parati','',NULL,1,19),(3617,'Paty do Alferes','',NULL,1,19),(3618,'Petr�polis','',NULL,1,19),(3619,'Pinheiral','',NULL,1,19),(3620,'Pira�','',NULL,1,19),(3621,'Porci�ncula','',NULL,1,19),(3622,'Porto Real','',NULL,1,19),(3623,'Quatis','',NULL,1,19),(3624,'Queimados','',NULL,1,19),(3625,'Quissam�','',NULL,1,19),(3626,'Resende','',NULL,1,19),(3627,'Rio Bonito','',NULL,1,19),(3628,'Rio Claro','',NULL,1,19),(3629,'Rio das Flores','',NULL,1,19),(3630,'Rio das Ostras','',NULL,1,19),(3631,'Rio de Janeiro','',NULL,1,19),(3632,'Santa Maria Madalena','',NULL,1,19),(3633,'Santo Ant�nio de P�dua','',NULL,1,19),(3634,'S�o Fid�lis','',NULL,1,19),(3635,'S�o Francisco de Itabapoana','',NULL,1,19),(3636,'S�o Gon�alo','',NULL,1,19),(3637,'S�o Jo�o da Barra','',NULL,1,19),(3638,'S�o Jo�o de Meriti','',NULL,1,19),(3639,'S�o Jos� de Ub�','',NULL,1,19),(3640,'S�o Jos� do Vale do Rio Preto','',NULL,1,19),(3641,'S�o Pedro da Aldeia','',NULL,1,19),(3642,'S�o Sebasti�o do Alto','',NULL,1,19),(3643,'Sapucaia','',NULL,1,19),(3644,'Saquarema','',NULL,1,19),(3645,'Serop�dica','',NULL,1,19),(3646,'Silva Jardim','',NULL,1,19),(3647,'Sumidouro','',NULL,1,19),(3648,'Tangu�','',NULL,1,19),(3649,'Teres�polis','',NULL,1,19),(3650,'Trajano de Morais','',NULL,1,19),(3651,'Tr�s Rios','',NULL,1,19),(3652,'Valen�a','',NULL,1,19),(3653,'Varre-Sai','',NULL,1,19),(3654,'Vassouras','',NULL,1,19),(3655,'Volta Redonda','',NULL,1,19),(3656,'Acari','',NULL,1,20),(3657,'A�u','',NULL,1,20),(3658,'Afonso Bezerra','',NULL,1,20),(3659,'�gua Nova','',NULL,1,20),(3660,'Alexandria','',NULL,1,20),(3661,'Almino Afonso','',NULL,1,20),(3662,'Alto do Rodrigues','',NULL,1,20),(3663,'Angicos','',NULL,1,20),(3664,'Ant�nio Martins','',NULL,1,20),(3665,'Apodi','',NULL,1,20),(3666,'Areia Branca','',NULL,1,20),(3667,'Ar�s','',NULL,1,20),(3668,'Augusto Severo','',NULL,1,20),(3669,'Ba�a Formosa','',NULL,1,20),(3670,'Bara�na','',NULL,1,20),(3671,'Barcelona','',NULL,1,20),(3672,'Bento Fernandes','',NULL,1,20),(3673,'Bod�','',NULL,1,20),(3674,'Bom Jesus','',NULL,1,20),(3675,'Brejinho','',NULL,1,20),(3676,'Cai�ara do Norte','',NULL,1,20),(3677,'Cai�ara do Rio do Vento','',NULL,1,20),(3678,'Caic�','',NULL,1,20),(3679,'Campo Redondo','',NULL,1,20),(3680,'Canguaretama','',NULL,1,20),(3681,'Cara�bas','',NULL,1,20),(3682,'Carna�ba dos Dantas','',NULL,1,20),(3683,'Carnaubais','',NULL,1,20),(3684,'Cear�-Mirim','',NULL,1,20),(3685,'Cerro Cor�','',NULL,1,20),(3686,'Coronel Ezequiel','',NULL,1,20),(3687,'Coronel Jo�o Pessoa','',NULL,1,20),(3688,'Cruzeta','',NULL,1,20),(3689,'Currais Novos','',NULL,1,20),(3690,'Doutor Severiano','',NULL,1,20),(3691,'Encanto','',NULL,1,20),(3692,'Equador','',NULL,1,20),(3693,'Esp�rito Santo','',NULL,1,20),(3694,'Extremoz','',NULL,1,20),(3695,'Felipe Guerra','',NULL,1,20),(3696,'Fernando Pedroza','',NULL,1,20),(3697,'Flor�nia','',NULL,1,20),(3698,'Francisco Dantas','',NULL,1,20),(3699,'Frutuoso Gomes','',NULL,1,20),(3700,'Galinhos','',NULL,1,20),(3701,'Goianinha','',NULL,1,20),(3702,'Governador Dix-Sept Rosado','',NULL,1,20),(3703,'Grossos','',NULL,1,20),(3704,'Guamar�','',NULL,1,20),(3705,'Ielmo Marinho','',NULL,1,20),(3706,'Ipangua�u','',NULL,1,20),(3707,'Ipueira','',NULL,1,20),(3708,'Itaj�','',NULL,1,20),(3709,'Ita�','',NULL,1,20),(3710,'Ja�an�','',NULL,1,20),(3711,'Janda�ra','',NULL,1,20),(3712,'Jandu�s','',NULL,1,20),(3713,'Janu�rio Cicco','',NULL,1,20),(3714,'Japi','',NULL,1,20),(3715,'Jardim de Angicos','',NULL,1,20),(3716,'Jardim de Piranhas','',NULL,1,20),(3717,'Jardim do Serid�','',NULL,1,20),(3718,'Jo�o C�mara','',NULL,1,20),(3719,'Jo�o Dias','',NULL,1,20),(3720,'Jos� da Penha','',NULL,1,20),(3721,'Jucurutu','',NULL,1,20),(3722,'Lagoa d`Anta','',NULL,1,20),(3723,'Lagoa de Pedras','',NULL,1,20),(3724,'Lagoa de Velhos','',NULL,1,20),(3725,'Lagoa Nova','',NULL,1,20),(3726,'Lagoa Salgada','',NULL,1,20),(3727,'Lajes','',NULL,1,20),(3728,'Lajes Pintadas','',NULL,1,20),(3729,'Lucr�cia','',NULL,1,20),(3730,'Lu�s Gomes','',NULL,1,20),(3731,'Maca�ba','',NULL,1,20),(3732,'Macau','',NULL,1,20),(3733,'Major Sales','',NULL,1,20),(3734,'Marcelino Vieira','',NULL,1,20),(3735,'Martins','',NULL,1,20),(3736,'Maxaranguape','',NULL,1,20),(3737,'Messias Targino','',NULL,1,20),(3738,'Montanhas','',NULL,1,20),(3739,'Monte Alegre','',NULL,1,20),(3740,'Monte das Gameleiras','',NULL,1,20),(3741,'Mossor�','',NULL,1,20),(3742,'Natal','',NULL,1,20),(3743,'N�sia Floresta','',NULL,1,20),(3744,'Nova Cruz','',NULL,1,20),(3745,'Olho-d`�gua do Borges','',NULL,1,20),(3746,'Ouro Branco','',NULL,1,20),(3747,'Paran�','',NULL,1,20),(3748,'Para�','',NULL,1,20),(3749,'Parazinho','',NULL,1,20),(3750,'Parelhas','',NULL,1,20),(3751,'Parnamirim','',NULL,1,20),(3752,'Passa e Fica','',NULL,1,20),(3753,'Passagem','',NULL,1,20),(3754,'Patu','',NULL,1,20),(3755,'Pau dos Ferros','',NULL,1,20),(3756,'Pedra Grande','',NULL,1,20),(3757,'Pedra Preta','',NULL,1,20),(3758,'Pedro Avelino','',NULL,1,20),(3759,'Pedro Velho','',NULL,1,20),(3760,'Pend�ncias','',NULL,1,20),(3761,'Pil�es','',NULL,1,20),(3762,'Po�o Branco','',NULL,1,20),(3763,'Portalegre','',NULL,1,20),(3764,'Porto do Mangue','',NULL,1,20),(3765,'Presidente Juscelino','',NULL,1,20),(3766,'Pureza','',NULL,1,20),(3767,'Rafael Fernandes','',NULL,1,20),(3768,'Rafael Godeiro','',NULL,1,20),(3769,'Riacho da Cruz','',NULL,1,20),(3770,'Riacho de Santana','',NULL,1,20),(3771,'Riachuelo','',NULL,1,20),(3772,'Rio do Fogo','',NULL,1,20),(3773,'Rodolfo Fernandes','',NULL,1,20),(3774,'Ruy Barbosa','',NULL,1,20),(3775,'Santa Cruz','',NULL,1,20),(3776,'Santa Maria','',NULL,1,20),(3777,'Santana do Matos','',NULL,1,20),(3778,'Santana do Serid�','',NULL,1,20),(3779,'Santo Ant�nio','',NULL,1,20),(3780,'S�o Bento do Norte','',NULL,1,20),(3781,'S�o Bento do Trair�','',NULL,1,20),(3782,'S�o Fernando','',NULL,1,20),(3783,'S�o Francisco do Oeste','',NULL,1,20),(3784,'S�o Gon�alo do Amarante','',NULL,1,20),(3785,'S�o Jo�o do Sabugi','',NULL,1,20),(3786,'S�o Jos� de Mipibu','',NULL,1,20),(3787,'S�o Jos� do Campestre','',NULL,1,20),(3788,'S�o Jos� do Serid�','',NULL,1,20),(3789,'S�o Miguel','',NULL,1,20),(3790,'S�o Miguel de Touros','',NULL,1,20),(3791,'S�o Paulo do Potengi','',NULL,1,20),(3792,'S�o Pedro','',NULL,1,20),(3793,'S�o Rafael','',NULL,1,20),(3794,'S�o Tom�','',NULL,1,20),(3795,'S�o Vicente','',NULL,1,20),(3796,'Senador El�i de Souza','',NULL,1,20),(3797,'Senador Georgino Avelino','',NULL,1,20),(3798,'Serra de S�o Bento','',NULL,1,20),(3799,'Serra do Mel','',NULL,1,20),(3800,'Serra Negra do Norte','',NULL,1,20),(3801,'Serrinha','',NULL,1,20),(3802,'Serrinha dos Pintos','',NULL,1,20),(3803,'Severiano Melo','',NULL,1,20),(3804,'S�tio Novo','',NULL,1,20),(3805,'Taboleiro Grande','',NULL,1,20),(3806,'Taipu','',NULL,1,20),(3807,'Tangar�','',NULL,1,20),(3808,'Tenente Ananias','',NULL,1,20),(3809,'Tenente Laurentino Cruz','',NULL,1,20),(3810,'Tibau','',NULL,1,20),(3811,'Tibau do Sul','',NULL,1,20),(3812,'Timba�ba dos Batistas','',NULL,1,20),(3813,'Touros','',NULL,1,20),(3814,'Triunfo Potiguar','',NULL,1,20),(3815,'Umarizal','',NULL,1,20),(3816,'Upanema','',NULL,1,20),(3817,'V�rzea','',NULL,1,20),(3818,'Venha-Ver','',NULL,1,20),(3819,'Vera Cruz','',NULL,1,20),(3820,'Vi�osa','',NULL,1,20),(3821,'Vila Flor','',NULL,1,20),(3822,'�gua Santa','',NULL,1,21),(3823,'Agudo','',NULL,1,21),(3824,'Ajuricaba','',NULL,1,21),(3825,'Alecrim','',NULL,1,21),(3826,'Alegrete','',NULL,1,21),(3827,'Alegria','',NULL,1,21),(3828,'Alpestre','',NULL,1,21),(3829,'Alto Alegre','',NULL,1,21),(3830,'Alto Feliz','',NULL,1,21),(3831,'Alvorada','',NULL,1,21),(3832,'Amaral Ferrador','',NULL,1,21),(3833,'Ametista do Sul','',NULL,1,21),(3834,'Andr� da Rocha','',NULL,1,21),(3835,'Anta Gorda','',NULL,1,21),(3836,'Ant�nio Prado','',NULL,1,21),(3837,'Arambar�','',NULL,1,21),(3838,'Araric�','',NULL,1,21),(3839,'Aratiba','',NULL,1,21),(3840,'Arroio do Meio','',NULL,1,21),(3841,'Arroio do Sal','',NULL,1,21),(3842,'Arroio do Tigre','',NULL,1,21),(3843,'Arroio dos Ratos','',NULL,1,21),(3844,'Arroio Grande','',NULL,1,21),(3845,'Arvorezinha','',NULL,1,21),(3846,'Augusto Pestana','',NULL,1,21),(3847,'�urea','',NULL,1,21),(3848,'Bag�','',NULL,1,21),(3849,'Balne�rio Pinhal','',NULL,1,21),(3850,'Bar�o','',NULL,1,21),(3851,'Bar�o de Cotegipe','',NULL,1,21),(3852,'Bar�o do Triunfo','',NULL,1,21),(3853,'Barra do Guarita','',NULL,1,21),(3854,'Barra do Quara�','',NULL,1,21),(3855,'Barra do Ribeiro','',NULL,1,21),(3856,'Barra do Rio Azul','',NULL,1,21),(3857,'Barra Funda','',NULL,1,21),(3858,'Barrac�o','',NULL,1,21),(3859,'Barros Cassal','',NULL,1,21),(3860,'Benjamin Constant do Sul','',NULL,1,21),(3861,'Bento Gon�alves','',NULL,1,21),(3862,'Boa Vista das Miss�es','',NULL,1,21),(3863,'Boa Vista do Buric�','',NULL,1,21),(3864,'Boa Vista do Sul','',NULL,1,21),(3865,'Bom Jesus','',NULL,1,21),(3866,'Bom Princ�pio','',NULL,1,21),(3867,'Bom Progresso','',NULL,1,21),(3868,'Bom Retiro do Sul','',NULL,1,21),(3869,'Boqueir�o do Le�o','',NULL,1,21),(3870,'Bossoroca','',NULL,1,21),(3871,'Braga','',NULL,1,21),(3872,'Brochier','',NULL,1,21),(3873,'Buti�','',NULL,1,21),(3874,'Ca�apava do Sul','',NULL,1,21),(3875,'Cacequi','',NULL,1,21),(3876,'Cachoeira do Sul','',NULL,1,21),(3877,'Cachoeirinha','',NULL,1,21),(3878,'Cacique Doble','',NULL,1,21),(3879,'Caibat�','',NULL,1,21),(3880,'Cai�ara','',NULL,1,21),(3881,'Camaqu�','',NULL,1,21),(3882,'Camargo','',NULL,1,21),(3883,'Cambar� do Sul','',NULL,1,21),(3884,'Campestre da Serra','',NULL,1,21),(3885,'Campina das Miss�es','',NULL,1,21),(3886,'Campinas do Sul','',NULL,1,21),(3887,'Campo Bom','',NULL,1,21),(3888,'Campo Novo','',NULL,1,21),(3889,'Campos Borges','',NULL,1,21),(3890,'Candel�ria','',NULL,1,21),(3891,'C�ndido God�i','',NULL,1,21),(3892,'Candiota','',NULL,1,21),(3893,'Canela','',NULL,1,21),(3894,'Cangu�u','',NULL,1,21),(3895,'Canoas','',NULL,1,21),(3896,'Cap�o da Canoa','',NULL,1,21),(3897,'Cap�o do Le�o','',NULL,1,21),(3898,'Capela de Santana','',NULL,1,21),(3899,'Capit�o','',NULL,1,21),(3900,'Capivari do Sul','',NULL,1,21),(3901,'Cara�','',NULL,1,21),(3902,'Carazinho','',NULL,1,21),(3903,'Carlos Barbosa','',NULL,1,21),(3904,'Carlos Gomes','',NULL,1,21),(3905,'Casca','',NULL,1,21),(3906,'Caseiros','',NULL,1,21),(3907,'Catu�pe','',NULL,1,21),(3908,'Caxias do Sul','',NULL,1,21),(3909,'Centen�rio','',NULL,1,21),(3910,'Cerrito','',NULL,1,21),(3911,'Cerro Branco','',NULL,1,21),(3912,'Cerro Grande','',NULL,1,21),(3913,'Cerro Grande do Sul','',NULL,1,21),(3914,'Cerro Largo','',NULL,1,21),(3915,'Chapada','',NULL,1,21),(3916,'Charqueadas','',NULL,1,21),(3917,'Charrua','',NULL,1,21),(3918,'Chiapeta','',NULL,1,21),(3919,'Chu�','',NULL,1,21),(3920,'Chuvisca','',NULL,1,21),(3921,'Cidreira','',NULL,1,21),(3922,'Cir�aco','',NULL,1,21),(3923,'Colinas','',NULL,1,21),(3924,'Colorado','',NULL,1,21),(3925,'Condor','',NULL,1,21),(3926,'Constantina','',NULL,1,21),(3927,'Coqueiros do Sul','',NULL,1,21),(3928,'Coronel Barros','',NULL,1,21),(3929,'Coronel Bicaco','',NULL,1,21),(3930,'Cotipor�','',NULL,1,21),(3931,'Coxilha','',NULL,1,21),(3932,'Crissiumal','',NULL,1,21),(3933,'Cristal','',NULL,1,21),(3934,'Cristal do Sul','',NULL,1,21),(3935,'Cruz Alta','',NULL,1,21),(3936,'Cruzeiro do Sul','',NULL,1,21),(3937,'David Canabarro','',NULL,1,21),(3938,'Derrubadas','',NULL,1,21),(3939,'Dezesseis de Novembro','',NULL,1,21),(3940,'Dilermando de Aguiar','',NULL,1,21),(3941,'Dois Irm�os','',NULL,1,21),(3942,'Dois Irm�os das Miss�es','',NULL,1,21),(3943,'Dois Lajeados','',NULL,1,21),(3944,'Dom Feliciano','',NULL,1,21),(3945,'Dom Pedrito','',NULL,1,21),(3946,'Dom Pedro de Alc�ntara','',NULL,1,21),(3947,'Dona Francisca','',NULL,1,21),(3948,'Doutor Maur�cio Cardoso','',NULL,1,21),(3949,'Doutor Ricardo','',NULL,1,21),(3950,'Eldorado do Sul','',NULL,1,21),(3951,'Encantado','',NULL,1,21),(3952,'Encruzilhada do Sul','',NULL,1,21),(3953,'Engenho Velho','',NULL,1,21),(3954,'Entre Rios do Sul','',NULL,1,21),(3955,'Entre-Iju�s','',NULL,1,21),(3956,'Erebango','',NULL,1,21),(3957,'Erechim','',NULL,1,21),(3958,'Ernestina','',NULL,1,21),(3959,'Erval Grande','',NULL,1,21),(3960,'Erval Seco','',NULL,1,21),(3961,'Esmeralda','',NULL,1,21),(3962,'Esperan�a do Sul','',NULL,1,21),(3963,'Espumoso','',NULL,1,21),(3964,'Esta��o','',NULL,1,21),(3965,'Est�ncia Velha','',NULL,1,21),(3966,'Esteio','',NULL,1,21),(3967,'Estrela','',NULL,1,21),(3968,'Estrela Velha','',NULL,1,21),(3969,'Eug�nio de Castro','',NULL,1,21),(3970,'Fagundes Varela','',NULL,1,21),(3971,'Farroupilha','',NULL,1,21),(3972,'Faxinal do Soturno','',NULL,1,21),(3973,'Faxinalzinho','',NULL,1,21),(3974,'Fazenda Vilanova','',NULL,1,21),(3975,'Feliz','',NULL,1,21),(3976,'Flores da Cunha','',NULL,1,21),(3977,'Floriano Peixoto','',NULL,1,21),(3978,'Fontoura Xavier','',NULL,1,21),(3979,'Formigueiro','',NULL,1,21),(3980,'Fortaleza dos Valos','',NULL,1,21),(3981,'Frederico Westphalen','',NULL,1,21),(3982,'Garibaldi','',NULL,1,21),(3983,'Garruchos','',NULL,1,21),(3984,'Gaurama','',NULL,1,21),(3985,'General C�mara','',NULL,1,21),(3986,'Gentil','',NULL,1,21),(3987,'Get�lio Vargas','',NULL,1,21),(3988,'Giru�','',NULL,1,21),(3989,'Glorinha','',NULL,1,21),(3990,'Gramado','',NULL,1,21),(3991,'Gramado dos Loureiros','',NULL,1,21),(3992,'Gramado Xavier','',NULL,1,21),(3993,'Gravata�','',NULL,1,21),(3994,'Guabiju','',NULL,1,21),(3995,'Gua�ba','',NULL,1,21),(3996,'Guapor�','',NULL,1,21),(3997,'Guarani das Miss�es','',NULL,1,21),(3998,'Harmonia','',NULL,1,21),(3999,'Herval','',NULL,1,21),(4000,'Herveiras','',NULL,1,21),(4001,'Horizontina','',NULL,1,21),(4002,'Hulha Negra','',NULL,1,21),(4003,'Humait�','',NULL,1,21),(4004,'Ibarama','',NULL,1,21),(4005,'Ibia��','',NULL,1,21),(4006,'Ibiraiaras','',NULL,1,21),(4007,'Ibirapuit�','',NULL,1,21),(4008,'Ibirub�','',NULL,1,21),(4009,'Igrejinha','',NULL,1,21),(4010,'Iju�','',NULL,1,21),(4011,'Il�polis','',NULL,1,21),(4012,'Imb�','',NULL,1,21),(4013,'Imigrante','',NULL,1,21),(4014,'Independ�ncia','',NULL,1,21),(4015,'Inhacor�','',NULL,1,21),(4016,'Ip�','',NULL,1,21),(4017,'Ipiranga do Sul','',NULL,1,21),(4018,'Ira�','',NULL,1,21),(4019,'Itaara','',NULL,1,21),(4020,'Itacurubi','',NULL,1,21),(4021,'Itapuca','',NULL,1,21),(4022,'Itaqui','',NULL,1,21),(4023,'Itatiba do Sul','',NULL,1,21),(4024,'Ivor�','',NULL,1,21),(4025,'Ivoti','',NULL,1,21),(4026,'Jaboticaba','',NULL,1,21),(4027,'Jacutinga','',NULL,1,21),(4028,'Jaguar�o','',NULL,1,21),(4029,'Jaguari','',NULL,1,21),(4030,'Jaquirana','',NULL,1,21),(4031,'Jari','',NULL,1,21),(4032,'J�ia','',NULL,1,21),(4033,'J�lio de Castilhos','',NULL,1,21),(4034,'Lagoa dos Tr�s Cantos','',NULL,1,21),(4035,'Lagoa Vermelha','',NULL,1,21),(4036,'Lago�o','',NULL,1,21),(4037,'Lajeado','',NULL,1,21),(4038,'Lajeado do Bugre','',NULL,1,21),(4039,'Lavras do Sul','',NULL,1,21),(4040,'Liberato Salzano','',NULL,1,21),(4041,'Lindolfo Collor','',NULL,1,21),(4042,'Linha Nova','',NULL,1,21),(4043,'Ma�ambara','',NULL,1,21),(4044,'Machadinho','',NULL,1,21),(4045,'Mampituba','',NULL,1,21),(4046,'Manoel Viana','',NULL,1,21),(4047,'Maquin�','',NULL,1,21),(4048,'Marat�','',NULL,1,21),(4049,'Marau','',NULL,1,21),(4050,'Marcelino Ramos','',NULL,1,21),(4051,'Mariana Pimentel','',NULL,1,21),(4052,'Mariano Moro','',NULL,1,21),(4053,'Marques de Souza','',NULL,1,21),(4054,'Mata','',NULL,1,21),(4055,'Mato Castelhano','',NULL,1,21),(4056,'Mato Leit�o','',NULL,1,21),(4057,'Maximiliano de Almeida','',NULL,1,21),(4058,'Minas do Le�o','',NULL,1,21),(4059,'Miragua�','',NULL,1,21),(4060,'Montauri','',NULL,1,21),(4061,'Monte Alegre dos Campos','',NULL,1,21),(4062,'Monte Belo do Sul','',NULL,1,21),(4063,'Montenegro','',NULL,1,21),(4064,'Morma�o','',NULL,1,21),(4065,'Morrinhos do Sul','',NULL,1,21),(4066,'Morro Redondo','',NULL,1,21),(4067,'Morro Reuter','',NULL,1,21),(4068,'Mostardas','',NULL,1,21),(4069,'Mu�um','',NULL,1,21),(4070,'Muitos Cap�es','',NULL,1,21),(4071,'Muliterno','',NULL,1,21),(4072,'N�o-Me-Toque','',NULL,1,21),(4073,'Nicolau Vergueiro','',NULL,1,21),(4074,'Nonoai','',NULL,1,21),(4075,'Nova Alvorada','',NULL,1,21),(4076,'Nova Ara��','',NULL,1,21),(4077,'Nova Bassano','',NULL,1,21),(4078,'Nova Boa Vista','',NULL,1,21),(4079,'Nova Br�scia','',NULL,1,21),(4080,'Nova Candel�ria','',NULL,1,21),(4081,'Nova Esperan�a do Sul','',NULL,1,21),(4082,'Nova Hartz','',NULL,1,21),(4083,'Nova P�dua','',NULL,1,21),(4084,'Nova Palma','',NULL,1,21),(4085,'Nova Petr�polis','',NULL,1,21),(4086,'Nova Prata','',NULL,1,21),(4087,'Nova Ramada','',NULL,1,21),(4088,'Nova Roma do Sul','',NULL,1,21),(4089,'Nova Santa Rita','',NULL,1,21),(4090,'Novo Barreiro','',NULL,1,21),(4091,'Novo Cabrais','',NULL,1,21),(4092,'Novo Hamburgo','',NULL,1,21),(4093,'Novo Machado','',NULL,1,21),(4094,'Novo Tiradentes','',NULL,1,21),(4095,'Os�rio','',NULL,1,21),(4096,'Paim Filho','',NULL,1,21),(4097,'Palmares do Sul','',NULL,1,21),(4098,'Palmeira das Miss�es','',NULL,1,21),(4099,'Palmitinho','',NULL,1,21),(4100,'Panambi','',NULL,1,21),(4101,'Pantano Grande','',NULL,1,21),(4102,'Para�','',NULL,1,21),(4103,'Para�so do Sul','',NULL,1,21),(4104,'Pareci Novo','',NULL,1,21),(4105,'Parob�','',NULL,1,21),(4106,'Passa Sete','',NULL,1,21),(4107,'Passo do Sobrado','',NULL,1,21),(4108,'Passo Fundo','',NULL,1,21),(4109,'Paverama','',NULL,1,21),(4110,'Pedro Os�rio','',NULL,1,21),(4111,'Peju�ara','',NULL,1,21),(4112,'Pelotas','',NULL,1,21),(4113,'Picada Caf�','',NULL,1,21),(4114,'Pinhal','',NULL,1,21),(4115,'Pinhal Grande','',NULL,1,21),(4116,'Pinheirinho do Vale','',NULL,1,21),(4117,'Pinheiro Machado','',NULL,1,21),(4118,'Pirap�','',NULL,1,21),(4119,'Piratini','',NULL,1,21),(4120,'Planalto','',NULL,1,21),(4121,'Po�o das Antas','',NULL,1,21),(4122,'Pont�o','',NULL,1,21),(4123,'Ponte Preta','',NULL,1,21),(4124,'Port�o','',NULL,1,21),(4125,'Porto Alegre','',NULL,1,21),(4126,'Porto Lucena','',NULL,1,21),(4127,'Porto Mau�','',NULL,1,21),(4128,'Porto Vera Cruz','',NULL,1,21),(4129,'Porto Xavier','',NULL,1,21),(4130,'Pouso Novo','',NULL,1,21),(4131,'Presidente Lucena','',NULL,1,21),(4132,'Progresso','',NULL,1,21),(4133,'Prot�sio Alves','',NULL,1,21),(4134,'Putinga','',NULL,1,21),(4135,'Quara�','',NULL,1,21),(4136,'Quevedos','',NULL,1,21),(4137,'Quinze de Novembro','',NULL,1,21),(4138,'Redentora','',NULL,1,21),(4139,'Relvado','',NULL,1,21),(4140,'Restinga Seca','',NULL,1,21),(4141,'Rio dos �ndios','',NULL,1,21),(4142,'Rio Grande','',NULL,1,21),(4143,'Rio Pardo','',NULL,1,21),(4144,'Riozinho','',NULL,1,21),(4145,'Roca Sales','',NULL,1,21),(4146,'Rodeio Bonito','',NULL,1,21),(4147,'Rolante','',NULL,1,21),(4148,'Ronda Alta','',NULL,1,21),(4149,'Rondinha','',NULL,1,21),(4150,'Roque Gonzales','',NULL,1,21),(4151,'Ros�rio do Sul','',NULL,1,21),(4152,'Sagrada Fam�lia','',NULL,1,21),(4153,'Saldanha Marinho','',NULL,1,21),(4154,'Salto do Jacu�','',NULL,1,21),(4155,'Salvador das Miss�es','',NULL,1,21),(4156,'Salvador do Sul','',NULL,1,21),(4157,'Sananduva','',NULL,1,21),(4158,'Santa B�rbara do Sul','',NULL,1,21),(4159,'Santa Clara do Sul','',NULL,1,21),(4160,'Santa Cruz do Sul','',NULL,1,21),(4161,'Santa Maria','',NULL,1,21),(4162,'Santa Maria do Herval','',NULL,1,21),(4163,'Santa Rosa','',NULL,1,21),(4164,'Santa Tereza','',NULL,1,21),(4165,'Santa Vit�ria do Palmar','',NULL,1,21),(4166,'Santana da Boa Vista','',NULL,1,21),(4167,'Santana do Livramento','',NULL,1,21),(4168,'Santiago','',NULL,1,21),(4169,'Santo �ngelo','',NULL,1,21),(4170,'Santo Ant�nio da Patrulha','',NULL,1,21),(4171,'Santo Ant�nio das Miss�es','',NULL,1,21),(4172,'Santo Ant�nio do Palma','',NULL,1,21),(4173,'Santo Ant�nio do Planalto','',NULL,1,21),(4174,'Santo Augusto','',NULL,1,21),(4175,'Santo Cristo','',NULL,1,21),(4176,'Santo Expedito do Sul','',NULL,1,21),(4177,'S�o Borja','',NULL,1,21),(4178,'S�o Domingos do Sul','',NULL,1,21),(4179,'S�o Francisco de Assis','',NULL,1,21),(4180,'S�o Francisco de Paula','',NULL,1,21),(4181,'S�o Gabriel','',NULL,1,21),(4182,'S�o Jer�nimo','',NULL,1,21),(4183,'S�o Jo�o da Urtiga','',NULL,1,21),(4184,'S�o Jo�o do Pol�sine','',NULL,1,21),(4185,'S�o Jorge','',NULL,1,21),(4186,'S�o Jos� das Miss�es','',NULL,1,21),(4187,'S�o Jos� do Herval','',NULL,1,21),(4188,'S�o Jos� do Hort�ncio','',NULL,1,21),(4189,'S�o Jos� do Inhacor�','',NULL,1,21),(4190,'S�o Jos� do Norte','',NULL,1,21),(4191,'S�o Jos� do Ouro','',NULL,1,21),(4192,'S�o Jos� dos Ausentes','',NULL,1,21),(4193,'S�o Leopoldo','',NULL,1,21),(4194,'S�o Louren�o do Sul','',NULL,1,21),(4195,'S�o Luiz Gonzaga','',NULL,1,21),(4196,'S�o Marcos','',NULL,1,21),(4197,'S�o Martinho','',NULL,1,21),(4198,'S�o Martinho da Serra','',NULL,1,21),(4199,'S�o Miguel das Miss�es','',NULL,1,21),(4200,'S�o Nicolau','',NULL,1,21),(4201,'S�o Paulo das Miss�es','',NULL,1,21),(4202,'S�o Pedro da Serra','',NULL,1,21),(4203,'S�o Pedro do Buti�','',NULL,1,21),(4204,'S�o Pedro do Sul','',NULL,1,21),(4205,'S�o Sebasti�o do Ca�','',NULL,1,21),(4206,'S�o Sep�','',NULL,1,21),(4207,'S�o Valentim','',NULL,1,21),(4208,'S�o Valentim do Sul','',NULL,1,21),(4209,'S�o Val�rio do Sul','',NULL,1,21),(4210,'S�o Vendelino','',NULL,1,21),(4211,'S�o Vicente do Sul','',NULL,1,21),(4212,'Sapiranga','',NULL,1,21),(4213,'Sapucaia do Sul','',NULL,1,21),(4214,'Sarandi','',NULL,1,21),(4215,'Seberi','',NULL,1,21),(4216,'Sede Nova','',NULL,1,21),(4217,'Segredo','',NULL,1,21),(4218,'Selbach','',NULL,1,21),(4219,'Senador Salgado Filho','',NULL,1,21),(4220,'Sentinela do Sul','',NULL,1,21),(4221,'Serafina Corr�a','',NULL,1,21),(4222,'S�rio','',NULL,1,21),(4223,'Sert�o','',NULL,1,21),(4224,'Sert�o Santana','',NULL,1,21),(4225,'Sete de Setembro','',NULL,1,21),(4226,'Severiano de Almeida','',NULL,1,21),(4227,'Silveira Martins','',NULL,1,21),(4228,'Sinimbu','',NULL,1,21),(4229,'Sobradinho','',NULL,1,21),(4230,'Soledade','',NULL,1,21),(4231,'Taba�','',NULL,1,21),(4232,'Tapejara','',NULL,1,21),(4233,'Tapera','',NULL,1,21),(4234,'Tapes','',NULL,1,21),(4235,'Taquara','',NULL,1,21),(4236,'Taquari','',NULL,1,21),(4237,'Taquaru�u do Sul','',NULL,1,21),(4238,'Tavares','',NULL,1,21),(4239,'Tenente Portela','',NULL,1,21),(4240,'Terra de Areia','',NULL,1,21),(4241,'Teut�nia','',NULL,1,21),(4242,'Tiradentes do Sul','',NULL,1,21),(4243,'Toropi','',NULL,1,21),(4244,'Torres','',NULL,1,21),(4245,'Tramanda�','',NULL,1,21),(4246,'Travesseiro','',NULL,1,21),(4247,'Tr�s Arroios','',NULL,1,21),(4248,'Tr�s Cachoeiras','',NULL,1,21),(4249,'Tr�s Coroas','',NULL,1,21),(4250,'Tr�s de Maio','',NULL,1,21),(4251,'Tr�s Forquilhas','',NULL,1,21),(4252,'Tr�s Palmeiras','',NULL,1,21),(4253,'Tr�s Passos','',NULL,1,21),(4254,'Trindade do Sul','',NULL,1,21),(4255,'Triunfo','',NULL,1,21),(4256,'Tucunduva','',NULL,1,21),(4257,'Tunas','',NULL,1,21),(4258,'Tupanci do Sul','',NULL,1,21),(4259,'Tupanciret�','',NULL,1,21),(4260,'Tupandi','',NULL,1,21),(4261,'Tuparendi','',NULL,1,21),(4262,'Turu�u','',NULL,1,21),(4263,'Ubiretama','',NULL,1,21),(4264,'Uni�o da Serra','',NULL,1,21),(4265,'Unistalda','',NULL,1,21),(4266,'Uruguaiana','',NULL,1,21),(4267,'Vacaria','',NULL,1,21),(4268,'Vale do Sol','',NULL,1,21),(4269,'Vale Real','',NULL,1,21),(4270,'Vale Verde','',NULL,1,21),(4271,'Vanini','',NULL,1,21),(4272,'Ven�ncio Aires','',NULL,1,21),(4273,'Vera Cruz','',NULL,1,21),(4274,'Veran�polis','',NULL,1,21),(4275,'Vespasiano Correa','',NULL,1,21),(4276,'Viadutos','',NULL,1,21),(4277,'Viam�o','',NULL,1,21),(4278,'Vicente Dutra','',NULL,1,21),(4279,'Victor Graeff','',NULL,1,21),(4280,'Vila Flores','',NULL,1,21),(4281,'Vila L�ngaro','',NULL,1,21),(4282,'Vila Maria','',NULL,1,21),(4283,'Vila Nova do Sul','',NULL,1,21),(4284,'Vista Alegre','',NULL,1,21),(4285,'Vista Alegre do Prata','',NULL,1,21),(4286,'Vista Ga�cha','',NULL,1,21),(4287,'Vit�ria das Miss�es','',NULL,1,21),(4288,'Xangri-l�','',NULL,1,21),(4289,'Alta Floresta d`Oeste','',NULL,1,22),(4290,'Alto Alegre dos Parecis','',NULL,1,22),(4291,'Alto Para�so','',NULL,1,22),(4292,'Alvorada d`Oeste','',NULL,1,22),(4293,'Ariquemes','',NULL,1,22),(4294,'Buritis','',NULL,1,22),(4295,'Cabixi','',NULL,1,22),(4296,'Cacaul�ndia','',NULL,1,22),(4297,'Cacoal','',NULL,1,22),(4298,'Campo Novo de Rond�nia','',NULL,1,22),(4299,'Candeias do Jamari','',NULL,1,22),(4300,'Castanheiras','',NULL,1,22),(4301,'Cerejeiras','',NULL,1,22),(4302,'Chupinguaia','',NULL,1,22),(4303,'Colorado do Oeste','',NULL,1,22),(4304,'Corumbiara','',NULL,1,22),(4305,'Costa Marques','',NULL,1,22),(4306,'Cujubim','',NULL,1,22),(4307,'Espig�o d`Oeste','',NULL,1,22),(4308,'Governador Jorge Teixeira','',NULL,1,22),(4309,'Guajar�-Mirim','',NULL,1,22),(4310,'Itapu� do Oeste','',NULL,1,22),(4311,'Jaru','',NULL,1,22),(4312,'Ji-Paran�','',NULL,1,22),(4313,'Machadinho d`Oeste','',NULL,1,22),(4314,'Ministro Andreazza','',NULL,1,22),(4315,'Mirante da Serra','',NULL,1,22),(4316,'Monte Negro','',NULL,1,22),(4317,'Nova Brasil�ndia d`Oeste','',NULL,1,22),(4318,'Nova Mamor�','',NULL,1,22),(4319,'Nova Uni�o','',NULL,1,22),(4320,'Novo Horizonte do Oeste','',NULL,1,22),(4321,'Ouro Preto do Oeste','',NULL,1,22),(4322,'Parecis','',NULL,1,22),(4323,'Pimenta Bueno','',NULL,1,22),(4324,'Pimenteiras do Oeste','',NULL,1,22),(4325,'Porto Velho','',NULL,1,22),(4326,'Presidente M�dici','',NULL,1,22),(4327,'Primavera de Rond�nia','',NULL,1,22),(4328,'Rio Crespo','',NULL,1,22),(4329,'Rolim de Moura','',NULL,1,22),(4330,'Santa Luzia d`Oeste','',NULL,1,22),(4331,'S�o Felipe d`Oeste','',NULL,1,22),(4332,'S�o Francisco do Guapor�','',NULL,1,22),(4333,'S�o Miguel do Guapor�','',NULL,1,22),(4334,'Seringueiras','',NULL,1,22),(4335,'Teixeir�polis','',NULL,1,22),(4336,'Theobroma','',NULL,1,22),(4337,'Urup�','',NULL,1,22),(4338,'Vale do Anari','',NULL,1,22),(4339,'Vale do Para�so','',NULL,1,22),(4340,'Vilhena','',NULL,1,22),(4341,'Alto Alegre','',NULL,1,23),(4342,'Amajari','',NULL,1,23),(4343,'Boa Vista','',NULL,1,23),(4344,'Bonfim','',NULL,1,23),(4345,'Cant�','',NULL,1,23),(4346,'Caracara�','',NULL,1,23),(4347,'Caroebe','',NULL,1,23),(4348,'Iracema','',NULL,1,23),(4349,'Mucaja�','',NULL,1,23),(4350,'Normandia','',NULL,1,23),(4351,'Pacaraima','',NULL,1,23),(4352,'Rorain�polis','',NULL,1,23),(4353,'S�o Jo�o da Baliza','',NULL,1,23),(4354,'S�o Luiz','',NULL,1,23),(4355,'Uiramut�','',NULL,1,23),(4356,'Abdon Batista','',NULL,1,24),(4357,'Abelardo Luz','',NULL,1,24),(4358,'Agrol�ndia','',NULL,1,24),(4359,'Agron�mica','',NULL,1,24),(4360,'�gua Doce','',NULL,1,24),(4361,'�guas de Chapec�','',NULL,1,24),(4362,'�guas Frias','',NULL,1,24),(4363,'�guas Mornas','',NULL,1,24),(4364,'Alfredo Wagner','',NULL,1,24),(4365,'Alto Bela Vista','',NULL,1,24),(4366,'Anchieta','',NULL,1,24),(4367,'Angelina','',NULL,1,24),(4368,'Anita Garibaldi','',NULL,1,24),(4369,'Anit�polis','',NULL,1,24),(4370,'Ant�nio Carlos','',NULL,1,24),(4371,'Api�na','',NULL,1,24),(4372,'Arabut�','',NULL,1,24),(4373,'Araquari','',NULL,1,24),(4374,'Ararangu�','',NULL,1,24),(4375,'Armaz�m','',NULL,1,24),(4376,'Arroio Trinta','',NULL,1,24),(4377,'Arvoredo','',NULL,1,24),(4378,'Ascurra','',NULL,1,24),(4379,'Atalanta','',NULL,1,24),(4380,'Aurora','',NULL,1,24),(4381,'Balne�rio Arroio do Silva','',NULL,1,24),(4382,'Balne�rio Barra do Sul','',NULL,1,24),(4383,'Balne�rio Cambori�','',NULL,1,24),(4384,'Balne�rio Gaivota','',NULL,1,24),(4385,'Bandeirante','',NULL,1,24),(4386,'Barra Bonita','',NULL,1,24),(4387,'Barra Velha','',NULL,1,24),(4388,'Bela Vista do Toldo','',NULL,1,24),(4389,'Belmonte','',NULL,1,24),(4390,'Benedito Novo','',NULL,1,24),(4391,'Bigua�u','',NULL,1,24),(4392,'Blumenau','',NULL,1,24),(4393,'Bocaina do Sul','',NULL,1,24),(4394,'Bom Jardim da Serra','',NULL,1,24),(4395,'Bom Jesus','',NULL,1,24),(4396,'Bom Jesus do Oeste','',NULL,1,24),(4397,'Bom Retiro','',NULL,1,24),(4398,'Bombinhas','',NULL,1,24),(4399,'Botuver�','',NULL,1,24),(4400,'Bra�o do Norte','',NULL,1,24),(4401,'Bra�o do Trombudo','',NULL,1,24),(4402,'Brun�polis','',NULL,1,24),(4403,'Brusque','',NULL,1,24),(4404,'Ca�ador','',NULL,1,24),(4405,'Caibi','',NULL,1,24),(4406,'Calmon','',NULL,1,24),(4407,'Cambori�','',NULL,1,24),(4408,'Campo Alegre','',NULL,1,24),(4409,'Campo Belo do Sul','',NULL,1,24),(4410,'Campo Er�','',NULL,1,24),(4411,'Campos Novos','',NULL,1,24),(4412,'Canelinha','',NULL,1,24),(4413,'Canoinhas','',NULL,1,24),(4414,'Cap�o Alto','',NULL,1,24),(4415,'Capinzal','',NULL,1,24),(4416,'Capivari de Baixo','',NULL,1,24),(4417,'Catanduvas','',NULL,1,24),(4418,'Caxambu do Sul','',NULL,1,24),(4419,'Celso Ramos','',NULL,1,24),(4420,'Cerro Negro','',NULL,1,24),(4421,'Chapad�o do Lageado','',NULL,1,24),(4422,'Chapec�','',NULL,1,24),(4423,'Cocal do Sul','',NULL,1,24),(4424,'Conc�rdia','',NULL,1,24),(4425,'Cordilheira Alta','',NULL,1,24),(4426,'Coronel Freitas','',NULL,1,24),(4427,'Coronel Martins','',NULL,1,24),(4428,'Correia Pinto','',NULL,1,24),(4429,'Corup�','',NULL,1,24),(4430,'Crici�ma','',NULL,1,24),(4431,'Cunha Por�','',NULL,1,24),(4432,'Cunhata�','',NULL,1,24),(4433,'Curitibanos','',NULL,1,24),(4434,'Descanso','',NULL,1,24),(4435,'Dion�sio Cerqueira','',NULL,1,24),(4436,'Dona Emma','',NULL,1,24),(4437,'Doutor Pedrinho','',NULL,1,24),(4438,'Entre Rios','',NULL,1,24),(4439,'Ermo','',NULL,1,24),(4440,'Erval Velho','',NULL,1,24),(4441,'Faxinal dos Guedes','',NULL,1,24),(4442,'Flor do Sert�o','',NULL,1,24),(4443,'Florian�polis','',NULL,1,24),(4444,'Formosa do Sul','',NULL,1,24),(4445,'Forquilhinha','',NULL,1,24),(4446,'Fraiburgo','',NULL,1,24),(4447,'Frei Rog�rio','',NULL,1,24),(4448,'Galv�o','',NULL,1,24),(4449,'Garopaba','',NULL,1,24),(4450,'Garuva','',NULL,1,24),(4451,'Gaspar','',NULL,1,24),(4452,'Governador Celso Ramos','',NULL,1,24),(4453,'Gr�o Par�','',NULL,1,24),(4454,'Gravatal','',NULL,1,24),(4455,'Guabiruba','',NULL,1,24),(4456,'Guaraciaba','',NULL,1,24),(4457,'Guaramirim','',NULL,1,24),(4458,'Guaruj� do Sul','',NULL,1,24),(4459,'Guatamb�','',NULL,1,24),(4460,'Herval d`Oeste','',NULL,1,24),(4461,'Ibiam','',NULL,1,24),(4462,'Ibicar�','',NULL,1,24),(4463,'Ibirama','',NULL,1,24),(4464,'I�ara','',NULL,1,24),(4465,'Ilhota','',NULL,1,24),(4466,'Imaru�','',NULL,1,24),(4467,'Imbituba','',NULL,1,24),(4468,'Imbuia','',NULL,1,24),(4469,'Indaial','',NULL,1,24),(4470,'Iomer�','',NULL,1,24),(4471,'Ipira','',NULL,1,24),(4472,'Ipor� do Oeste','',NULL,1,24),(4473,'Ipua�u','',NULL,1,24),(4474,'Ipumirim','',NULL,1,24),(4475,'Iraceminha','',NULL,1,24),(4476,'Irani','',NULL,1,24),(4477,'Irati','',NULL,1,24),(4478,'Irine�polis','',NULL,1,24),(4479,'It�','',NULL,1,24),(4480,'Itai�polis','',NULL,1,24),(4481,'Itaja�','IAI',NULL,1,24),(4482,'Itapema','',NULL,1,24),(4483,'Itapiranga','',NULL,1,24),(4484,'Itapo�','',NULL,1,24),(4485,'Ituporanga','',NULL,1,24),(4486,'Jabor�','',NULL,1,24),(4487,'Jacinto Machado','',NULL,1,24),(4488,'Jaguaruna','',NULL,1,24),(4489,'Jaragu� do Sul','',NULL,1,24),(4490,'Jardin�polis','',NULL,1,24),(4491,'Joa�aba','',NULL,1,24),(4492,'Joinville','',NULL,1,24),(4493,'Jos� Boiteux','',NULL,1,24),(4494,'Jupi�','',NULL,1,24),(4495,'Lacerd�polis','',NULL,1,24),(4496,'Lages','',NULL,1,24),(4497,'Laguna','',NULL,1,24),(4498,'Lajeado Grande','',NULL,1,24),(4499,'Laurentino','',NULL,1,24),(4500,'Lauro Muller','',NULL,1,24),(4501,'Lebon R�gis','',NULL,1,24),(4502,'Leoberto Leal','',NULL,1,24),(4503,'Lind�ia do Sul','',NULL,1,24),(4504,'Lontras','',NULL,1,24),(4505,'Luiz Alves','',NULL,1,24),(4506,'Luzerna','',NULL,1,24),(4507,'Macieira','',NULL,1,24),(4508,'Mafra','',NULL,1,24),(4509,'Major Gercino','',NULL,1,24),(4510,'Major Vieira','',NULL,1,24),(4511,'Maracaj�','',NULL,1,24),(4512,'Maravilha','',NULL,1,24),(4513,'Marema','',NULL,1,24),(4514,'Massaranduba','',NULL,1,24),(4515,'Matos Costa','',NULL,1,24),(4516,'Meleiro','',NULL,1,24),(4517,'Mirim Doce','',NULL,1,24),(4518,'Modelo','',NULL,1,24),(4519,'Monda�','',NULL,1,24),(4520,'Monte Carlo','',NULL,1,24),(4521,'Monte Castelo','',NULL,1,24),(4522,'Morro da Fuma�a','',NULL,1,24),(4523,'Morro Grande','',NULL,1,24),(4524,'Navegantes','',NULL,1,24),(4525,'Nova Erechim','',NULL,1,24),(4526,'Nova Itaberaba','',NULL,1,24),(4527,'Nova Trento','',NULL,1,24),(4528,'Nova Veneza','',NULL,1,24),(4529,'Novo Horizonte','',NULL,1,24),(4530,'Orleans','',NULL,1,24),(4531,'Otac�lio Costa','',NULL,1,24),(4532,'Ouro','',NULL,1,24),(4533,'Ouro Verde','',NULL,1,24),(4534,'Paial','',NULL,1,24),(4535,'Painel','',NULL,1,24),(4536,'Palho�a','',NULL,1,24),(4537,'Palma Sola','',NULL,1,24),(4538,'Palmeira','',NULL,1,24),(4539,'Palmitos','',NULL,1,24),(4540,'Papanduva','',NULL,1,24),(4541,'Para�so','',NULL,1,24),(4542,'Passo de Torres','',NULL,1,24),(4543,'Passos Maia','',NULL,1,24),(4544,'Paulo Lopes','',NULL,1,24),(4545,'Pedras Grandes','',NULL,1,24),(4546,'Penha','',NULL,1,24),(4547,'Peritiba','',NULL,1,24),(4548,'Petrol�ndia','',NULL,1,24),(4549,'Pi�arras','',NULL,1,24),(4550,'Pinhalzinho','',NULL,1,24),(4551,'Pinheiro Preto','',NULL,1,24),(4552,'Piratuba','',NULL,1,24),(4553,'Planalto Alegre','',NULL,1,24),(4554,'Pomerode','',NULL,1,24),(4555,'Ponte Alta','',NULL,1,24),(4556,'Ponte Alta do Norte','',NULL,1,24),(4557,'Ponte Serrada','',NULL,1,24),(4558,'Porto Belo','',NULL,1,24),(4559,'Porto Uni�o','',NULL,1,24),(4560,'Pouso Redondo','',NULL,1,24),(4561,'Praia Grande','',NULL,1,24),(4562,'Presidente Castelo Branco','',NULL,1,24),(4563,'Presidente Get�lio','',NULL,1,24),(4564,'Presidente Nereu','',NULL,1,24),(4565,'Princesa','',NULL,1,24),(4566,'Quilombo','',NULL,1,24),(4567,'Rancho Queimado','',NULL,1,24),(4568,'Rio das Antas','',NULL,1,24),(4569,'Rio do Campo','',NULL,1,24),(4570,'Rio do Oeste','',NULL,1,24),(4571,'Rio do Sul','',NULL,1,24),(4572,'Rio dos Cedros','',NULL,1,24),(4573,'Rio Fortuna','',NULL,1,24),(4574,'Rio Negrinho','',NULL,1,24),(4575,'Rio Rufino','',NULL,1,24),(4576,'Riqueza','',NULL,1,24),(4577,'Rodeio','',NULL,1,24),(4578,'Romel�ndia','',NULL,1,24),(4579,'Salete','',NULL,1,24),(4580,'Saltinho','',NULL,1,24),(4581,'Salto Veloso','',NULL,1,24),(4582,'Sang�o','',NULL,1,24),(4583,'Santa Cec�lia','',NULL,1,24),(4584,'Santa Helena','',NULL,1,24),(4585,'Santa Rosa de Lima','',NULL,1,24),(4586,'Santa Rosa do Sul','',NULL,1,24),(4587,'Santa Terezinha','',NULL,1,24),(4588,'Santa Terezinha do Progresso','',NULL,1,24),(4589,'Santiago do Sul','',NULL,1,24),(4590,'Santo Amaro da Imperatriz','',NULL,1,24),(4591,'S�o Bento do Sul','',NULL,1,24),(4592,'S�o Bernardino','',NULL,1,24),(4593,'S�o Bonif�cio','',NULL,1,24),(4594,'S�o Carlos','',NULL,1,24),(4595,'S�o Cristov�o do Sul','',NULL,1,24),(4596,'S�o Domingos','',NULL,1,24),(4597,'S�o Francisco do Sul','',NULL,1,24),(4598,'S�o Jo�o Batista','',NULL,1,24),(4599,'S�o Jo�o do Itaperi�','',NULL,1,24),(4600,'S�o Jo�o do Oeste','',NULL,1,24),(4601,'S�o Jo�o do Sul','',NULL,1,24),(4602,'S�o Joaquim','',NULL,1,24),(4603,'S�o Jos�','',NULL,1,24),(4604,'S�o Jos� do Cedro','',NULL,1,24),(4605,'S�o Jos� do Cerrito','',NULL,1,24),(4606,'S�o Louren�o do Oeste','',NULL,1,24),(4607,'S�o Ludgero','',NULL,1,24),(4608,'S�o Martinho','',NULL,1,24),(4609,'S�o Miguel da Boa Vista','',NULL,1,24),(4610,'S�o Miguel do Oeste','',NULL,1,24),(4611,'S�o Pedro de Alc�ntara','',NULL,1,24),(4612,'Saudades','',NULL,1,24),(4613,'Schroeder','',NULL,1,24),(4614,'Seara','',NULL,1,24),(4615,'Serra Alta','',NULL,1,24),(4616,'Sider�polis','',NULL,1,24),(4617,'Sombrio','',NULL,1,24),(4618,'Sul Brasil','',NULL,1,24),(4619,'Tai�','',NULL,1,24),(4620,'Tangar�','',NULL,1,24),(4621,'Tigrinhos','',NULL,1,24),(4622,'Tijucas','',NULL,1,24),(4623,'Timb� do Sul','',NULL,1,24),(4624,'Timb�','',NULL,1,24),(4625,'Timb� Grande','',NULL,1,24),(4626,'Tr�s Barras','',NULL,1,24),(4627,'Treviso','',NULL,1,24),(4628,'Treze de Maio','',NULL,1,24),(4629,'Treze T�lias','',NULL,1,24),(4630,'Trombudo Central','',NULL,1,24),(4631,'Tubar�o','',NULL,1,24),(4632,'Tun�polis','',NULL,1,24),(4633,'Turvo','',NULL,1,24),(4634,'Uni�o do Oeste','',NULL,1,24),(4635,'Urubici','',NULL,1,24),(4636,'Urupema','',NULL,1,24),(4637,'Urussanga','',NULL,1,24),(4638,'Varge�o','',NULL,1,24),(4639,'Vargem','',NULL,1,24),(4640,'Vargem Bonita','',NULL,1,24),(4641,'Vidal Ramos','',NULL,1,24),(4642,'Videira','',NULL,1,24),(4643,'Vitor Meireles','',NULL,1,24),(4644,'Witmarsum','',NULL,1,24),(4645,'Xanxer�','',NULL,1,24),(4646,'Xavantina','',NULL,1,24),(4647,'Xaxim','',NULL,1,24),(4648,'Zort�a','',NULL,1,24),(4649,'Adamantina','',NULL,1,25),(4650,'Adolfo','',NULL,1,25),(4651,'Agua�','',NULL,1,25),(4652,'�guas da Prata','',NULL,1,25),(4653,'�guas de Lind�ia','',NULL,1,25),(4654,'�guas de Santa B�rbara','',NULL,1,25),(4655,'�guas de S�o Pedro','',NULL,1,25),(4656,'Agudos','',NULL,1,25),(4657,'Alambari','',NULL,1,25),(4658,'Alfredo Marcondes','',NULL,1,25),(4659,'Altair','',NULL,1,25),(4660,'Altin�polis','',NULL,1,25),(4661,'Alto Alegre','',NULL,1,25),(4662,'Alum�nio','',NULL,1,25),(4663,'�lvares Florence','',NULL,1,25),(4664,'�lvares Machado','',NULL,1,25),(4665,'�lvaro de Carvalho','',NULL,1,25),(4666,'Alvinl�ndia','',NULL,1,25),(4667,'Americana','',NULL,1,25),(4668,'Am�rico Brasiliense','',NULL,1,25),(4669,'Am�rico de Campos','',NULL,1,25),(4670,'Amparo','',NULL,1,25),(4671,'Anal�ndia','',NULL,1,25),(4672,'Andradina','',NULL,1,25),(4673,'Angatuba','',NULL,1,25),(4674,'Anhembi','',NULL,1,25),(4675,'Anhumas','',NULL,1,25),(4676,'Aparecida','',NULL,1,25),(4677,'Aparecida d`Oeste','',NULL,1,25),(4678,'Apia�','',NULL,1,25),(4679,'Ara�ariguama','',NULL,1,25),(4680,'Ara�atuba','',NULL,1,25),(4681,'Ara�oiaba da Serra','',NULL,1,25),(4682,'Aramina','',NULL,1,25),(4683,'Arandu','',NULL,1,25),(4684,'Arape�','',NULL,1,25),(4685,'Araraquara','',NULL,1,25),(4686,'Araras','',NULL,1,25),(4687,'Arco-�ris','',NULL,1,25),(4688,'Arealva','',NULL,1,25),(4689,'Areias','',NULL,1,25),(4690,'Arei�polis','',NULL,1,25),(4691,'Ariranha','',NULL,1,25),(4692,'Artur Nogueira','',NULL,1,25),(4693,'Aruj�','',NULL,1,25),(4694,'Asp�sia','',NULL,1,25),(4695,'Assis','',NULL,1,25),(4696,'Atibaia','',NULL,1,25),(4697,'Auriflama','',NULL,1,25),(4698,'Ava�','',NULL,1,25),(4699,'Avanhandava','',NULL,1,25),(4700,'Avar�','',NULL,1,25),(4701,'Bady Bassitt','',NULL,1,25),(4702,'Balbinos','',NULL,1,25),(4703,'B�lsamo','',NULL,1,25),(4704,'Bananal','',NULL,1,25),(4705,'Bar�o de Antonina','',NULL,1,25),(4706,'Barbosa','',NULL,1,25),(4707,'Bariri','',NULL,1,25),(4708,'Barra Bonita','',NULL,1,25),(4709,'Barra do Chap�u','',NULL,1,25),(4710,'Barra do Turvo','',NULL,1,25),(4711,'Barretos','',NULL,1,25),(4712,'Barrinha','',NULL,1,25),(4713,'Barueri','',NULL,1,25),(4714,'Bastos','',NULL,1,25),(4715,'Batatais','',NULL,1,25),(4716,'Bauru','',NULL,1,25),(4717,'Bebedouro','',NULL,1,25),(4718,'Bento de Abreu','',NULL,1,25),(4719,'Bernardino de Campos','',NULL,1,25),(4720,'Bertioga','',NULL,1,25),(4721,'Bilac','',NULL,1,25),(4722,'Birigui','',NULL,1,25),(4723,'Biritiba-Mirim','',NULL,1,25),(4724,'Boa Esperan�a do Sul','',NULL,1,25),(4725,'Bocaina','',NULL,1,25),(4726,'Bofete','',NULL,1,25),(4727,'Boituva','',NULL,1,25),(4728,'Bom Jesus dos Perd�es','',NULL,1,25),(4729,'Bom Sucesso de Itarar�','',NULL,1,25),(4730,'Bor�','',NULL,1,25),(4731,'Borac�ia','',NULL,1,25),(4732,'Borborema','',NULL,1,25),(4733,'Borebi','',NULL,1,25),(4734,'Botucatu','',NULL,1,25),(4735,'Bragan�a Paulista','',NULL,1,25),(4736,'Bra�na','',NULL,1,25),(4737,'Brejo Alegre','',NULL,1,25),(4738,'Brodowski','',NULL,1,25),(4739,'Brotas','',NULL,1,25),(4740,'Buri','',NULL,1,25),(4741,'Buritama','',NULL,1,25),(4742,'Buritizal','',NULL,1,25),(4743,'Cabr�lia Paulista','',NULL,1,25),(4744,'Cabre�va','',NULL,1,25),(4745,'Ca�apava','',NULL,1,25),(4746,'Cachoeira Paulista','',NULL,1,25),(4747,'Caconde','',NULL,1,25),(4748,'Cafel�ndia','',NULL,1,25),(4749,'Caiabu','',NULL,1,25),(4750,'Caieiras','',NULL,1,25),(4751,'Caiu�','',NULL,1,25),(4752,'Cajamar','',NULL,1,25),(4753,'Cajati','',NULL,1,25),(4754,'Cajobi','',NULL,1,25),(4755,'Cajuru','',NULL,1,25),(4756,'Campina do Monte Alegre','',NULL,1,25),(4757,'Campinas','',NULL,1,25),(4758,'Campo Limpo Paulista','',NULL,1,25),(4759,'Campos do Jord�o','',NULL,1,25),(4760,'Campos Novos Paulista','',NULL,1,25),(4761,'Canan�ia','',NULL,1,25),(4762,'Canas','',NULL,1,25),(4763,'C�ndido Mota','',NULL,1,25),(4764,'C�ndido Rodrigues','',NULL,1,25),(4765,'Canitar','',NULL,1,25),(4766,'Cap�o Bonito','',NULL,1,25),(4767,'Capela do Alto','',NULL,1,25),(4768,'Capivari','',NULL,1,25),(4769,'Caraguatatuba','',NULL,1,25),(4770,'Carapicu�ba','',NULL,1,25),(4771,'Cardoso','',NULL,1,25),(4772,'Casa Branca','',NULL,1,25),(4773,'C�ssia dos Coqueiros','',NULL,1,25),(4774,'Castilho','',NULL,1,25),(4775,'Catanduva','',NULL,1,25),(4776,'Catigu�','',NULL,1,25),(4777,'Cedral','',NULL,1,25),(4778,'Cerqueira C�sar','',NULL,1,25),(4779,'Cerquilho','',NULL,1,25),(4780,'Ces�rio Lange','',NULL,1,25),(4781,'Charqueada','',NULL,1,25),(4782,'Chavantes','',NULL,1,25),(4783,'Clementina','',NULL,1,25),(4784,'Colina','',NULL,1,25),(4785,'Col�mbia','',NULL,1,25),(4786,'Conchal','',NULL,1,25),(4787,'Conchas','',NULL,1,25),(4788,'Cordeir�polis','',NULL,1,25),(4789,'Coroados','',NULL,1,25),(4790,'Coronel Macedo','',NULL,1,25),(4791,'Corumbata�','',NULL,1,25),(4792,'Cosm�polis','',NULL,1,25),(4793,'Cosmorama','',NULL,1,25),(4794,'Cotia','',NULL,1,25),(4795,'Cravinhos','',NULL,1,25),(4796,'Cristais Paulista','',NULL,1,25),(4797,'Cruz�lia','',NULL,1,25),(4798,'Cruzeiro','',NULL,1,25),(4799,'Cubat�o','',NULL,1,25),(4800,'Cunha','',NULL,1,25),(4801,'Descalvado','',NULL,1,25),(4802,'Diadema','',NULL,1,25),(4803,'Dirce Reis','',NULL,1,25),(4804,'Divinol�ndia','',NULL,1,25),(4805,'Dobrada','',NULL,1,25),(4806,'Dois C�rregos','',NULL,1,25),(4807,'Dolcin�polis','',NULL,1,25),(4808,'Dourado','',NULL,1,25),(4809,'Dracena','',NULL,1,25),(4810,'Duartina','',NULL,1,25),(4811,'Dumont','',NULL,1,25),(4812,'Echapor�','',NULL,1,25),(4813,'Eldorado','',NULL,1,25),(4814,'Elias Fausto','',NULL,1,25),(4815,'Elisi�rio','',NULL,1,25),(4816,'Emba�ba','',NULL,1,25),(4817,'Embu','',NULL,1,25),(4818,'Embu-Gua�u','',NULL,1,25),(4819,'Emilian�polis','',NULL,1,25),(4820,'Engenheiro Coelho','',NULL,1,25),(4821,'Esp�rito Santo do Pinhal','',NULL,1,25),(4822,'Esp�rito Santo do Turvo','',NULL,1,25),(4823,'Estiva Gerbi','',NULL,1,25),(4824,'Estrela d`Oeste','',NULL,1,25),(4825,'Estrela do Norte','',NULL,1,25),(4826,'Euclides da Cunha Paulista','',NULL,1,25),(4827,'Fartura','',NULL,1,25),(4828,'Fernando Prestes','',NULL,1,25),(4829,'Fernand�polis','',NULL,1,25),(4830,'Fern�o','',NULL,1,25),(4831,'Ferraz de Vasconcelos','',NULL,1,25),(4832,'Flora Rica','',NULL,1,25),(4833,'Floreal','',NULL,1,25),(4834,'Flor�nia','',NULL,1,25),(4835,'Fl�rida Paulista','',NULL,1,25),(4836,'Franca','',NULL,1,25),(4837,'Francisco Morato','',NULL,1,25),(4838,'Franco da Rocha','',NULL,1,25),(4839,'Gabriel Monteiro','',NULL,1,25),(4840,'G�lia','',NULL,1,25),(4841,'Gar�a','',NULL,1,25),(4842,'Gast�o Vidigal','',NULL,1,25),(4843,'Gavi�o Peixoto','',NULL,1,25),(4844,'General Salgado','',NULL,1,25),(4845,'Getulina','',NULL,1,25),(4846,'Glic�rio','',NULL,1,25),(4847,'Guai�ara','',NULL,1,25),(4848,'Guaimb�','',NULL,1,25),(4849,'Gua�ra','',NULL,1,25),(4850,'Guapia�u','',NULL,1,25),(4851,'Guapiara','',NULL,1,25),(4852,'Guar�','',NULL,1,25),(4853,'Guara�a�','',NULL,1,25),(4854,'Guaraci','',NULL,1,25),(4855,'Guarani d`Oeste','',NULL,1,25),(4856,'Guarant�','',NULL,1,25),(4857,'Guararapes','',NULL,1,25),(4858,'Guararema','',NULL,1,25),(4859,'Guaratinguet�','',NULL,1,25),(4860,'Guare�','',NULL,1,25),(4861,'Guariba','',NULL,1,25),(4862,'Guaruj�','',NULL,1,25),(4863,'Guarulhos','',NULL,1,25),(4864,'Guatapar�','',NULL,1,25),(4865,'Guzol�ndia','',NULL,1,25),(4866,'Hercul�ndia','',NULL,1,25),(4867,'Holambra','',NULL,1,25),(4868,'Hortol�ndia','',NULL,1,25),(4869,'Iacanga','',NULL,1,25),(4870,'Iacri','',NULL,1,25),(4871,'Iaras','',NULL,1,25),(4872,'Ibat�','',NULL,1,25),(4873,'Ibir�','',NULL,1,25),(4874,'Ibirarema','',NULL,1,25),(4875,'Ibitinga','',NULL,1,25),(4876,'Ibi�na','',NULL,1,25),(4877,'Ic�m','',NULL,1,25),(4878,'Iep�','',NULL,1,25),(4879,'Igara�u do Tiet�','',NULL,1,25),(4880,'Igarapava','',NULL,1,25),(4881,'Igarat�','',NULL,1,25),(4882,'Iguape','',NULL,1,25),(4883,'Ilha Comprida','',NULL,1,25),(4884,'Ilha Solteira','',NULL,1,25),(4885,'Ilhabela','',NULL,1,25),(4886,'Indaiatuba','',NULL,1,25),(4887,'Indiana','',NULL,1,25),(4888,'Indiapor�','',NULL,1,25),(4889,'In�bia Paulista','',NULL,1,25),(4890,'Ipau�u','',NULL,1,25),(4891,'Iper�','',NULL,1,25),(4892,'Ipe�na','',NULL,1,25),(4893,'Ipigu�','',NULL,1,25),(4894,'Iporanga','',NULL,1,25),(4895,'Ipu�','',NULL,1,25),(4896,'Iracem�polis','',NULL,1,25),(4897,'Irapu�','',NULL,1,25),(4898,'Irapuru','',NULL,1,25),(4899,'Itaber�','',NULL,1,25),(4900,'Ita�','',NULL,1,25),(4901,'Itajobi','',NULL,1,25),(4902,'Itaju','',NULL,1,25),(4903,'Itanha�m','',NULL,1,25),(4904,'Ita�ca','',NULL,1,25),(4905,'Itapecerica da Serra','',NULL,1,25),(4906,'Itapetininga','',NULL,1,25),(4907,'Itapeva','',NULL,1,25),(4908,'Itapevi','',NULL,1,25),(4909,'Itapira','',NULL,1,25),(4910,'Itapirapu� Paulista','',NULL,1,25),(4911,'It�polis','',NULL,1,25),(4912,'Itaporanga','',NULL,1,25),(4913,'Itapu�','',NULL,1,25),(4914,'Itapura','',NULL,1,25),(4915,'Itaquaquecetuba','',NULL,1,25),(4916,'Itarar�','',NULL,1,25),(4917,'Itariri','',NULL,1,25),(4918,'Itatiba','',NULL,1,25),(4919,'Itatinga','',NULL,1,25),(4920,'Itirapina','',NULL,1,25),(4921,'Itirapu�','',NULL,1,25),(4922,'Itobi','',NULL,1,25),(4923,'Itu','',NULL,1,25),(4924,'Itupeva','',NULL,1,25),(4925,'Ituverava','',NULL,1,25),(4926,'Jaborandi','',NULL,1,25),(4927,'Jaboticabal','',NULL,1,25),(4928,'Jacare�','',NULL,1,25),(4929,'Jaci','',NULL,1,25),(4930,'Jacupiranga','',NULL,1,25),(4931,'Jaguari�na','',NULL,1,25),(4932,'Jales','',NULL,1,25),(4933,'Jambeiro','',NULL,1,25),(4934,'Jandira','',NULL,1,25),(4935,'Jardin�polis','',NULL,1,25),(4936,'Jarinu','',NULL,1,25),(4937,'Ja�','',NULL,1,25),(4938,'Jeriquara','',NULL,1,25),(4939,'Joan�polis','',NULL,1,25),(4940,'Jo�o Ramalho','',NULL,1,25),(4941,'Jos� Bonif�cio','',NULL,1,25),(4942,'J�lio Mesquita','',NULL,1,25),(4943,'Jumirim','',NULL,1,25),(4944,'Jundia�','',NULL,1,25),(4945,'Junqueir�polis','',NULL,1,25),(4946,'Juqui�','',NULL,1,25),(4947,'Juquitiba','',NULL,1,25),(4948,'Lagoinha','',NULL,1,25),(4949,'Laranjal Paulista','',NULL,1,25),(4950,'Lav�nia','',NULL,1,25),(4951,'Lavrinhas','',NULL,1,25),(4952,'Leme','',NULL,1,25),(4953,'Len��is Paulista','',NULL,1,25),(4954,'Limeira','',NULL,1,25),(4955,'Lind�ia','',NULL,1,25),(4956,'Lins','',NULL,1,25),(4957,'Lorena','',NULL,1,25),(4958,'Lourdes','',NULL,1,25),(4959,'Louveira','',NULL,1,25),(4960,'Luc�lia','',NULL,1,25),(4961,'Lucian�polis','',NULL,1,25),(4962,'Lu�s Ant�nio','',NULL,1,25),(4963,'Luizi�nia','',NULL,1,25),(4964,'Lup�rcio','',NULL,1,25),(4965,'Lut�cia','',NULL,1,25),(4966,'Macatuba','',NULL,1,25),(4967,'Macaubal','',NULL,1,25),(4968,'Maced�nia','',NULL,1,25),(4969,'Magda','',NULL,1,25),(4970,'Mairinque','',NULL,1,25),(4971,'Mairipor�','',NULL,1,25),(4972,'Manduri','',NULL,1,25),(4973,'Marab� Paulista','',NULL,1,25),(4974,'Maraca�','',NULL,1,25),(4975,'Marapoama','',NULL,1,25),(4976,'Mari�polis','',NULL,1,25),(4977,'Mar�lia','',NULL,1,25),(4978,'Marin�polis','',NULL,1,25),(4979,'Martin�polis','',NULL,1,25),(4980,'Mat�o','',NULL,1,25),(4981,'Mau�','',NULL,1,25),(4982,'Mendon�a','',NULL,1,25),(4983,'Meridiano','',NULL,1,25),(4984,'Mes�polis','',NULL,1,25),(4985,'Miguel�polis','',NULL,1,25),(4986,'Mineiros do Tiet�','',NULL,1,25),(4987,'Mira Estrela','',NULL,1,25),(4988,'Miracatu','',NULL,1,25),(4989,'Mirand�polis','',NULL,1,25),(4990,'Mirante do Paranapanema','',NULL,1,25),(4991,'Mirassol','',NULL,1,25),(4992,'Mirassol�ndia','',NULL,1,25),(4993,'Mococa','',NULL,1,25),(4994,'Mogi das Cruzes','',NULL,1,25),(4995,'Mogi Gua�u','',NULL,1,25),(4996,'Mogi-Mirim','',NULL,1,25),(4997,'Mombuca','',NULL,1,25),(4998,'Mon��es','',NULL,1,25),(4999,'Mongagu�','',NULL,1,25),(5000,'Monte Alegre do Sul','',NULL,1,25),(5001,'Monte Alto','',NULL,1,25),(5002,'Monte Apraz�vel','',NULL,1,25),(5003,'Monte Azul Paulista','',NULL,1,25),(5004,'Monte Castelo','',NULL,1,25),(5005,'Monte Mor','',NULL,1,25),(5006,'Monteiro Lobato','',NULL,1,25),(5007,'Morro Agudo','',NULL,1,25),(5008,'Morungaba','',NULL,1,25),(5009,'Motuca','',NULL,1,25),(5010,'Murutinga do Sul','',NULL,1,25),(5011,'Nantes','',NULL,1,25),(5012,'Narandiba','',NULL,1,25),(5013,'Natividade da Serra','',NULL,1,25),(5014,'Nazar� Paulista','',NULL,1,25),(5015,'Neves Paulista','',NULL,1,25),(5016,'Nhandeara','',NULL,1,25),(5017,'Nipo�','',NULL,1,25),(5018,'Nova Alian�a','',NULL,1,25),(5019,'Nova Campina','',NULL,1,25),(5020,'Nova Cana� Paulista','',NULL,1,25),(5021,'Nova Castilho','',NULL,1,25),(5022,'Nova Europa','',NULL,1,25),(5023,'Nova Granada','',NULL,1,25),(5024,'Nova Guataporanga','',NULL,1,25),(5025,'Nova Independ�ncia','',NULL,1,25),(5026,'Nova Luzit�nia','',NULL,1,25),(5027,'Nova Odessa','',NULL,1,25),(5028,'Novais','',NULL,1,25),(5029,'Novo Horizonte','',NULL,1,25),(5030,'Nuporanga','',NULL,1,25),(5031,'Ocau�u','',NULL,1,25),(5032,'�leo','',NULL,1,25),(5033,'Ol�mpia','',NULL,1,25),(5034,'Onda Verde','',NULL,1,25),(5035,'Oriente','',NULL,1,25),(5036,'Orindi�va','',NULL,1,25),(5037,'Orl�ndia','',NULL,1,25),(5038,'Osasco','',NULL,1,25),(5039,'Oscar Bressane','',NULL,1,25),(5040,'Osvaldo Cruz','',NULL,1,25),(5041,'Ourinhos','',NULL,1,25),(5042,'Ouro Verde','',NULL,1,25),(5043,'Ouroeste','',NULL,1,25),(5044,'Pacaembu','',NULL,1,25),(5045,'Palestina','',NULL,1,25),(5046,'Palmares Paulista','',NULL,1,25),(5047,'Palmeira d`Oeste','',NULL,1,25),(5048,'Palmital','',NULL,1,25),(5049,'Panorama','',NULL,1,25),(5050,'Paragua�u Paulista','',NULL,1,25),(5051,'Paraibuna','',NULL,1,25),(5052,'Para�so','',NULL,1,25),(5053,'Paranapanema','',NULL,1,25),(5054,'Paranapu�','',NULL,1,25),(5055,'Parapu�','',NULL,1,25),(5056,'Pardinho','',NULL,1,25),(5057,'Pariquera-A�u','',NULL,1,25),(5058,'Parisi','',NULL,1,25),(5059,'Patroc�nio Paulista','',NULL,1,25),(5060,'Paulic�ia','',NULL,1,25),(5061,'Paul�nia','',NULL,1,25),(5062,'Paulist�nia','',NULL,1,25),(5063,'Paulo de Faria','',NULL,1,25),(5064,'Pederneiras','',NULL,1,25),(5065,'Pedra Bela','',NULL,1,25),(5066,'Pedran�polis','',NULL,1,25),(5067,'Pedregulho','',NULL,1,25),(5068,'Pedreira','',NULL,1,25),(5069,'Pedrinhas Paulista','',NULL,1,25),(5070,'Pedro de Toledo','',NULL,1,25),(5071,'Pen�polis','',NULL,1,25),(5072,'Pereira Barreto','',NULL,1,25),(5073,'Pereiras','',NULL,1,25),(5074,'Peru�be','',NULL,1,25),(5075,'Piacatu','',NULL,1,25),(5076,'Piedade','',NULL,1,25),(5077,'Pilar do Sul','',NULL,1,25),(5078,'Pindamonhangaba','',NULL,1,25),(5079,'Pindorama','',NULL,1,25),(5080,'Pinhalzinho','',NULL,1,25),(5081,'Piquerobi','',NULL,1,25),(5082,'Piquete','',NULL,1,25),(5083,'Piracaia','',NULL,1,25),(5084,'Piracicaba','',NULL,1,25),(5085,'Piraju','',NULL,1,25),(5086,'Piraju�','',NULL,1,25),(5087,'Pirangi','',NULL,1,25),(5088,'Pirapora do Bom Jesus','',NULL,1,25),(5089,'Pirapozinho','',NULL,1,25),(5090,'Pirassununga','',NULL,1,25),(5091,'Piratininga','',NULL,1,25),(5092,'Pitangueiras','',NULL,1,25),(5093,'Planalto','',NULL,1,25),(5094,'Platina','',NULL,1,25),(5095,'Po�','',NULL,1,25),(5096,'Poloni','',NULL,1,25),(5097,'Pomp�ia','',NULL,1,25),(5098,'Ponga�','',NULL,1,25),(5099,'Pontal','',NULL,1,25),(5100,'Pontalinda','',NULL,1,25),(5101,'Pontes Gestal','',NULL,1,25),(5102,'Populina','',NULL,1,25),(5103,'Porangaba','',NULL,1,25),(5104,'Porto Feliz','',NULL,1,25),(5105,'Porto Ferreira','',NULL,1,25),(5106,'Potim','',NULL,1,25),(5107,'Potirendaba','',NULL,1,25),(5108,'Pracinha','',NULL,1,25),(5109,'Prad�polis','',NULL,1,25),(5110,'Praia Grande','',NULL,1,25),(5111,'Prat�nia','',NULL,1,25),(5112,'Presidente Alves','',NULL,1,25),(5113,'Presidente Bernardes','',NULL,1,25),(5114,'Presidente Epit�cio','',NULL,1,25),(5115,'Presidente Prudente','',NULL,1,25),(5116,'Presidente Venceslau','',NULL,1,25),(5117,'Promiss�o','',NULL,1,25),(5118,'Quadra','',NULL,1,25),(5119,'Quat�','',NULL,1,25),(5120,'Queiroz','',NULL,1,25),(5121,'Queluz','',NULL,1,25),(5122,'Quintana','',NULL,1,25),(5123,'Rafard','',NULL,1,25),(5124,'Rancharia','',NULL,1,25),(5125,'Reden��o da Serra','',NULL,1,25),(5126,'Regente Feij�','',NULL,1,25),(5127,'Regin�polis','',NULL,1,25),(5128,'Registro','',NULL,1,25),(5129,'Restinga','',NULL,1,25),(5130,'Ribeira','',NULL,1,25),(5131,'Ribeir�o Bonito','',NULL,1,25),(5132,'Ribeir�o Branco','',NULL,1,25),(5133,'Ribeir�o Corrente','',NULL,1,25),(5134,'Ribeir�o do Sul','',NULL,1,25),(5135,'Ribeir�o dos �ndios','',NULL,1,25),(5136,'Ribeir�o Grande','',NULL,1,25),(5137,'Ribeir�o Pires','',NULL,1,25),(5138,'Ribeir�o Preto','',NULL,1,25),(5139,'Rifaina','',NULL,1,25),(5140,'Rinc�o','',NULL,1,25),(5141,'Rin�polis','',NULL,1,25),(5142,'Rio Claro','',NULL,1,25),(5143,'Rio das Pedras','',NULL,1,25),(5144,'Rio Grande da Serra','',NULL,1,25),(5145,'Riol�ndia','',NULL,1,25),(5146,'Riversul','',NULL,1,25),(5147,'Rosana','',NULL,1,25),(5148,'Roseira','',NULL,1,25),(5149,'Rubi�cea','',NULL,1,25),(5150,'Rubin�ia','',NULL,1,25),(5151,'Sabino','',NULL,1,25),(5152,'Sagres','',NULL,1,25),(5153,'Sales','',NULL,1,25),(5154,'Sales Oliveira','',NULL,1,25),(5155,'Sales�polis','',NULL,1,25),(5156,'Salmour�o','',NULL,1,25),(5157,'Saltinho','',NULL,1,25),(5158,'Salto','',NULL,1,25),(5159,'Salto de Pirapora','',NULL,1,25),(5160,'Salto Grande','',NULL,1,25),(5161,'Sandovalina','',NULL,1,25),(5162,'Santa Ad�lia','',NULL,1,25),(5163,'Santa Albertina','',NULL,1,25),(5164,'Santa B�rbara d`Oeste','',NULL,1,25),(5165,'Santa Branca','',NULL,1,25),(5166,'Santa Clara d`Oeste','',NULL,1,25),(5167,'Santa Cruz da Concei��o','',NULL,1,25),(5168,'Santa Cruz da Esperan�a','',NULL,1,25),(5169,'Santa Cruz das Palmeiras','',NULL,1,25),(5170,'Santa Cruz do Rio Pardo','',NULL,1,25),(5171,'Santa Ernestina','',NULL,1,25),(5172,'Santa F� do Sul','',NULL,1,25),(5173,'Santa Gertrudes','',NULL,1,25),(5174,'Santa Isabel','',NULL,1,25),(5175,'Santa L�cia','',NULL,1,25),(5176,'Santa Maria da Serra','',NULL,1,25),(5177,'Santa Mercedes','',NULL,1,25),(5178,'Santa Rita d`Oeste','',NULL,1,25),(5179,'Santa Rita do Passa Quatro','',NULL,1,25),(5180,'Santa Rosa de Viterbo','',NULL,1,25),(5181,'Santa Salete','',NULL,1,25),(5182,'Santana da Ponte Pensa','',NULL,1,25),(5183,'Santana de Parna�ba','',NULL,1,25),(5184,'Santo Anast�cio','',NULL,1,25),(5185,'Santo Andr�','',NULL,1,25),(5186,'Santo Ant�nio da Alegria','',NULL,1,25),(5187,'Santo Ant�nio de Posse','',NULL,1,25),(5188,'Santo Ant�nio do Aracangu�','',NULL,1,25),(5189,'Santo Ant�nio do Jardim','',NULL,1,25),(5190,'Santo Ant�nio do Pinhal','',NULL,1,25),(5191,'Santo Expedito','',NULL,1,25),(5192,'Sant�polis do Aguape�','',NULL,1,25),(5193,'Santos','',NULL,1,25),(5194,'S�o Bento do Sapuca�','',NULL,1,25),(5195,'S�o Bernardo do Campo','',NULL,1,25),(5196,'S�o Caetano do Sul','',NULL,1,25),(5197,'S�o Carlos','',NULL,1,25),(5198,'S�o Francisco','',NULL,1,25),(5199,'S�o Jo�o da Boa Vista','',NULL,1,25),(5200,'S�o Jo�o das Duas Pontes','',NULL,1,25),(5201,'S�o Jo�o de Iracema','',NULL,1,25),(5202,'S�o Jo�o do Pau d`Alho','',NULL,1,25),(5203,'S�o Joaquim da Barra','',NULL,1,25),(5204,'S�o Jos� da Bela Vista','',NULL,1,25),(5205,'S�o Jos� do Barreiro','',NULL,1,25),(5206,'S�o Jos� do Rio Pardo','',NULL,1,25),(5207,'S�o Jos� do Rio Preto','',NULL,1,25),(5208,'S�o Jos� dos Campos','',NULL,1,25),(5209,'S�o Louren�o da Serra','',NULL,1,25),(5210,'S�o Lu�s do Paraitinga','',NULL,1,25),(5211,'S�o Manuel','',NULL,1,25),(5212,'S�o Miguel Arcanjo','',NULL,1,25),(5213,'S�o Paulo','',NULL,1,25),(5214,'S�o Pedro','',NULL,1,25),(5215,'S�o Pedro do Turvo','',NULL,1,25),(5216,'S�o Roque','',NULL,1,25),(5217,'S�o Sebasti�o','',NULL,1,25),(5218,'S�o Sebasti�o da Grama','',NULL,1,25),(5219,'S�o Sim�o','',NULL,1,25),(5220,'S�o Vicente','',NULL,1,25),(5221,'Sarapu�','',NULL,1,25),(5222,'Sarutai�','',NULL,1,25),(5223,'Sebastian�polis do Sul','',NULL,1,25),(5224,'Serra Azul','',NULL,1,25),(5225,'Serra Negra','',NULL,1,25),(5226,'Serrana','',NULL,1,25),(5227,'Sert�ozinho','',NULL,1,25),(5228,'Sete Barras','',NULL,1,25),(5229,'Sever�nia','',NULL,1,25),(5230,'Silveiras','',NULL,1,25),(5231,'Socorro','',NULL,1,25),(5232,'Sorocaba','',NULL,1,25),(5233,'Sud Mennucci','',NULL,1,25),(5234,'Sumar�','',NULL,1,25),(5235,'Suzan�polis','',NULL,1,25),(5236,'Suzano','',NULL,1,25),(5237,'Tabapu�','',NULL,1,25),(5238,'Tabatinga','',NULL,1,25),(5239,'Tabo�o da Serra','',NULL,1,25),(5240,'Taciba','',NULL,1,25),(5241,'Tagua�','',NULL,1,25),(5242,'Taia�u','',NULL,1,25),(5243,'Tai�va','',NULL,1,25),(5244,'Tamba�','',NULL,1,25),(5245,'Tanabi','',NULL,1,25),(5246,'Tapira�','',NULL,1,25),(5247,'Tapiratiba','',NULL,1,25),(5248,'Taquaral','',NULL,1,25),(5249,'Taquaritinga','',NULL,1,25),(5250,'Taquarituba','',NULL,1,25),(5251,'Taquariva�','',NULL,1,25),(5252,'Tarabai','',NULL,1,25),(5253,'Tarum�','',NULL,1,25),(5254,'Tatu�','',NULL,1,25),(5255,'Taubat�','',NULL,1,25),(5256,'Tejup�','',NULL,1,25),(5257,'Teodoro Sampaio','',NULL,1,25),(5258,'Terra Roxa','',NULL,1,25),(5259,'Tiet�','',NULL,1,25),(5260,'Timburi','',NULL,1,25),(5261,'Torre de Pedra','',NULL,1,25),(5262,'Torrinha','',NULL,1,25),(5263,'Trabiju','',NULL,1,25),(5264,'Trememb�','',NULL,1,25),(5265,'Tr�s Fronteiras','',NULL,1,25),(5266,'Tuiuti','',NULL,1,25),(5267,'Tup�','',NULL,1,25),(5268,'Tupi Paulista','',NULL,1,25),(5269,'Turi�ba','',NULL,1,25),(5270,'Turmalina','',NULL,1,25),(5271,'Ubarana','',NULL,1,25),(5272,'Ubatuba','',NULL,1,25),(5273,'Ubirajara','',NULL,1,25),(5274,'Uchoa','',NULL,1,25),(5275,'Uni�o Paulista','',NULL,1,25),(5276,'Ur�nia','',NULL,1,25),(5277,'Uru','',NULL,1,25),(5278,'Urup�s','',NULL,1,25),(5279,'Valentim Gentil','',NULL,1,25),(5280,'Valinhos','',NULL,1,25),(5281,'Valpara�so','',NULL,1,25),(5282,'Vargem','',NULL,1,25),(5283,'Vargem Grande do Sul','',NULL,1,25),(5284,'Vargem Grande Paulista','',NULL,1,25),(5285,'V�rzea Paulista','',NULL,1,25),(5286,'Vera Cruz','',NULL,1,25),(5287,'Vinhedo','',NULL,1,25),(5288,'Viradouro','',NULL,1,25),(5289,'Vista Alegre do Alto','',NULL,1,25),(5290,'Vit�ria Brasil','',NULL,1,25),(5291,'Votorantim','',NULL,1,25),(5292,'Votuporanga','',NULL,1,25),(5293,'Zacarias','',NULL,1,25),(5294,'Amparo de S�o Francisco','',NULL,1,26),(5295,'Aquidab�','',NULL,1,26),(5296,'Aracaju','',NULL,1,26),(5297,'Arau�','',NULL,1,26),(5298,'Areia Branca','',NULL,1,26),(5299,'Barra dos Coqueiros','',NULL,1,26),(5300,'Boquim','',NULL,1,26),(5301,'Brejo Grande','',NULL,1,26),(5302,'Campo do Brito','',NULL,1,26),(5303,'Canhoba','',NULL,1,26),(5304,'Canind� de S�o Francisco','',NULL,1,26),(5305,'Capela','',NULL,1,26),(5306,'Carira','',NULL,1,26),(5307,'Carm�polis','',NULL,1,26),(5308,'Cedro de S�o Jo�o','',NULL,1,26),(5309,'Cristin�polis','',NULL,1,26),(5310,'Cumbe','',NULL,1,26),(5311,'Divina Pastora','',NULL,1,26),(5312,'Est�ncia','',NULL,1,26),(5313,'Feira Nova','',NULL,1,26),(5314,'Frei Paulo','',NULL,1,26),(5315,'Gararu','',NULL,1,26),(5316,'General Maynard','',NULL,1,26),(5317,'Gracho Cardoso','',NULL,1,26),(5318,'Ilha das Flores','',NULL,1,26),(5319,'Indiaroba','',NULL,1,26),(5320,'Itabaiana','',NULL,1,26),(5321,'Itabaianinha','',NULL,1,26),(5322,'Itabi','',NULL,1,26),(5323,'Itaporanga d`Ajuda','',NULL,1,26),(5324,'Japaratuba','',NULL,1,26),(5325,'Japoat�','',NULL,1,26),(5326,'Lagarto','',NULL,1,26),(5327,'Laranjeiras','',NULL,1,26),(5328,'Macambira','',NULL,1,26),(5329,'Malhada dos Bois','',NULL,1,26),(5330,'Malhador','',NULL,1,26),(5331,'Maruim','',NULL,1,26),(5332,'Moita Bonita','',NULL,1,26),(5333,'Monte Alegre de Sergipe','',NULL,1,26),(5334,'Muribeca','',NULL,1,26),(5335,'Ne�polis','',NULL,1,26),(5336,'Nossa Senhora Aparecida','',NULL,1,26),(5337,'Nossa Senhora da Gl�ria','',NULL,1,26),(5338,'Nossa Senhora das Dores','',NULL,1,26),(5339,'Nossa Senhora de Lourdes','',NULL,1,26),(5340,'Nossa Senhora do Socorro','',NULL,1,26),(5341,'Pacatuba','',NULL,1,26),(5342,'Pedra Mole','',NULL,1,26),(5343,'Pedrinhas','',NULL,1,26),(5344,'Pinh�o','',NULL,1,26),(5345,'Pirambu','',NULL,1,26),(5346,'Po�o Redondo','',NULL,1,26),(5347,'Po�o Verde','',NULL,1,26),(5348,'Porto da Folha','',NULL,1,26),(5349,'Propri�','',NULL,1,26),(5350,'Riach�o do Dantas','',NULL,1,26),(5351,'Riachuelo','',NULL,1,26),(5352,'Ribeir�polis','',NULL,1,26),(5353,'Ros�rio do Catete','',NULL,1,26),(5354,'Salgado','',NULL,1,26),(5355,'Santa Luzia do Itanhy','',NULL,1,26),(5356,'Santa Rosa de Lima','',NULL,1,26),(5357,'Santana do S�o Francisco','',NULL,1,26),(5358,'Santo Amaro das Brotas','',NULL,1,26),(5359,'S�o Crist�v�o','',NULL,1,26),(5360,'S�o Domingos','',NULL,1,26),(5361,'S�o Francisco','',NULL,1,26),(5362,'S�o Miguel do Aleixo','',NULL,1,26),(5363,'Sim�o Dias','',NULL,1,26),(5364,'Siriri','',NULL,1,26),(5365,'Telha','',NULL,1,26),(5366,'Tobias Barreto','',NULL,1,26),(5367,'Tomar do Geru','',NULL,1,26),(5368,'Umba�ba','',NULL,1,26),(5369,'Abreul�ndia','',NULL,1,27),(5370,'Aguiarn�polis','',NULL,1,27),(5371,'Alian�a do Tocantins','',NULL,1,27),(5372,'Almas','',NULL,1,27),(5373,'Alvorada','',NULL,1,27),(5374,'Anan�s','',NULL,1,27),(5375,'Angico','',NULL,1,27),(5376,'Aparecida do Rio Negro','',NULL,1,27),(5377,'Aragominas','',NULL,1,27),(5378,'Araguacema','',NULL,1,27),(5379,'Aragua�u','',NULL,1,27),(5380,'Aragua�na','',NULL,1,27),(5381,'Araguan�','',NULL,1,27),(5382,'Araguatins','',NULL,1,27),(5383,'Arapoema','',NULL,1,27),(5384,'Arraias','',NULL,1,27),(5385,'Augustin�polis','',NULL,1,27),(5386,'Aurora do Tocantins','',NULL,1,27),(5387,'Axix� do Tocantins','',NULL,1,27),(5388,'Baba�ul�ndia','',NULL,1,27),(5389,'Bandeirantes do Tocantins','',NULL,1,27),(5390,'Barra do Ouro','',NULL,1,27),(5391,'Barrol�ndia','',NULL,1,27),(5392,'Bernardo Say�o','',NULL,1,27),(5393,'Bom Jesus do Tocantins','',NULL,1,27),(5394,'Brasil�ndia do Tocantins','',NULL,1,27),(5395,'Brejinho de Nazar�','',NULL,1,27),(5396,'Buriti do Tocantins','',NULL,1,27),(5397,'Cachoeirinha','',NULL,1,27),(5398,'Campos Lindos','',NULL,1,27),(5399,'Cariri do Tocantins','',NULL,1,27),(5400,'Carmol�ndia','',NULL,1,27),(5401,'Carrasco Bonito','',NULL,1,27),(5402,'Caseara','',NULL,1,27),(5403,'Centen�rio','',NULL,1,27),(5404,'Chapada da Natividade','',NULL,1,27),(5405,'Chapada de Areia','',NULL,1,27),(5406,'Colinas do Tocantins','',NULL,1,27),(5407,'Colm�ia','',NULL,1,27),(5408,'Combinado','',NULL,1,27),(5409,'Concei��o do Tocantins','',NULL,1,27),(5410,'Couto de Magalh�es','',NULL,1,27),(5411,'Cristal�ndia','',NULL,1,27),(5412,'Crix�s do Tocantins','',NULL,1,27),(5413,'Darcin�polis','',NULL,1,27),(5414,'Dian�polis','',NULL,1,27),(5415,'Divin�polis do Tocantins','',NULL,1,27),(5416,'Dois Irm�os do Tocantins','',NULL,1,27),(5417,'Duer�','',NULL,1,27),(5418,'Esperantina','',NULL,1,27),(5419,'F�tima','',NULL,1,27),(5420,'Figueir�polis','',NULL,1,27),(5421,'Filad�lfia','',NULL,1,27),(5422,'Formoso do Araguaia','',NULL,1,27),(5423,'Fortaleza do Taboc�o','',NULL,1,27),(5424,'Goianorte','',NULL,1,27),(5425,'Goiatins','',NULL,1,27),(5426,'Guara�','',NULL,1,27),(5427,'Gurupi','',NULL,1,27),(5428,'Ipueiras','',NULL,1,27),(5429,'Itacaj�','',NULL,1,27),(5430,'Itaguatins','',NULL,1,27),(5431,'Itapiratins','',NULL,1,27),(5432,'Itapor� do Tocantins','',NULL,1,27),(5433,'Ja� do Tocantins','',NULL,1,27),(5434,'Juarina','',NULL,1,27),(5435,'Lagoa da Confus�o','',NULL,1,27),(5436,'Lagoa do Tocantins','',NULL,1,27),(5437,'Lajeado','',NULL,1,27),(5438,'Lavandeira','',NULL,1,27),(5439,'Lizarda','',NULL,1,27),(5440,'Luzin�polis','',NULL,1,27),(5441,'Marian�polis do Tocantins','',NULL,1,27),(5442,'Mateiros','',NULL,1,27),(5443,'Mauril�ndia do Tocantins','',NULL,1,27),(5444,'Miracema do Tocantins','',NULL,1,27),(5445,'Miranorte','',NULL,1,27),(5446,'Monte do Carmo','',NULL,1,27),(5447,'Monte Santo do Tocantins','',NULL,1,27),(5448,'Muricil�ndia','',NULL,1,27),(5449,'Natividade','',NULL,1,27),(5450,'Nazar�','',NULL,1,27),(5451,'Nova Olinda','',NULL,1,27),(5452,'Nova Rosal�ndia','',NULL,1,27),(5453,'Novo Acordo','',NULL,1,27),(5454,'Novo Alegre','',NULL,1,27),(5455,'Novo Jardim','',NULL,1,27),(5456,'Oliveira de F�tima','',NULL,1,27),(5457,'Palmas','',NULL,1,27),(5458,'Palmeirante','',NULL,1,27),(5459,'Palmeiras do Tocantins','',NULL,1,27),(5460,'Palmeir�polis','',NULL,1,27),(5461,'Para�so do Tocantins','',NULL,1,27),(5462,'Paran�','',NULL,1,27),(5463,'Pau d`Arco','',NULL,1,27),(5464,'Pedro Afonso','',NULL,1,27),(5465,'Peixe','',NULL,1,27),(5466,'Pequizeiro','',NULL,1,27),(5467,'Pindorama do Tocantins','',NULL,1,27),(5468,'Piraqu�','',NULL,1,27),(5469,'Pium','',NULL,1,27),(5470,'Ponte Alta do Bom Jesus','',NULL,1,27),(5471,'Ponte Alta do Tocantins','',NULL,1,27),(5472,'Porto Alegre do Tocantins','',NULL,1,27),(5473,'Porto Nacional','',NULL,1,27),(5474,'Praia Norte','',NULL,1,27),(5475,'Presidente Kennedy','',NULL,1,27),(5476,'Pugmil','',NULL,1,27),(5477,'Recursol�ndia','',NULL,1,27),(5478,'Riachinho','',NULL,1,27),(5479,'Rio da Concei��o','',NULL,1,27),(5480,'Rio dos Bois','',NULL,1,27),(5481,'Rio Sono','',NULL,1,27),(5482,'Sampaio','',NULL,1,27),(5483,'Sandol�ndia','',NULL,1,27),(5484,'Santa F� do Araguaia','',NULL,1,27),(5485,'Santa Maria do Tocantins','',NULL,1,27),(5486,'Santa Rita do Tocantins','',NULL,1,27),(5487,'Santa Rosa do Tocantins','',NULL,1,27),(5488,'Santa Tereza do Tocantins','',NULL,1,27),(5489,'Santa Terezinha do Tocantins','',NULL,1,27),(5490,'S�o Bento do Tocantins','',NULL,1,27),(5491,'S�o F�lix do Tocantins','',NULL,1,27),(5492,'S�o Miguel do Tocantins','',NULL,1,27),(5493,'S�o Salvador do Tocantins','',NULL,1,27),(5494,'S�o Sebasti�o do Tocantins','',NULL,1,27),(5495,'S�o Val�rio da Natividade','',NULL,1,27),(5496,'Silvan�polis','',NULL,1,27),(5497,'S�tio Novo do Tocantins','',NULL,1,27),(5498,'Sucupira','',NULL,1,27),(5499,'Taguatinga','',NULL,1,27),(5500,'Taipas do Tocantins','',NULL,1,27),(5501,'Talism�','',NULL,1,27),(5502,'Tocant�nia','',NULL,1,27),(5503,'Tocantin�polis','',NULL,1,27),(5504,'Tupirama','',NULL,1,27),(5505,'Tupiratins','',NULL,1,27),(5506,'Wanderl�ndia','',NULL,1,27),(5507,'Xambio�','',NULL,1,27);

#
# Structure for table "sme_endereco"
#

CREATE TABLE `sme_endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `complemento` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `cidade_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B4A606A09586CC8` (`cidade_id`),
  CONSTRAINT `endereco_fk01` FOREIGN KEY (`cidade_id`) REFERENCES `sme_cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12893 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=196 COMMENT='InnoDB free: 10240 kB; (`cidade_id`) REFER `dgp/sme_cidade`(';

#
# Data for table "sme_endereco"
#

REPLACE INTO `sme_endereco` VALUES (12892,'Avenida Vereador Abrah�o Jo�o Francisco','3855','','Carvalho','88307303','2016-04-28 16:21:02','0000-00-00 00:00:00',NULL,'-26.92915','-48.68328',1,4481);

#
# Structure for table "sme_particularidade"
#

CREATE TABLE `sme_particularidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `tipo` enum('DEFICIENCIA','TRANSTORNO','SUPERDOTACAO') NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "sme_particularidade"
#

REPLACE INTO `sme_particularidade` VALUES (1,'Baixa vis�o','DEFICIENCIA',1),(2,'Cegueira\r','DEFICIENCIA',1),(3,'Defici�ncia auditiva','DEFICIENCIA',1),(4,'Defici�ncia f�sica\r','DEFICIENCIA',1),(5,'Defici�ncia intelectual','DEFICIENCIA',1),(6,'Surdez\r','DEFICIENCIA',1),(7,'Surdocegueira\r','DEFICIENCIA',1),(8,'Defici�ncia m�ltipla','DEFICIENCIA',1),(9,'Autismo infantil\r','DEFICIENCIA',1),(10,'S�ndrome de Asperger','DEFICIENCIA',1),(11,'S�ndrome de Rett','DEFICIENCIA',1),(12,'Transtorno desintegrativo\r\nda inf�ncia','TRANSTORNO',1),(13,'Altas habilidades/\r\nSuperdota��o','SUPERDOTACAO',1);

#
# Structure for table "sme_pessoa"
#

CREATE TABLE `sme_pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf_cnpj` varchar(14) NOT NULL,
  `data_nascimento` date NOT NULL,
  `email` varchar(200) NOT NULL,
  `genero` varchar(1) NOT NULL,
  `inep` varchar(255) NOT NULL,
  `tipo_pessoa` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `endereco_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `arquivo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `endereco_id_UNIQUE` (`endereco_id`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  KEY `pessoa_fk03` (`arquivo_id`),
  CONSTRAINT `pessoa_fk03` FOREIGN KEY (`arquivo_id`) REFERENCES `gestaoescolar`.`edu_arquivo` (`id`),
  CONSTRAINT `pessoa_fk01` FOREIGN KEY (`endereco_id`) REFERENCES `sme_endereco` (`id`),
  CONSTRAINT `pessoa_fk02` FOREIGN KEY (`usuario_id`) REFERENCES `sme_intranet_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41905 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=114 COMMENT='InnoDB free: 10240 kB; (`endereco_id`) REFER `dgp/sme_endere';

#
# Data for table "sme_pessoa"
#

REPLACE INTO `sme_pessoa` VALUES (16138,'Secretaria Municipal de Educa��o','','0000-00-00','educacao@itajai.sc.gov.br','','','Instituicao','2016-06-03 13:34:56','0000-00-00 00:00:00',NULL,1,12892,NULL,NULL),(41904,'Administrador','admin','0000-00-00','','','','PessoaFisica','2016-07-08 15:18:48','0000-00-00 00:00:00',NULL,1,NULL,1,NULL);

#
# Structure for table "edu_unidade_ensino"
#

CREATE TABLE `edu_unidade_ensino` (
  `id` int(11) NOT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidade_ensino_fk02_idx` (`tipo_id`),
  CONSTRAINT `FK_C03EFDE1BF396750` FOREIGN KEY (`id`) REFERENCES `sme_pessoa` (`id`) ON DELETE CASCADE,
  CONSTRAINT `unidade_ensino_fk02` FOREIGN KEY (`tipo_id`) REFERENCES `edu_tipo_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_unidade_ensino"
#


#
# Structure for table "edu_unidade_ensino_curso"
#

CREATE TABLE `edu_unidade_ensino_curso` (
  `unidade_ensino_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`unidade_ensino_id`,`curso_id`),
  KEY `unidade_ensino_curso_fk01_idx` (`unidade_ensino_id`),
  KEY `unidade_ensino_curso_fk02_idx` (`curso_id`),
  CONSTRAINT `unidade_ensino_curso_fk01` FOREIGN KEY (`unidade_ensino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `unidade_ensino_curso_fk02` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_unidade_ensino_curso"
#


#
# Structure for table "edu_quadro_horario"
#

CREATE TABLE `edu_quadro_horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `turno_inicio` time NOT NULL,
  `turno_termino` time NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `modelo_id` int(11) DEFAULT NULL,
  `unidade_ensino_id` int(11) DEFAULT NULL,
  `turno_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quadro_horario_unidade_fk013_idx` (`modelo_id`),
  KEY `quadro_horario_unidade_fk02_idx` (`unidade_ensino_id`),
  KEY `quadro_horario_unidade_fk03_idx` (`turno_id`),
  CONSTRAINT `quadro_horario_unidade_fk01` FOREIGN KEY (`modelo_id`) REFERENCES `edu_quadro_horario_modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quadro_horario_unidade_fk02` FOREIGN KEY (`unidade_ensino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quadro_horario_unidade_fk03` FOREIGN KEY (`turno_id`) REFERENCES `edu_turno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario"
#


#
# Structure for table "edu_quadro_horario_dia_semana"
#

CREATE TABLE `edu_quadro_horario_dia_semana` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_semana` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `quadro_horario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quadro_horario_dia_semana_fk01_idx` (`quadro_horario_id`),
  CONSTRAINT `quadro_horario_dia_semana_fk01` FOREIGN KEY (`quadro_horario_id`) REFERENCES `edu_quadro_horario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario_dia_semana"
#


#
# Structure for table "edu_quadro_horario_aula"
#

CREATE TABLE `edu_quadro_horario_aula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `quadro_horario_id` int(11) DEFAULT NULL,
  `quadro_horario_dia_semana_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quadro_horario_aula_fk01_idx` (`quadro_horario_id`),
  KEY `quadro_horario_aula_fk02_idx` (`quadro_horario_dia_semana_id`),
  CONSTRAINT `quadro_horario_aula_fk01` FOREIGN KEY (`quadro_horario_id`) REFERENCES `edu_quadro_horario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quadro_horario_aula_fk02` FOREIGN KEY (`quadro_horario_dia_semana_id`) REFERENCES `edu_quadro_horario_dia_semana` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario_aula"
#


#
# Structure for table "edu_instituicao"
#

CREATE TABLE `edu_instituicao` (
  `id` int(11) NOT NULL,
  `instituicao_pai_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CD57CCD222EAC624` (`instituicao_pai_id`),
  CONSTRAINT `FK_CD57CCD222EAC624` FOREIGN KEY (`instituicao_pai_id`) REFERENCES `edu_instituicao` (`id`),
  CONSTRAINT `FK_CD57CCD2BF396750` FOREIGN KEY (`id`) REFERENCES `sme_pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_instituicao"
#

REPLACE INTO `edu_instituicao` VALUES (16138,NULL);

#
# Structure for table "edu_calendario"
#

CREATE TABLE `edu_calendario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `calendario_base_id` int(11) DEFAULT NULL,
  `instituicao_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendario_fk02_idx` (`instituicao_id`),
  KEY `IDX_8CB334B73B5FC2BB` (`calendario_base_id`),
  CONSTRAINT `calendario_fk02` FOREIGN KEY (`instituicao_id`) REFERENCES `edu_instituicao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8CB334B73B5FC2BB` FOREIGN KEY (`calendario_base_id`) REFERENCES `edu_calendario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario"
#


#
# Structure for table "edu_turma"
#

CREATE TABLE `edu_turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `apelido` varchar(255) NOT NULL,
  `limite_alunos` int(11) NOT NULL,
  `data_encerramento` datetime NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `unidade_ensino_id` int(11) DEFAULT NULL,
  `etapa_id` int(11) DEFAULT NULL,
  `turno_id` int(11) DEFAULT NULL,
  `turma_agrupamento_id` int(11) DEFAULT NULL,
  `calendario_id` int(11) DEFAULT NULL,
  `quadro_horario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `turma_fk0_idx` (`etapa_id`),
  KEY `turma_fk1_idx` (`unidade_ensino_id`),
  KEY `turma_fk2_idx` (`turno_id`),
  KEY `turma_fk4_idx` (`turma_agrupamento_id`),
  KEY `turma_fk5_idx` (`calendario_id`),
  KEY `turma_fk00_idx` (`quadro_horario_id`),
  CONSTRAINT `turma_fk01` FOREIGN KEY (`etapa_id`) REFERENCES `edu_etapa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk02` FOREIGN KEY (`unidade_ensino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk03` FOREIGN KEY (`turno_id`) REFERENCES `edu_turno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk05` FOREIGN KEY (`turma_agrupamento_id`) REFERENCES `edu_turma_agrupamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk06` FOREIGN KEY (`calendario_id`) REFERENCES `edu_calendario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk07` FOREIGN KEY (`quadro_horario_id`) REFERENCES `edu_quadro_horario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma"
#


#
# Structure for table "edu_turma_disciplina"
#

CREATE TABLE `edu_turma_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `turma_id` int(11) DEFAULT NULL,
  `disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `turma_disciplina_fk01_idx` (`turma_id`),
  KEY `turma_disciplina_fk02_idx` (`disciplina_id`),
  CONSTRAINT `turma_disciplina_fk01` FOREIGN KEY (`turma_id`) REFERENCES `edu_turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_disciplina_fk02` FOREIGN KEY (`disciplina_id`) REFERENCES `edu_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma_disciplina"
#


#
# Structure for table "edu_quadro_horario_aula_turma"
#

CREATE TABLE `edu_quadro_horario_aula_turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `quadro_horario_aula_id` int(11) DEFAULT NULL,
  `turma_disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quadro_horario_aula_turma_fk01_idx` (`quadro_horario_aula_id`),
  KEY `quadro_horario_aula_turma_fk02_idx` (`turma_disciplina_id`),
  CONSTRAINT `quadro_horario_aula_turma_fk01` FOREIGN KEY (`quadro_horario_aula_id`) REFERENCES `edu_quadro_horario_aula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quadro_horario_aula_turma_fk02` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario_aula_turma"
#


#
# Structure for table "edu_calendario_periodo"
#

CREATE TABLE `edu_calendario_periodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media` int(11) NOT NULL DEFAULT '0',
  `data_inicio` date NOT NULL DEFAULT '0000-00-00',
  `data_termino` date NOT NULL DEFAULT '0000-00-00',
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_modificacao` timestamp NULL DEFAULT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `calendario_id` int(11) NOT NULL DEFAULT '0',
  `sistema_avaliacao_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `calendario_periodo_fk02` (`sistema_avaliacao_id`),
  KEY `calendario_periodo_fk01` (`calendario_id`),
  CONSTRAINT `calendario_periodo_fk01` FOREIGN KEY (`calendario_id`) REFERENCES `edu_calendario` (`id`),
  CONSTRAINT `calendario_periodo_fk02` FOREIGN KEY (`sistema_avaliacao_id`) REFERENCES `edu_sistema_avaliacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario_periodo"
#


#
# Structure for table "edu_calendario_dia"
#

CREATE TABLE `edu_calendario_dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_dia` date NOT NULL,
  `letivo` tinyint(1) NOT NULL,
  `efetivo` tinyint(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `calendario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dia_calendario_fk01_idx` (`calendario_id`),
  CONSTRAINT `calendario_dia_fk01` FOREIGN KEY (`calendario_id`) REFERENCES `edu_calendario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario_dia"
#


#
# Structure for table "edu_aula"
#

CREATE TABLE `edu_aula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `turma_disciplina_id` int(11) DEFAULT NULL,
  `dia_id` int(11) DEFAULT NULL,
  `quadro_horario_aula_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aula_fk01_idx` (`turma_disciplina_id`),
  KEY `aula_fk02_idx` (`dia_id`),
  KEY `aula_fk03_idx` (`quadro_horario_aula_id`),
  CONSTRAINT `aula_fk01` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aula_fk02` FOREIGN KEY (`dia_id`) REFERENCES `edu_calendario_dia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aula_fk03` FOREIGN KEY (`quadro_horario_aula_id`) REFERENCES `edu_quadro_horario_aula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_aula"
#


#
# Structure for table "edu_avaliacao"
#

CREATE TABLE `edu_avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `media` int(11) NOT NULL,
  `tipo_avaliacao` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `aula_id` int(11) DEFAULT NULL,
  `turma_disciplina_id` int(11) DEFAULT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avaliacao_fk01_idx` (`aula_id`),
  KEY `avaliacao_fk02_idx` (`turma_disciplina_id`),
  KEY `avaliacao_fk03_idx` (`tipo_id`),
  CONSTRAINT `avaliacao_fk01` FOREIGN KEY (`aula_id`) REFERENCES `edu_aula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `avaliacao_fk02` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `avaliacao_fk03` FOREIGN KEY (`tipo_id`) REFERENCES `edu_avaliacao_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao"
#


#
# Structure for table "edu_avaliacao_qualitativa"
#

CREATE TABLE `edu_avaliacao_qualitativa` (
  `id` int(11) NOT NULL,
  `regime_fechamento` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_56BA43E2BF396750` FOREIGN KEY (`id`) REFERENCES `edu_avaliacao` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_qualitativa"
#


#
# Structure for table "edu_avaliacao_qualitativa_habilidade"
#

CREATE TABLE `edu_avaliacao_qualitativa_habilidade` (
  `habilidade_id` int(11) NOT NULL,
  `avaliacao_qualitativa_id` int(11) NOT NULL,
  PRIMARY KEY (`avaliacao_qualitativa_id`,`habilidade_id`),
  KEY `avaliacao_qualitativa_habilidade_fk01_idx` (`habilidade_id`),
  KEY `avaliacao_qualitativa_habilidade_fk02_idx` (`avaliacao_qualitativa_id`),
  CONSTRAINT `avaliacao_qualitativa_habilidade_fk01` FOREIGN KEY (`habilidade_id`) REFERENCES `edu_avaliacao_habilidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `avaliacao_qualitativa_habilidade_fk02` FOREIGN KEY (`avaliacao_qualitativa_id`) REFERENCES `edu_avaliacao_qualitativa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_qualitativa_habilidade"
#


#
# Structure for table "edu_avaliacao_quantitativa"
#

CREATE TABLE `edu_avaliacao_quantitativa` (
  `id` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_22351265BF396750` FOREIGN KEY (`id`) REFERENCES `edu_avaliacao` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_quantitativa"
#


#
# Structure for table "edu_calendario_evento_dia"
#

CREATE TABLE `edu_calendario_evento_dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `dia_id` int(11) DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dia_evento_fk01_idx` (`evento_id`),
  KEY `calendario_evento_dia_fk02_idx` (`dia_id`),
  CONSTRAINT `calendario_evento_dia_fk01` FOREIGN KEY (`evento_id`) REFERENCES `edu_calendario_evento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `calendario_evento_dia_fk02` FOREIGN KEY (`dia_id`) REFERENCES `edu_calendario_dia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario_evento_dia"
#


#
# Structure for table "sme_pessoa_juridica"
#

CREATE TABLE `sme_pessoa_juridica` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa_juridica_fk01_idx` (`id`),
  CONSTRAINT `pessoa_juridica_fk01` FOREIGN KEY (`id`) REFERENCES `sme_pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=143 COMMENT='InnoDB free: 10240 kB; (`id`) REFER `dgp/sme_pessoa`(`id`); ';

#
# Data for table "sme_pessoa_juridica"
#

REPLACE INTO `sme_pessoa_juridica` VALUES (16138);

#
# Structure for table "sme_pessoa_telefone"
#

CREATE TABLE `sme_pessoa_telefone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `falar_com` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pessoa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa_telefone_fk01` (`pessoa_id`),
  CONSTRAINT `pessoa_telefone_fk01` FOREIGN KEY (`pessoa_id`) REFERENCES `sme_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=59 COMMENT='InnoDB free: 10240 kB; (`pessoa_id`) REFER `dgp/sme_pessoa`(';

#
# Data for table "sme_pessoa_telefone"
#


#
# Structure for table "sme_raca"
#

CREATE TABLE `sme_raca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "sme_raca"
#

REPLACE INTO `sme_raca` VALUES (1,'Branca',1),(2,'Preta',1),(3,'Parda',1),(4,'Amarela',1),(5,'Ind�gena',1);

#
# Structure for table "sme_pessoa_fisica"
#

CREATE TABLE `sme_pessoa_fisica` (
  `id` int(11) NOT NULL,
  `rg_numero` varchar(255) NOT NULL,
  `rg_orgao_expedidor` varchar(255) NOT NULL,
  `rg_data_expedicao` date NOT NULL,
  `nacionalidade_tipo` varchar(255) NOT NULL,
  `mae_nome` varchar(255) NOT NULL,
  `pai_nome` varchar(255) NOT NULL,
  `responsavel_nome` varchar(255) NOT NULL,
  `certidao_nascimento_completa` varchar(32) NOT NULL,
  `certidao_nascimento_data_expedicao` date NOT NULL,
  `carteira_trabalho_numero` varchar(255) NOT NULL,
  `carteira_trabalho_serie` varchar(255) NOT NULL,
  `carteira_trabalho_data_expedicao` date NOT NULL,
  `nis` varchar(255) NOT NULL,
  `carteira_trabalho_estado_id` int(11) DEFAULT NULL,
  `cidade_nascimento_id` int(11) DEFAULT NULL,
  `estado_civil_id` int(11) DEFAULT NULL,
  `raca_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa_fisica_fk02_idx` (`estado_civil_id`),
  KEY `pessoa_fisica_fk04_idx` (`cidade_nascimento_id`),
  KEY `pessoa_fisica_fk05_idx` (`carteira_trabalho_estado_id`),
  KEY `pessoa_fisica_fk06_idx` (`raca_id`),
  CONSTRAINT `FK_F4375A60BF396750` FOREIGN KEY (`id`) REFERENCES `sme_pessoa` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pessoa_fisica_fk02` FOREIGN KEY (`estado_civil_id`) REFERENCES `sme_estado_civil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_fk04` FOREIGN KEY (`cidade_nascimento_id`) REFERENCES `sme_cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_fk05` FOREIGN KEY (`carteira_trabalho_estado_id`) REFERENCES `sme_estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_fk06` FOREIGN KEY (`raca_id`) REFERENCES `sme_raca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=133 COMMENT='InnoDB free: 10240 kB; (`estado_civil_id`) REFER `dgp/sme_es';

#
# Data for table "sme_pessoa_fisica"
#

REPLACE INTO `sme_pessoa_fisica` VALUES (41904,'','','0000-00-00','','','','','','0000-00-00','','','0000-00-00','',NULL,NULL,NULL,NULL);

#
# Structure for table "sme_pessoa_fisica_particularidade"
#

CREATE TABLE `sme_pessoa_fisica_particularidade` (
  `pessoa_fisica_id` int(11) NOT NULL,
  `particularidade_id` int(11) NOT NULL,
  PRIMARY KEY (`pessoa_fisica_id`,`particularidade_id`),
  KEY `sme_pessoa_fisica_particularidade_fk0_idx` (`pessoa_fisica_id`),
  KEY `sme_pessoa_fisica_particularidade_fk1_idx` (`particularidade_id`),
  CONSTRAINT `pessoa_fisica_particularidade_fk01` FOREIGN KEY (`pessoa_fisica_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_particularidade_fk02` FOREIGN KEY (`particularidade_id`) REFERENCES `sme_particularidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sme_pessoa_fisica_particularidade"
#


#
# Structure for table "sme_pessoa_fisica_necessidade_especial"
#

CREATE TABLE `sme_pessoa_fisica_necessidade_especial` (
  `pessoa_fisica_id` int(11) NOT NULL,
  `necessidade_especial_id` int(11) NOT NULL,
  PRIMARY KEY (`pessoa_fisica_id`,`necessidade_especial_id`),
  KEY `sme_pessoa_fisica_necessidade_especial_fk0_idx` (`pessoa_fisica_id`),
  KEY `sme_pessoa_fisica_necessidade_especial_fk1_idx` (`necessidade_especial_id`),
  CONSTRAINT `pessoa_fisica_necessidade_especial_fk01` FOREIGN KEY (`pessoa_fisica_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_necessidade_especial_fk02` FOREIGN KEY (`necessidade_especial_id`) REFERENCES `sme_necessidade_especial` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sme_pessoa_fisica_necessidade_especial"
#


#
# Structure for table "edu_matricula"
#

CREATE TABLE `edu_matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `alfabetizado` year(4) DEFAULT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `status` enum('CURSANDO','APROVADO','REPROVADO','TRANCADO','ABANDONO','FALECIDO') NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pessoa_fisica_aluno_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `unidade_ensino_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matricula_fk2_idx` (`pessoa_fisica_aluno_id`),
  KEY `matricula_fk2_idx1` (`curso_id`),
  KEY `matricula_fk4_idx` (`unidade_ensino_id`),
  CONSTRAINT `matricula_fk2` FOREIGN KEY (`pessoa_fisica_aluno_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_fk3` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_fk4` FOREIGN KEY (`unidade_ensino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_matricula"
#


#
# Structure for table "edu_movimentacao"
#

CREATE TABLE `edu_movimentacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `justificativa` varchar(255) NOT NULL,
  `tipo_movimentacao` enum('TRANSFERENCIA','MOVIMENTACAO_TURMA','DESLIGAMENTO') NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `matricula_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimentacao_fk01_idx` (`matricula_id`),
  CONSTRAINT `movimentacao_fk01` FOREIGN KEY (`matricula_id`) REFERENCES `edu_matricula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_movimentacao"
#


#
# Structure for table "edu_movimentacao_desligamento"
#

CREATE TABLE `edu_movimentacao_desligamento` (
  `id` int(11) NOT NULL,
  `destino` varchar(255) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_64B3CC05BF396750` FOREIGN KEY (`id`) REFERENCES `edu_movimentacao` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_movimentacao_desligamento"
#


#
# Structure for table "edu_movimentacao_transferencia"
#

CREATE TABLE `edu_movimentacao_transferencia` (
  `id` int(11) NOT NULL,
  `resposta` varchar(255) NOT NULL,
  `status` enum('PENDENTE','ACEITO','RECUSADO') NOT NULL,
  `data_encerramento` datetime NOT NULL,
  `data_agendamento` date NOT NULL,
  `unidade_ensino_origem_id` int(11) DEFAULT NULL,
  `unidade_ensino_destino_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transferencia_fk02_idx` (`unidade_ensino_origem_id`),
  KEY `transferencia_fk03_idx` (`unidade_ensino_destino_id`),
  CONSTRAINT `FK_1AE9B8C1BF396750` FOREIGN KEY (`id`) REFERENCES `edu_movimentacao` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transferencia_fk02` FOREIGN KEY (`unidade_ensino_origem_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transferencia_fk03` FOREIGN KEY (`unidade_ensino_destino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_movimentacao_transferencia"
#


#
# Structure for table "edu_enturmacao"
#

CREATE TABLE `edu_enturmacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encerrado` tinyint(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `matricula_id` int(11) DEFAULT NULL,
  `turma_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enturmacao_fk01_idx` (`matricula_id`),
  KEY `enturmacao_fk02_idx` (`turma_id`),
  CONSTRAINT `enturmacao_fk01` FOREIGN KEY (`matricula_id`) REFERENCES `edu_matricula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `enturmacao_fk02` FOREIGN KEY (`turma_id`) REFERENCES `edu_turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_enturmacao"
#


#
# Structure for table "edu_matricula_disciplina"
#

CREATE TABLE `edu_matricula_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('CURSANDO','APROVADO','REPROVADO','DISPENSADO','INCOMPLETO') NOT NULL,
  `frequencia_total` varchar(255) NOT NULL,
  `media_final` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_encerramento` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `matricula_id` int(11) DEFAULT NULL,
  `enturmacao_id` int(11) DEFAULT NULL,
  `disciplina_id` int(11) DEFAULT NULL,
  `turma_disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matricula_disciplina_fk01_idx` (`matricula_id`),
  KEY `matricula_disciplina_fk02_idx` (`enturmacao_id`),
  KEY `matricula_disciplina_fk03_idx` (`disciplina_id`),
  KEY `matricula_disciplina_fk04_idx` (`turma_disciplina_id`),
  CONSTRAINT `matricula_disciplina_fk01` FOREIGN KEY (`matricula_id`) REFERENCES `edu_matricula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_disciplina_fk02` FOREIGN KEY (`enturmacao_id`) REFERENCES `edu_enturmacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_disciplina_fk03` FOREIGN KEY (`disciplina_id`) REFERENCES `edu_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_disciplina_fk04` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_matricula_disciplina"
#


#
# Structure for table "edu_media"
#

CREATE TABLE `edu_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `matricula_disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_fk01_idx` (`matricula_disciplina_id`),
  CONSTRAINT `media_fk01` FOREIGN KEY (`matricula_disciplina_id`) REFERENCES `edu_matricula_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_media"
#


#
# Structure for table "edu_nota"
#

CREATE TABLE `edu_nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `tipo_nota` enum('NOTA_QUANTITATIVA','NOTA_QUALITATIVA') NOT NULL,
  `avaliacao_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nota_fk01_idx` (`avaliacao_id`),
  KEY `nota_fk02_idx` (`media_id`),
  CONSTRAINT `nota_fk01` FOREIGN KEY (`avaliacao_id`) REFERENCES `edu_avaliacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nota_fk02` FOREIGN KEY (`media_id`) REFERENCES `edu_media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_nota"
#


#
# Structure for table "edu_nota_qualitativa"
#

CREATE TABLE `edu_nota_qualitativa` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_6050A232BF396750` FOREIGN KEY (`id`) REFERENCES `edu_nota` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_nota_qualitativa"
#


#
# Structure for table "edu_nota_qualitativa_habilidade"
#

CREATE TABLE `edu_nota_qualitativa_habilidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `habilidade_id` int(11) DEFAULT NULL,
  `conceito_id` int(11) DEFAULT NULL,
  `nota_qualitativa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nota_qualitativa_habilidade_fk01_idx` (`habilidade_id`),
  KEY `nota_qualitativa_habilidade_fk01_idx1` (`conceito_id`),
  KEY `nota_qualitativa_habilidade_fk03_idx` (`nota_qualitativa_id`),
  CONSTRAINT `nota_qualitativa_habilidade_fk01` FOREIGN KEY (`habilidade_id`) REFERENCES `edu_avaliacao_habilidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nota_qualitativa_habilidade_fk02` FOREIGN KEY (`conceito_id`) REFERENCES `edu_avaliacao_conceito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nota_qualitativa_habilidade_fk03` FOREIGN KEY (`nota_qualitativa_id`) REFERENCES `edu_nota_qualitativa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_nota_qualitativa_habilidade"
#


#
# Structure for table "edu_nota_quantitativa"
#

CREATE TABLE `edu_nota_quantitativa` (
  `id` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_A4D02A50BF396750` FOREIGN KEY (`id`) REFERENCES `edu_nota` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_nota_quantitativa"
#


#
# Structure for table "edu_turma_media"
#

CREATE TABLE `edu_turma_media` (
  `id` int(11) NOT NULL,
  `numero` tinyint(1) NOT NULL,
  `data_abertura` timestamp NULL DEFAULT NULL,
  `data_fechamento` timestamp NULL DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_modificacao` timestamp NULL DEFAULT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `turma_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `turma_media_fk01_idx` (`turma_id`),
  KEY `turma_media_fk02_idx` (`media_id`),
  CONSTRAINT `turma_media_fk01` FOREIGN KEY (`turma_id`) REFERENCES `edu_turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_media_fk02` FOREIGN KEY (`media_id`) REFERENCES `edu_media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma_media"
#


#
# Structure for table "edu_frequencia"
#

CREATE TABLE `edu_frequencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('FALTA','FALTA_JUSTIFICADA','PRESENCA','DISPENSA') NOT NULL,
  `justificativa` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `aula_id` int(11) DEFAULT NULL,
  `matricula_disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frequencia_fk02_idx` (`aula_id`),
  KEY `frequencia_fk01_idx` (`matricula_disciplina_id`),
  CONSTRAINT `frequencia_fk01` FOREIGN KEY (`matricula_disciplina_id`) REFERENCES `edu_matricula_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `frequencia_fk02` FOREIGN KEY (`aula_id`) REFERENCES `edu_aula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_frequencia"
#


#
# Structure for table "edu_movimentacao_turma"
#

CREATE TABLE `edu_movimentacao_turma` (
  `id` int(11) NOT NULL,
  `enturmacao_origem_id` int(11) DEFAULT NULL,
  `enturmacao_destino_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimentacao_turma_fk02_idx` (`enturmacao_origem_id`),
  KEY `movimentacao_turma_fk03_idx` (`enturmacao_destino_id`),
  CONSTRAINT `FK_BD6FA8ABBF396750` FOREIGN KEY (`id`) REFERENCES `edu_movimentacao` (`id`) ON DELETE CASCADE,
  CONSTRAINT `movimentacao_turma_fk02` FOREIGN KEY (`enturmacao_origem_id`) REFERENCES `edu_enturmacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `movimentacao_turma_fk03` FOREIGN KEY (`enturmacao_destino_id`) REFERENCES `edu_enturmacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_movimentacao_turma"
#


#
# Structure for table "edu_solicitacao_vaga"
#

CREATE TABLE `edu_solicitacao_vaga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `data_solicitacao` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pessoa_fisica_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D08A08679B4F7` (`pessoa_fisica_id`),
  CONSTRAINT `solicitacao_vaga_fk01` FOREIGN KEY (`pessoa_fisica_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_solicitacao_vaga"
#


#
# Structure for table "edu_vinculo"
#

CREATE TABLE `edu_vinculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `tipo_contrato` enum('EFETIVO','TEMPORARIO') NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `status` enum('ATIVO','AFASTADO','DESLIGADO') NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pessoa_fisica_funcionario_id` int(11) DEFAULT NULL,
  `instituicao_id` int(11) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vinculo_fk01_idx` (`pessoa_fisica_funcionario_id`),
  KEY `vinculo_fk02_idx` (`instituicao_id`),
  KEY `vincilo_fk03_idx` (`cargo_id`),
  CONSTRAINT `vincilo_fk03` FOREIGN KEY (`cargo_id`) REFERENCES `edu_cargo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vinculo_fk01` FOREIGN KEY (`pessoa_fisica_funcionario_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vinculo_fk02` FOREIGN KEY (`instituicao_id`) REFERENCES `edu_instituicao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_vinculo"
#


#
# Structure for table "edu_alocacao"
#

CREATE TABLE `edu_alocacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carga_horaria` int(11) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `vinculo_id` int(11) DEFAULT NULL,
  `instituicao_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alocacao_fk01_idx` (`vinculo_id`),
  KEY `alocacao_fk02_idx` (`instituicao_id`),
  CONSTRAINT `alocacao_fk01` FOREIGN KEY (`vinculo_id`) REFERENCES `edu_vinculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alocacao_fk02` FOREIGN KEY (`instituicao_id`) REFERENCES `edu_instituicao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_alocacao"
#


#
# Structure for table "edu_turma_disciplina_alocacao"
#

CREATE TABLE `edu_turma_disciplina_alocacao` (
  `turma_disciplina_id` int(11) NOT NULL,
  `alocacao_id` int(11) NOT NULL,
  PRIMARY KEY (`turma_disciplina_id`,`alocacao_id`),
  KEY `disciplina_ofertada_professor_fk01_idx` (`turma_disciplina_id`),
  KEY `disciplina_ofertada_professor_fk02_idx` (`alocacao_id`),
  CONSTRAINT `turma_disciplina_alocacao_fk01` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_disciplina_alocacao_fk02` FOREIGN KEY (`alocacao_id`) REFERENCES `edu_alocacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma_disciplina_alocacao"
#

