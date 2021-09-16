CREATE  DATABASE confBelico;
use confbelico;
CREATE TABLE  TiposConflitosExistentes  (
	Id_TipoConflito int NOT NULL auto_increment,
    NomeTipo varchar(45) NOT NULL,
    RazaoTipo varchar(45) NOT NULL,
    primary key (Id_TipoConflito),
    UNIQUE(Id_TipoConflito, NomeTipo)
    
    /*
    1-religioso | religiao
    2-etnico | etnia
    3-territorial | regiao
    4-economico | MateriaPrima
    */
);

CREATE TABLE Conflito  (
	Id_Conflito int not null auto_increment,
    FK_Id_OrganizacaoMediadora int not null,
    NomeConflito varchar(45) not null,
    fk_Id_TipoConflito int not null,
    NumFeridos int not null default 0,
	NumMortos int not null default 0,
    foreign key(fk_Id_TipoConflito) references TiposConflitosExistentes(Id_TipoConflito),
	foreign key(FK_Id_OrganizacaoMediadora) references OrganizacaoMediadora(Id_OrganizacaoMediadora),

    primary key (Id_Conflito),
	unique(Id_Conflito)

);

CREATE TABLE ConflitoPais  (
	FK_Id_Conflito int NOT NULL, 
    Pais varchar(45) not null,
    primary key (FK_Id_Conflito, Pais),
    foreign key(FK_Id_Conflito) references conflito(Id_Conflito)

);

CREATE TABLE LogTipoConflito  (
	Id_LogTipoConflito int NOT NULL,
    FK_Id_Conflito int NOT NULL, 
    FK_Id_TipoConflito int NOT NULL, 
    InfoExtra varchar(45) NOT NULL,
	
    primary KEY ( Id_LogTipoConflito),
    UNIQUE ( Id_LogTipoConflito),
    foreign key(FK_Id_Conflito) references conflito(Id_Conflito),
	foreign key(FK_Id_TipoConflito) references TiposConflitosExistentes(Id_TipoConflito)
);


CREATE TABLE LiderPolitico  (
	Id_NomeLider varchar(45) not null,
    FK_Id_Conflito int NOT NULL, 
    Apoios varchar(45),
    primary key(Id_NomeLider, FK_Id_Conflito),
    foreign key(FK_Id_Conflito) references conflito(Id_Conflito)
);

CREATE TABLE ChefeMilitar  (
	Id_NomeChefe varchar(45) not null,
    Faixa int not null,
    fk_Id_Divisao int not null,
    fk_Id_Grupo int not null,
    fk_Id_NomeLider varchar(45) not null,
    primary key(Id_NomeChefe),
	foreign key(fk_Id_Divisao) references Divisao(Id_Divisao),
    foreign key(fk_Id_Grupo) references GrupoArmado(Id_Grupo),
    foreign key(fk_Id_NomeLider) references LiderPolitico(Id_NomeLider)
);

CREATE TABLE GrupoArmado  (
	Id_Grupo int not null, 
    NomeGrupo varchar(45) not null,
    NumBaixasGrupo int not null default 0,
	unique(Id_Grupo),
    primary key(Id_Grupo)
);

CREATE TABLE EntradaParticipacao  (
	FK_Id_Grupo int not null, 
	FK_Id_Conflito int not null,
    DE_Grupo date,
    primary key(FK_Id_Grupo, FK_Id_Conflito, DE_Grupo)
);

CREATE TABLE SaidaParticipacao  (
	FK_Id_Grupo int not null, 
	FK_Id_Conflito int not null,
    DS_Grupo date,
    primary key(FK_Id_Grupo, FK_Id_Conflito, DS_Grupo)
);

CREATE TABLE Divisao  (
	Id_Divisao int not null auto_increment, 
    FK_Id_Grupo int not null,
    NumBaixasDivisao int not null default 0,
    QNTBarcos int not null default 0,
    QNTTanques int not null default 0,
    QNTAvioes int not null default 0,
    QNTHomens int not null default 0,
    primary key (Id_Divisao, FK_Id_Grupo),
    foreign key(FK_Id_Grupo) references GrupoArmado (Id_Grupo),
    unique(Id_Divisao)
	
); 

CREATE TABLE Fornece  (
	FK_Id_Grupo int not null,
    FK_Id_NomeArma varchar(45) not null, 
    FK_Id_Traficante int not null, 
    NumArmas int not null default 0,
    primary key(FK_Id_Grupo, FK_Id_NomeArma, FK_Id_Traficante),
    foreign key(FK_Id_Grupo) references GrupoArmado(Id_Grupo),
    foreign key(FK_Id_NomeArma) references TipoArma(Id_NomeArma),
    foreign key(FK_Id_Traficante) references Traficante(Id_Traficante)
);

CREATE TABLE TRAFICANTE (
	Id_Traficante int not null,
    NomeTraficante varchar (45) not null,
    unique (Id_Traficante),
    primary key(Id_Traficante)
);

CREATE TABLE PodeFornecer  (
	FK_Id_NomeArma varchar(45) not null, 
	FK_Id_Traficante int not null, 
	QNTArmas int not null default 0,
    foreign key(FK_Id_NomeArma) references TipoArma(Id_NomeArma),   
    foreign key(FK_Id_Traficante) references Traficante(Id_Traficante)
);

CREATE TABLE TipoArma  (
	Id_NomeArma varchar(45) not null, 
	Incador int not null default 0,
    primary key(Id_NomeArma),
    unique(Id_NomeArma)

);



CREATE TABLE Dialoga  (
	FK_Id_NomeLider varchar(45) not null,
    FK_Id_OrganizacaoMediadora int not null,
    FK_Id_Grupo int not null,
    ConteudoDialogo text, 
    primary key(FK_Id_NomeLider,FK_Id_OrganizacaoMediadora,FK_Id_Grupo),
    foreign key(fk_Id_NomeLider) references LiderPolitico(Id_NomeLider),
	foreign key(FK_Id_OrganizacaoMediadora) references OrganizacaoMediadora(Id_OrganizacaoMediadora),
	foreign key(FK_Id_Grupo) references GrupoArmado(Id_Grupo)


);

CREATE TABLE OrganizacaoMediadora  (
	Id_OrganizacaoMediadora int not null,
    NomeOrganizacaoMediadora varchar(45) not null,
    FK_Id_TipoOrganizacao int not null,
    FK_TipoAjuda int not null,
    OrganizacaoLider varchar(45) not null,
    NumPessoas int not null default 0,
    unique(Id_OrganizacaoMediadora),
    primary key(Id_OrganizacaoMediadora),
    foreign key(FK_Id_TipoOrganizacao) references TipoOrganizacao(Id_TipoOrganizacao),
    foreign key(FK_TipoAjuda) references TipoAjuda(Id_TipoAjuda)

);

CREATE TABLE TipoAjuda(
	Id_TipoAjuda int not null,
	NomeTipo varchar(45) NOT NULL,
    primary key (Id_TipoAjuda),
    UNIQUE(Id_TipoAjuda, NomeTipo)
    
	/*med, diplomatica, presencial*/
);

CREATE TABLE TipoOrganizacao(
	Id_TipoOrganizacao int not null,
	NomeTipo varchar(45) NOT NULL,
    primary key (Id_TipoOrganizacao),
    UNIQUE(Id_TipoOrganizacao, NomeTipo)
    /*gov, n gov, internacional*/
);

CREATE TABLE EntradaOrganizacaoMediadora  (
	Id_TipoOrganizacao int not null, 
	FK_Id_Conflito int not null,
    DE_Grupo date,
    primary key(Id_TipoOrganizacao, FK_Id_Conflito, DE_Grupo)
);

CREATE TABLE SaidaOrganizacaoMediadora  (
	Id_TipoOrganizacao int not null, 
	FK_Id_Conflito int not null,
    DS_Grupo date,
    primary key(Id_TipoOrganizacao, FK_Id_Conflito, DS_Grupo)

);







