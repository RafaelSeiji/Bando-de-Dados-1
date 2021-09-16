CREATE TABLE  TiposConflitosExistentes  (
	Id_TipoConflito INT NOT NULL AUTO_INCREMENT,
    NomeTipo VARCHAR(20) NOT NULL,
    RazaoTipo VARCHAR(20) NOT NULL,
    PRIMARY KEY (Id_TipoConflito),
    UNIQUE(Id_TipoConflito, NomeTipo)
    
    /*
    1-religioso | religiao
    2-etnico | etnia
    3-territorial | regiao
    4-economico | MateriaPrima
    */
);

CREATE TABLE TipoOrganizacao(
	Id_TipoOrganizacao INT NOT NULL,
	NomeTipo VARCHAR(20) NOT NULL,
    PRIMARY KEY (Id_TipoOrganizacao),
    UNIQUE(Id_TipoOrganizacao, NomeTipo)
    /*gov, n gov, internacional*/
);

CREATE TABLE TipoAjuda(
	Id_TipoAjuda INT NOT NULL,
	NomeTipo VARCHAR(20) NOT NULL,
    PRIMARY KEY (Id_TipoAjuda),
    UNIQUE(Id_TipoAjuda, NomeTipo)
    
	/*med, diplomatica, presencial*/
);

CREATE TABLE OrganizacaoMediadora  (
	Id_OrganizacaoMediadora INT NOT NULL,
    NomeOrganizacaoMediadora VARCHAR(20) NOT NULL,
    FK_Id_TipoOrganizacao INT NOT NULL,
    FK_TipoAjuda INT NOT NULL,
    OrganizacaoLider VARCHAR(20) NOT NULL,
    NumPessoas INT NOT NULL DEFAULT 0,
    UNIQUE(Id_OrganizacaoMediadora),
    PRIMARY KEY(Id_OrganizacaoMediadora),
    FOREIGN KEY(FK_Id_TipoOrganizacao) REFERENCES TipoOrganizacao(Id_TipoOrganizacao),
    FOREIGN KEY(FK_TipoAjuda) REFERENCES TipoAjuda(Id_TipoAjuda)
);


CREATE TABLE Conflito  (
	Id_Conflito INT NOT NULL AUTO_INCREMENT,
    FK_Id_OrganizacaoMediadora INT NOT NULL,
    NomeConflito VARCHAR(20) NOT NULL,
    fk_Id_TipoConflito INT NOT NULL,
    NumFeridos INT NOT NULL DEFAULT 0,
	NumMortos INT NOT NULL DEFAULT 0,
    FOREIGN KEY(fk_Id_TipoConflito) REFERENCES TiposConflitosExistentes(Id_TipoConflito),
	FOREIGN KEY(FK_Id_OrganizacaoMediadora) REFERENCES OrganizacaoMediadora(Id_OrganizacaoMediadora),

    PRIMARY KEY (Id_Conflito),
	UNIQUE(Id_Conflito)

);

CREATE TABLE LogTipoConflito  (
	Id_LogTipoConflito INT NOT NULL,
    FK_Id_Conflito INT NOT NULL, 
    FK_Id_TipoConflito INT NOT NULL, 
    InfoExtra VARCHAR(45) NOT NULL,
	
    PRIMARY KEY ( Id_LogTipoConflito),
    UNIQUE ( Id_LogTipoConflito),
    FOREIGN KEY(FK_Id_Conflito) REFERENCES conflito(Id_Conflito),
	FOREIGN KEY(FK_Id_TipoConflito) REFERENCES TiposConflitosExistentes(Id_TipoConflito)
);

CREATE TABLE ChefeMilitar(
	CodChefe INTEGER PRIMARY KEY AUTO_INCREMENT,
    Faixa INTEGER
);

CREATE TABLE LiderPolitico(
	NomeLider VARCHAR(20) PRIMARY KEY,
    Apoios TEXT
);

CREATE TABLE Divisao(
	NroDivisao INTEGER PRIMARY KEY AUTO_INCREMENT,
    NumBaixasDiv INTEGER NOT NULL DEFAULT 0,
    QtdBarcos INTEGER NOT NULL DEFAULT 0,
    QtdTanques INTEGER NOT NULL DEFAULT 0,
    QtdAvioes INTEGER NOT NULL DEFAULT 0,
    QtdHomens INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE GrupoArmado(
	CodGrupo INTEGER PRIMARY KEY,
    NomeGrupo VARCHAR(20) NOT NULL,
    NumBaixasGrupo INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE Dialoga  (
	FK_Id_NomeLider VARCHAR(20) NOT NULL,
    FK_Id_OrganizacaoMediadora INT NOT NULL,
    FK_Id_Grupo INT NOT NULL,
    ConteudoDialogo TEXT, 
    PRIMARY KEY(FK_Id_NomeLider,FK_Id_OrganizacaoMediadora,FK_Id_Grupo),
    FOREIGN KEY(fk_Id_NomeLider) REFERENCES LiderPolitico(NomeLider),
	FOREIGN KEY(FK_Id_OrganizacaoMediadora) REFERENCES OrganizacaoMediadora(Id_OrganizacaoMediadora),
	FOREIGN KEY(FK_Id_Grupo) REFERENCES GrupoArmado(CodGrupo)
);

CREATE TABLE Lider_Chefe(
	CodChefe INTEGER NOT NULL,
	NomeLider VARCHAR(20) NOT NULL,
    CONSTRAINT PRIMARY KEY (CodChefe, NomeLider),
    FOREIGN KEY (CodChefe) REFERENCES ChefeMilitar (CodChefe),
    FOREIGN KEY (NomeLider) REFERENCES LiderPolitico (NomeLider),
    UNIQUE (CodChefe)
);

CREATE TABLE Chefe_Divisao(
	CodChefe INTEGER NOT NULL,
    NroDivisao INTEGER NOT NULL,
    CONSTRAINT PRIMARY KEY (CodChefe, NroDivisao),
    FOREIGN KEY (CodChefe) REFERENCES ChefeMilitar (CodChefe),
    FOREIGN KEY (NroDivisao) REFERENCES Divisao (NroDivisao),
    UNIQUE (CodChefe)
);

CREATE TABLE GrupoArmado_Divisao(
	CodGrupo INTEGER NOT NULL,
    NroDivisao INTEGER NOT NULL,
    CONSTRAINT PRIMARY KEY (CodGrupo, NroDivisao),
    FOREIGN KEY (CodGrupo) REFERENCES GrupoArmado (CodGrupo),
    FOREIGN KEY (NroDivisao) REFERENCES Divisao (NroDivisao),
    UNIQUE (NroDivisao)
);

CREATE TABLE Conflito_GrupoArmado(
	CodConflito INTEGER NOT NULL,
    CodGrupo INTEGER NOT NULL,
    CONSTRAINT PRIMARY KEY (CodConflito, CodGrupo),
    FOREIGN KEY (CodConflito) REFERENCES Conflito (Id_Conflito),
    FOREIGN KEY (CodGrupo) REFERENCES  GrupoArmado (CodGrupo)
);

CREATE TABLE Conflito_Pais(
	NomePais VARCHAR(20) NOT NULL,
    CodConflito INTEGER NOT NULL,
    CONSTRAINT PRIMARY KEY (NomePais, CodConflito),
    FOREIGN KEY (CodConflito) REFERENCES Conflito (Id_Conflito)
);

CREATE TABLE Traficante (
	Id_Traficante INT NOT NULL,
    NomeTraficante VARCHAR (20) NOT NULL,
    UNIQUE (Id_Traficante),
    PRIMARY KEY(Id_Traficante)
);

CREATE TABLE TipoArma  (
	Id_NomeArma VARCHAR(20) NOT NULL, 
	Incador INT NOT NULL DEFAULT 0,
    PRIMARY KEY(Id_NomeArma),
    UNIQUE(Id_NomeArma)
);

CREATE TABLE Fornece  (
	FK_Id_Grupo INT NOT NULL,
    FK_Id_NomeArma VARCHAR(20) NOT NULL, 
    FK_Id_Traficante INT NOT NULL, 
    NumArmas INT NOT NULL DEFAULT 0,
    PRIMARY KEY(FK_Id_Grupo, FK_Id_NomeArma, FK_Id_Traficante),
    FOREIGN KEY(FK_Id_Grupo) REFERENCES GrupoArmado(CodGrupo),
    FOREIGN KEY(FK_Id_NomeArma) REFERENCES TipoArma(Id_NomeArma),
    FOREIGN KEY(FK_Id_Traficante) REFERENCES Traficante(Id_Traficante)
);

CREATE TABLE PodeFornecer  (
	FK_Id_NomeArma VARCHAR(20) NOT NULL, 
	FK_Id_Traficante INT NOT NULL, 
	QNTArmas INT NOT NULL DEFAULT 0,
    FOREIGN KEY(FK_Id_NomeArma) REFERENCES TipoArma(Id_NomeArma),   
    FOREIGN KEY(FK_Id_Traficante) REFERENCES Traficante(Id_Traficante)
);

/* TRIGGERS, RETIREI OS DROP TRIGGERS IF EXISTS*/
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `chefe_divisao_BEFORE_INSERT` BEFORE INSERT ON `chefe_divisao` FOR EACH ROW BEGIN
	IF NEW.NroDivisao = 
		(SELECT NroDivisao
		FROM Chefe_Divisao
		GROUP BY NroDivisao
		HAVING COUNT(*) > 2) THEN
		SIGNAL SQLSTATE '45000';
	END IF;
END
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `conflito_grupoarmado_AFTER_DELETE` AFTER DELETE ON `conflito_grupoarmado` FOR EACH ROW BEGIN
	IF OLD.CodConflito =
		(SELECT CodConflito
		FROM Conflito_GrupoArmado
		GROUP BY CodConflito
		HAVING COUNT(*) = 2) THEN
		DELETE FROM Conflito_GrupoArmado
			WHERE CodConflito = OLD.CodConflito;
	END IF;
END
DELIMITER ;

DELIMITER $$
USE `ep3`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ep3`.`grupoarmado_divisao_AFTER_INSERT` AFTER INSERT ON `grupoarmado_divisao` FOR EACH ROW
BEGIN
	UPDATE GrupoArmado
    SET NumBaixasGrupo = NumBaixasGrupo + 
		(SELECT NumBaixasDiv
        FROM Divisao
        WHERE NEW.NroDivisao = Divisao.NroDivisao)
	WHERE NEW.CodGrupo = GrupoArmado.CodGrupo;
END$$
DELIMITER ;

DELIMITER $$
USE `ep3`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ep3`.`grupoarmado_divisao_AFTER_UPDATE` AFTER UPDATE ON `grupoarmado_divisao` FOR EACH ROW
BEGIN
	UPDATE GrupoArmado
    SET NumBaixasGrupo = NumBaixasGrupo + 
		(SELECT NumBaixasDiv
        FROM Divisao
        WHERE NEW.NroDivisao = Divisao.NroDivisao)
	WHERE NEW.CodGrupo = GrupoArmado.CodGrupo;
END$$
DELIMITER ;

DELIMITER $$
USE `ep3`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ep3`.`divisao_AFTER_UPDATE` AFTER UPDATE ON `divisao` FOR EACH ROW
BEGIN
	UPDATE GrupoArmado
    SET NumBaixasGrupo = NumBaixasGrupo + NEW.NumBaixasDiv
	WHERE GrupoArmado.CodGrupo = 
		(SELECT CodGrupo
        FROM GrupoArmado_Divisao gad
        WHERE NEW.NroDivisao = gad.NroDivisao);
END$$
DELIMITER ;