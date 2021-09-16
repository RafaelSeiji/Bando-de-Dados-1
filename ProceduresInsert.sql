/*
Permita cadastrar divisões dentro de um grupo militar, cadastre conflitos bélicos, grupos militares, líderes políticos e chefes militares.
*/
DELIMITER $$
CREATE PROCEDURE InserirGrupoArmado(IN p_CodGrupo INTEGER, IN p_NomeGrupo VARCHAR(20), IN p_NumBaixasGrupo INTEGER)
	BEGIN
		INSERT INTO GrupoArmado (CodGrupo, NomeGrupo, NumBaixasGrupo) VALUES (p_CodGrupo, p_NomeGrupo, p_NumBaixasGrupo);
	END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirLiderPolitico (IN p_NomeLider VARCHAR(20), IN p_apoios TEXT)
	BEGIN
		INSERT INTO LiderPolitico VALUES (p_NomeLider, p_apoios);
	END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirChefeMilitar (IN p_CodChefe INTEGER, IN p_Faixa INTEGER, IN p_NomeLider VARCHAR(20))
	BEGIN
		INSERT INTO ChefeMilitar VALUES (p_CodChefe, p_Faixa);
        INSERT INTO Lider_Chefe VALUES (p_CodChefe, p_NomeLider);
	END$$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirDivisao (IN p_NroDivisao INTEGER, IN p_NumBaixasDiv INTEGER, IN p_QtdBarcos INTEGER, IN p_QtdTanques INTEGER, IN p_QtdAvioes INTEGER, IN p_QtdHomens INTEGER, IN p_CodGrupo INTEGER, IN p_CodChefe INTEGER)
	BEGIN
		INSERT INTO Divisao VALUES (p_NroDivisao, p_NumBaixasDiv, p_QtdBarcos, p_QtdTanques, p_QtdAvioes, p_QtdHomens);
        INSERT INTO GrupoArmado_Divisao VALUES (p_CodGrupo, p_NroDivisao);
        INSERT INTO Chefe_Divisao VALUES (p_CodChefe, p_NroDivisao);
	END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirTipoOrganizacao (IN p_Id_OrganizacaoMediadora INTEGER, IN p_NomeTipo VARCHAR(20))
	BEGIN
		INSERT INTO TipoOrganizacao VALUES (p_Id_OrganizacaoMediadora, p_NomeTipo);
	END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirTipoAjuda (IN p_Id_TipoAjuda INTEGER, IN p_NomeTipo VARCHAR(20))
	BEGIN
		INSERT INTO TipoAjuda VALUES (p_Id_TipoAjuda, p_NomeTipo);
	END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirOrganizacaoMediadora (IN p_Id_OrganizacaoMediadora INTEGER, IN p_NomeOrganizacaoMediadora VARCHAR(20), IN p_FK_Id_TipoOrganizacao INTEGER, IN p_FK_TipoAjuda INTEGER, IN p_OrganizacaoLider VARCHAR(20), IN p_NumPessoas INTEGER)
	BEGIN
		INSERT INTO OrganizcaoMediadora VALUES (p_Id_OrganizacaoMediadora, p_NomeOrganizacaoMediadora, p_FK_Id_TipoOrganizacao, p_FK_TipoAjuda, p_OrganizacaoLider, p_NumPessoas);
    END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirTipoConflito (IN p_Id_TipoConflito INTEGER, IN p_NomeTipo VARCHAR(20), IN p_RazaoTipo VARCHAR(20))
	BEGIN
		INSERT INTO TiposConflitosExistentes VALUES (p_Id_TipoConflito, p_NomeTipo, p_RazaoTipo);
    END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirConflito (IN p_Id_Conflito INTEGER, IN p_FK_Id_OrganizacaoMediadora INTEGER, IN p_NomeConflito VARCHAR(20), IN p_fk_Id_TipoConflito INTEGER, IN p_NumFeridos INTEGER, IN p_NumMortos INTEGER)
	BEGIN 
		INSERT INTO Conflito VALUES (p_Id_Conflito, p_FK_Id_OrganizacaoMediadora, p_NomeConflito, p_fk_Id_TipoConflito, p_NumFeridos, p_NumMortos);
	END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirConflito_GrupoArmado (IN p_Id_Conflito INTEGER, IN p_CodGrupo INTEGER)
	BEGIN
		INSERT INTO Conflito_GrupoArmado VALUES (p_Id_Conflito, p_CodGrupo);
	END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE InserirConflito_Pais (IN p_NomePais VARCHAR(20), In p_CodConflito INTEGER)
	BEGIN
		INSERT INTO Conflito_Pais VALUES (p_NomePais, p_CodConflito);
	END $$