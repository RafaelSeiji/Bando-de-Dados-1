/*
Gerar um gráfico, histograma, por tipo de conflito e número de conflitos.
*/
CREATE PROCEDURE mostraBI()
	SELECT TCE.NomeTipo, COUNT(C.fk_Id_TipoConflito) AS QNTCONLITO
    FROM Conflito C
    JOIN TiposConflitosExistentes TCE on TCE.Id_TipoConflito = C.fk_Id_TipoConflito
	GROUP BY C.fk_Id_TipoConflito
    ORDER BY QNTCONLITO ASC;
    
/*
Listar 	os traficantes e os grupos armados (Nome) para os quais os traficantes fornecem armas “Barret M82” ou “M200 intervention”.
*/    
CREATE PROCEDURE mostraBII()
	SELECT T.NomeTraficante, GA.NomeGrupo
    FROM Traficante T
    JOIN Fornece F ON T.Id_Traficante = F.FK_Id_Traficante
    JOIN GrupoArmado GA on GA.CodGrupo= F.FK_Id_Grupo 
    JOIN TipoArma  TA on TA.id_NomeArma = F.FK_Id_NomeArma
    WHERE TA.Id_NomeArma like '%Barret M82%' or TA.Id_NomeArma like '%M200 intervention%';
/*
Listar os 5 maiores conflitos em número de mortos.
*/    
CREATE PROCEDURE mostraBIII()
	SELECT C.NomeConflito, C.NumMortos
    FROM Conflito C
	ORDER BY C.NumMortos desc
    LIMIT 5;
/*
Listar as 5 maiores organizações em número de mediações.
*/        
CREATE PROCEDURE mostraBIV()
	SELECT OM.NomeOrganizacaoMediadora, COUNT(C.FK_Id_OrganizacaoMediadora) AS QNTMEDIACOES
    FROM Conflito C
    JOIN OrganizacaoMediadora OM on OM.Id_OrganizacaoMediadora = C.FK_Id_OrganizacaoMediadora
    GROUP BY C.FK_Id_OrganizacaoMediadora
    ORDER BY QNTMEDIACOES DESC
    LIMIT 5;
    
/*
Listar os 5 maiores grupos armados com maior número de armas fornecidos.
*/
CREATE PROCEDURE mostraBV()
	SELECT GA.NomeGrupo, SUM(F.NumArmas) AS QNTARMAS
    FROM Fornece F
    JOIN GrupoArmado GA on GA.CodGrupo = F.FK_Id_Grupo 
    GROUP BY F.FK_Id_Grupo
    ORDER BY QNTARMAS DESC
    LIMIT 5; 
    
/*
Listar o país e número de conflitos com maior número de conflitos religiosos.
*/    
CREATE PROCEDURE mostraBVI()
	SELECT CP.NomePais, COUNT(CP.NomePais) AS QNTCONFLITO
    FROM Conflito C
    JOIN Conflito_Pais CP on CP.CodConflito = C.Id_Conflito
    JOIN TiposConflitosExistentes TCP on TCP.Id_TipoConflito = C.fk_Id_TipoConflito
	WHERE TCP.NomeTipo LIKE '%religioso%'
    GROUP BY CP.NomePAIS
    ORDER BY QNTCONFLITO  DESC 
    LIMIT 1;


	