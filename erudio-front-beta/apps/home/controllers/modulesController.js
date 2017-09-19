(function (){
    //LISTANDO TODOS OS MODULOS
    var configs = [
        'erudioConfig',
        'auth',
        'rest',
        'util',
        'structure',
        'validator',
        'shared',
        'home'
    ];
    
    var controllers = [
        'InstituicaoController',
        'InstituicaoFormController',
        'TipoUnidadeController',
        'TipoUnidadeFormController',
        'UnidadeController',
        'UnidadeFormController',
        'RegimeController',
        'RegimeFormController',
        'CursoController',
        'CursoFormController',
        'EtapaController',
        'EtapaFormController',
        'DisciplinaController',
        'DisciplinaFormController',
        'ModuloController',
        'ModuloFormController',
        'TurnoController',
        'TurnoFormController',
        'ModeloGradeHorarioController',
        'ModeloGradeHorarioFormController',
        'QuadroHorarioController',
        'QuadroHorarioFormController',
        'CalendarioController',
        'CalendarioFormController',
        'CalendarioViewController',
        'EventoController',
        'teste'
    ];
    
    var directives = [
        'turmaDirectives',
        'cargosDirectives',
        'tipoAvaliacaoDirectives',
        'habilidadeDirectives',
        'avaliacaoDirectives',
        'grupoDirectives',
        'grupoPermissaoDirectives',
        'usuarioDirectives'
    ];
    
    var services = [
        'BaseService',
        'EnderecoService',
        'TelefoneService',
        'InstituicaoService',
        'TipoUnidadeService',
        'CursoOfertadoService',
        'UnidadeService',
        'RegimeService',
        'ModalidadeEnsinoService',
        'CursoService',
        'EtapaService',
        'ModuloService',
        'SistemaAvaliacaoService',
        'ModeloGradeHorarioService',
        'QuadroHorarioService',
        'DisciplinaService',
        'TurnoService',
        'CalendarioService',
        'EventoService',
        'PeriodoService',
        'TurmaService',
        'MatriculaService',
        'EnturmacaoService',
        'TransferenciaService',
        'DesligamentoService',
        'MovimentacaoService',
        'EstadoCivilService',
        'RacaService',
        'NacionalidadeService',
        'ParticularidadeService',
        'NecessidadeEspecialService',
        'PessoaService',
        'GrupoService',
        'CargoService',
        'TipoAvaliacaoService',
        'HabilidadeService',
        'AvaliacaoService',
        'GrupoPermissaoService',
        'GrupoService',
        'PermissaoGrupoService',
        'AtribuicaoService',
        'PermissaoService',
        'UsuarioService',
        'EstadoService',
        'CidadeService'
    ];
    
    var todosModulos = configs.concat(services,controllers,directives);
    var modules = angular.module('modules',todosModulos);
})();