INSERT INTO TiposConflitosExistentes VALUES 
	(1, 'Religioso', 'Religiao'),
	(2, 'Etnico', 'Etnia'),
    (3, 'Territorial', 'Regiao'),
    (4, 'Economico', 'MateriaPrima');
    
INSERT INTO TipoOrganizacao VALUES
	(1, 'Gov'),
    (2, 'NGov'),
    (3, 'Int');
    
INSERT INTO TipoAjuda VALUES
	(1, 'Med'),
    (2, 'Dip'),
    (3, 'Pre');
    
INSERT INTO OrganizacaoMediadora VALUES
	(1, 'Org1', 1, 1, 'LiderOrg1', 10),
    (2, 'Org2', 2, 2, 'LiderOrg2', 20),
    (3, 'Org3', 3, 3, 'LiderOrg3', 30);
    
INSERT INTO Conflito VALUES
	(1, 1, 'Conf1', 1, 10, 10),
    (2, 2, 'Conf2', 2, 20, 20),
    (3, 3, 'Conf3', 3, 30, 30);

INSERT INTO LogTipoConflito VALUES
	(1, 1, 1, 'Extra1'),
    (2, 2, 2, 'Extra2'),
    (3, 3, 3, 'Extra3');
    
INSERT INTO ChefeMilitar VALUES
	(1, 1),
    (2, 2),
    (3, 3);
    
INSERT INTO LiderPolitico VALUES
	('LiderPol1', 'text1'),
    ('LiderPol2', 'text2'),
    ('LiderPol3', 'text3');

INSERT INTO Divisao VALUES
	(1, 10, 10, 10, 10, 10),
    (2, 20, 20, 20, 20, 20),
    (3, 30, 30, 30, 30, 30);

INSERT INTO GrupoArmado VALUES 
	(1, 'Grupo1', 1),
    (2, 'Grupo2', 2),
    (3, 'Grupo3', 3);

INSERT INTO Dialoga VALUES
	('LiderPol1', 1, 1, 'text'),
    ('LiderPol2', 2, 2, 'text'),
    ('LiderPol3', 3, 3, 'text');

INSERT INTO Lider_Chefe VALUES
	(1, 'LiderPol1'),
    (2, 'LiderPol2'),
    (3, 'LiderPol3');
    
INSERT INTO Chefe_Divisao VALUES
	(1, 1),
    (2, 2),
    (3, 3);
    
INSERT INTO GrupoArmado_Divisao VALUES
	(1, 1),
    (2, 2),
    (3, 3);
    
INSERT INTO Conflito_GrupoArmado VALUES
	(1, 1),
    (1, 2),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 3);
    
INSERT INTO Conflito_Pais VALUES
	('Pais1', 1),
    ('Pais1', 2),
    ('Pais2', 2),
    ('Pais2', 3),
    ('Pais3', 3);
    
INSERT INTO Traficante VALUES 
	(1, 'Traf1'),
    (2, 'Traf2'),
    (3, 'Traf3');
    
INSERT INTO TipoArma VALUES
	('A1', 10),
    ('A2', 20),
    ('A3', 30);
    
INSERT INTO Fornece VALUES
	(1, 'A1', 1, 10),
    (2, 'A2', 2, 20),
    (3, 'A3', 3, 30);
    
INSERT INTO PodeFornecer VALUES
	('A1', 1, 11),
    ('A2', 2, 22),
    ('A3', 3, 33);
    
    
