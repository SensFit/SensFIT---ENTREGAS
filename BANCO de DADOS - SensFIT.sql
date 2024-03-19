CREATE DATABASE SensorAcademia;
USE SensorAcademia;

-- =============================================================================
-- CRIAÇÃO DA TABELA Academia

CREATE TABLE Academia (
idAcademia INT AUTO_INCREMENT, -- PRIMARY KEY
Nome VARCHAR(80),
CEP CHAR(9),
Endereco VARCHAR(45),
Numero INT,

PRIMARY KEY PK_idAcademia (idAcademia)
);

INSERT INTO Academia
(Nome, CEP, Endereco, Numero)
VALUES
('Green Fit', '03142020', 'Avenida Conselheiro Carrão', 666),
('Esperto Fit', '04543040', 'Rua Oscar Freire', 228),
('Bu Fit', '06634080', 'Av. Mato Grosso', 3520),
('Ledi Fit', '87830020', 'Avenida Paulista', 735);


SELECT * FROM Academia;
-- =============================================================================
-- CRIAÇÃO DA TABELA Usuario

CREATE TABLE Usuario (
idUsuario INT AUTO_INCREMENT, 
Nome VARCHAR(50),
Telefone CHAR(11),
Email VARCHAR(50),
FK_idAcademia INT NOT NULL,

PRIMARY KEY PK_idUsuario (idUsuario), -- Fazendo a coluna idUsuario se tornar uma PRIMARY KEY
FOREIGN KEY ForeignKey_idAcademia (FK_idAcademia) REFERENCES Academia (idAcademia) -- Ao digitar "ForeignKey_id_Academia", estou dando um nome a chave estrangeira
																				   -- O que está em parentêses "(FK_idAcademia)", é a coluna da tabela DadosSensor, após isso...
																				   -- Usamos o "REFERENCES Academia (idAcademia)", para referenciar que "FK_idAcademia" é a chave estrangeira da coluna "idAcademia".
);

INSERT INTO Usuario -- Coloco entre parentêses e por vírgula, todas as colunas menos a PrimaryKey da tabela, já que coloquei o AUTO_INCREMENT.
(Nome, Telefone, Email, FK_idAcademia)
VALUES -- Inserindo os 4 valores para as 4 colunas que eu coloquei acima.
('Rafael', '1199872111', 'rafael.lee@gmail.com', 1),
('Kohatsu', '11947139850', 'gustavo.kohatsu@hotmail.com', 2),
('Giovana', '11978713311', 'giovana.beltrao@gmail.com', 3),
('Lucas', '11985188664', 'lucas.souza@sptech.com', 4);

SELECT * FROM Usuario;
-- =============================================================================
-- CRIAÇÃO DA TABELA Maquina

CREATE TABLE Maquina (
idMaquina 		INT AUTO_INCREMENT,
Nome 			VARCHAR(50),
tipo_maquina 	VARCHAR(50),
qtd_maquina 	INT,
dtVerificacao 	DATE,
FK_idAcademia 	INT NOT NULL DEFAULT 1, -- Foreign key da tabela Maquina, mas que também é a primary key da tabela Academia.

PRIMARY KEY PK_idMaquina (idMaquina), -- Fazendo a coluna idMaquina se tornar uma PRIMARY KEY
FOREIGN KEY ForeignKey_idAcademia (FK_idAcademia) REFERENCES Academia (idAcademia) -- Ao digitar "ForeignKey_id_Academia", estou dando um nome a chave estrangeira
																				   -- O que está em parentêses "(FK_idAcademia)", é a coluna da tabela DadosSensor, após isso...
																				   -- Usamos o "REFERENCES Academia (idAcademia)", para referenciar que "FK_idAcademia" é a chave estrangeira da coluna "idAcademia".
);

INSERT INTO Maquina -- Coloco entre parentêses e por vírgula, todas as colunas menos a PrimaryKey da tabela, já que coloquei o AUTO_INCREMENT.
(Nome, Tipo_Maquina, qtd_maquina, dtVerificacao, FK_idAcademia)
VALUES -- Inserindo os 5 valores para as 5 colunas que eu coloquei acima.
('Agachamento no smith'		  , 'Pernas', 5, '2018-12-23', 1),
('Leg press'				  , 'Pernas', 6, '1997-02-15', 2),
('Hack agachamento'			  , 'Pernas', 3, '2012-04-20', 3),
('Máquina agachamento livre'  , 'Pernas', 1, '2012-05-22', 4),
('Cadeira extensora'		  , 'Pernas', 4, '2012-06-20', 1),
('Cadeira flexora'			  , 'Pernas', 2, '2012-10-12', 2),
('Mesa flexora'				  , 'Pernas', 2, '2012-02-23', 3),
('Panturrilha'				  , 'Pernas', 3, '2004-07-24', 4),
('Cadeira de abdução'		  , 'Pernas', 2, '2021-04-20', 1),
('Cadeira de adução'		  , 'Pernas', 2, '2021-01-01', 2),
('Elevação pélvica na máquina', 'Pernas', 5, '2021-03-30', 3),
('Desenvolvimento na máquina' , 'Braços', 6, '2021-02-23', 4),
('Tríceps máquina'			  , 'Braços', 6, '2021-06-10', 1),
('Bíceps máquina'			  , 'Braços', 6, '2022-12-30', 2),
('Antebraço giratório'		  , 'Braços', 1, '2023-01-01', 3),
('Remada na máquina'		  , 'Tronco', 16, '2023-12-01', 4),
('Supino'					  , 'Tronco', 12, '2004-10-25', 1),
('Máquina abdominal'		  , 'Abdômen/Lombar', 8, '2002-04-20', 2),
('Cadeira romana'			  , 'Abdômen/Lombar', 3, '2017-10-22', 3),
('Polias'					  , 'Multiarticular', 10, '2019-12-16', 4),
('Esteiras'					  , 'Cardio', 14, '2009-09-12', 1),
('Escadas'				 	  , 'Cardio', 2, '2012-04-10', 2),
('Elíptico'					  , 'Cardio', 10, '2019-11-20', 3),
('Bike'						  , 'Cardio', 8, '2001-07-30', 4);

-- =============================================================================
/*
ALGUNS SELECTS ABAIXO, USANDO "CONCAT", "ALIAS", "ORDER BY", "LIKE", etc!!!
ALGUNS SELECTS ABAIXO, USANDO "CONCAT", "ALIAS", "ORDER BY", "LIKE", etc!!!
ALGUNS SELECTS ABAIXO, USANDO "CONCAT", "ALIAS", "ORDER BY", "LIKE", etc!!!

SELECT * FROM Maquina
ORDER BY Tipo_Maquina;

SELECT Nome,
	   Tipo_Maquina, 
       CONCAT(Nome, ' - ', Tipo_Maquina) AS 'Nome + Grupo muscular'
FROM Maquina
WHERE Tipo_Maquina LIKE 'Braços';

SELECT Nome,
	   Tipo_Maquina, 
       CONCAT(Nome, ' - ', Tipo_Maquina) AS 'Nome + Grupo muscular'
FROM Maquina
WHERE Tipo_Maquina LIKE '%Lombar%';

SELECT Nome,
	   Tipo_Maquina, 
       CONCAT(Nome, ' - ', Tipo_Maquina) AS 'Nome + Grupo muscular'
FROM Maquina
WHERE Tipo_Maquina LIKE 'Cardio';

SELECT Nome,
	   Tipo_Maquina, 
       CONCAT(Nome, ' - ', Tipo_Maquina) AS 'Nome + Grupo muscular'
FROM Maquina
WHERE Tipo_Maquina LIKE 'Multiarticular';

SELECT Nome,
	   Tipo_Maquina, 
       CONCAT(Nome, ' - ', Tipo_Maquina) AS 'Nome + Grupo muscular'
FROM Maquina
WHERE Tipo_Maquina LIKE 'Pernas';

SELECT Nome,
	   Tipo_Maquina, 
       CONCAT(Nome, ' - ', Tipo_Maquina) AS 'Nome + Grupo muscular'
FROM Maquina
WHERE Tipo_Maquina LIKE 'Tronco';

SELECT * FROM Maquina;
*/
-- =============================================================================
-- CRIAÇÃO DA TABELA DadosSensor

CREATE TABLE DadosSensor (
idDadosSensor 		INT AUTO_INCREMENT, -- os IDs das tabelas, na maioria das vezes são as Primary Key...
dtVerificacao 		DATE, 
qtdUsos 			INT,
horasUtilizadasDia 	INT,
Atividade 				VARCHAR(7) -- DataType da coluna deve ser VARCHAR(7), já que entre as 2 palavras, a maior é "Inativa" e contém 7 caracteres e não necessita de mais caracteres.
						NOT NULL DEFAULT 'Inativo'
                        CHECK (Atividade IN ('Ativo', 'Inativo')), -- Restrinjo para que coluna Atividade aceite valores que estão dentro dos parentêses, nesse caso 'Ativo' ou 'Inativo'.
FK_idAcademia 		INT NOT NULL,
FK_idMaquina 		INT NOT NULL,

PRIMARY KEY PK_idDadosSensor (idDadosSensor), -- Fazendo a coluna idDadosSensor se tornar uma PRIMARY KEY
FOREIGN KEY ForeignKey_id_Academia (FK_idAcademia) REFERENCES Academia (idAcademia), -- Ao digitar "ForeignKey_id_Academia", estou dando um nome a chave estrangeira
																					 -- O que está em parentêses "(FK_idAcademia)", é a coluna da tabela DadosSensor, após isso...
																					 -- Usamos o "REFERENCES Academia (idAcademia)", para referenciar que "FK_idAcademia" é a chave estrangeira da coluna "idAcademia".
                                                                                     
FOREIGN KEY ForeignKey_id_Maquina (FK_idMaquina) REFERENCES Maquina (idMaquina) -- Ao digitar "ForeignKey_id_Maquina", estou dando um nome a chave estrangeira
																				-- O que está em parentêses "(FK_idMaquina)", é a coluna da tabela DadosSensor, após isso...
																				-- Usamos o "REFERENCES Maquina (idMaquina)", para referenciar que "FK_idMaquina" é a chave estrangeira da coluna "idMaquina".
);

INSERT INTO DadosSensor -- Coloco entre parentêses e por vírgula, todas as colunas menos a PrimaryKey da tabela, já que coloquei o AUTO_INCREMENT.
(dtVerificacao, qtdUsos, horasUtilizadasDia, Atividade, FK_idAcademia, FK_idMaquina)
VALUES -- Inserindo os 6 valores para as 6 colunas que eu coloquei acima.
('2000-02-20', 30, 2, 'Ativo', 1, 1),
('2012-05-22', 31, 3, 'Ativo', 2, 2),
('2012-06-20', 32, 4, 'Ativo', 3, 3),
('2012-10-12', 33, 5, 'Ativo', 4, 4),
('2021-03-30', 34, 6, 'Ativo', 1, 5),
('2021-02-23', 35, 7, 'Ativo', 2, 6),
('2021-06-10', 36, 8, 'Ativo', 3, 7),
('2021-06-11', 37, 9, 'Ativo', 4, 8),
('2021-06-12', 38, 10, 'Ativo', 1, 9),
('2021-06-13', 39, 11, 'Ativo', 2, 10),
('2021-06-14', 40, 12, 'Ativo', 3, 11),
('2021-06-15', 41, 13, 'Ativo', 4, 12),
('2021-06-16', 42, 14, 'Inativo', 1, 13),
('2021-06-17', 43, 15, 'Inativo', 2, 14),
('2021-06-18', 44, 16, 'Inativo', 3, 15),
('2021-06-19', 45, 17, 'Inativo', 4, 16),
('2021-06-20', 46, 18, 'Inativo', 1, 17),
('2021-06-21', 47, 19, 'Inativo', 2, 18),
('2021-06-22', 48, 20, 'Inativo', 3, 19),
('2021-06-23', 49, 21, 'Inativo', 4, 20),
('2021-06-24', 50, 22, 'Inativo', 1, 21),
('2021-06-25', 51, 23, 'Inativo', 2, 22),
('2021-06-26', 52, 24, 'Inativo', 3, 23),
('2021-06-27', 53, 25, 'Inativo', 4, 24);

DROP TABLE Academia; -- Dropar a tabela Academia caso precise.
DROP TABLE Usuario; -- Dropar a tabela Usuario caso precise.
DROP TABLE Maquina; -- Dropar a tabela Maquina caso precise.
DROP TABLE DadosSensor; -- Dropar a tabela DadosSensor caso precise.

SELECT * FROM Academia; -- Verificar se os campos da tabela Academia existem.
SELECT * FROM Usuario; -- Verificar se os campos da tabela Usuario existem, e se a FK da tabela Academia existe.
SELECT * FROM Maquina; -- Verificar se os campos da tabela Maquina existem, e se a FK da tabela Academia existe.
SELECT * FROM DadosSensor; -- Verificar se os campos da tabela DadosSensor existem, e se as Foreign Keys das tabelas Academia e Maquina existem.

-- DROP DATABASE SensorAcademia;
