USE CONFBELICO;

CREATE PROCEDURE mostraBI()
	SELECT TCE.NomeTipo, COUNT(C.fk_Id_TipoConflito) AS QNTCONLITO
    FROM Conflito C
    JOIN TiposConflitosExistentes TCE on TCE.Id_TipoConflito = C.fk_Id_TipoConflito
	GROUP BY C.fk_Id_TipoConflito
    ORDER BY QNTCONLITO ASC;
    
    
CREATE PROCEDURE mostraBII()
	SELECT T.NomeTraficante, GA.NomeGrupo
    FROM Traficante T
    JOIN Fornece F ON T.Id_Traficante = F.FK_Id_Traficante
    JOIN GrupoArmado GA on GA.Id_Grupo = F.FK_Id_Grupo 
    JOIN TipoArma  TA on TA.id_NomeArma = F.FK_Id_NomeArma
    WHERE TA.Id_NomeArma like '%Barret M82%' or TA.Id_NomeArma like '%M200 intervention%';
    
CREATE PROCEDURE mostraBIII()
	SELECT C.NomeConflito, C.NumMortos
    FROM Conflito C
	ORDER BY C.NumMortos desc
    LIMIT 5;
        
CREATE PROCEDURE mostraBIV()
	SELECT OM.NomeOrganizacaoMediadora, COUNT(C.FK_Id_OrganizacaoMediadora) AS QNTMEDIACOES
    FROM Conflito C
    JOIN OrganizacaoMediadora OM on OM.Id_OrganizacaoMediadora = C.FK_Id_OrganizacaoMediadora
    GROUP BY C.FK_Id_OrganizacaoMediadora
    ORDER BY QNTMEDIACOES DESC
    LIMIT 5;
    

CREATE PROCEDURE mostraBV()
	SELECT GA.NomeGrupo, SUM(F.NumArmas) AS QNTARMAS
    FROM Fornece F
    JOIN GrupoArmado GA on GA.Id_Grupo = F.FK_Id_Grupo 
    GROUP BY F.FK_Id_Grupo
    ORDER BY QNTARMAS DESC
    LIMIT 5; 
    
    
CREATE PROCEDURE mostraBVI()
	SELECT CP.Pais, COUNT(CP.Pais) AS QNTCONFLITO
    FROM Conflito C
    JOIN ConflitoPais CP on CP.FK_Id_Conflito = C.Id_Conflito
    JOIN TiposConflitosExistentes TCP on TCP.Id_TipoConflito = C.fk_Id_TipoConflito
	WHERE TCP.NomeTipo LIKE '%religioso%'
    GROUP BY CP.PAIS
    ORDER BY QNTCONFLITO  DESC 
    LIMIT 1;
    