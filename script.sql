CREATE TABLE IF NOT EXISTS Piloto (
    CPF VARCHAR(14) PRIMARY KEY, 
    Nome VARCHAR(205),
    TipoSanguineo VARCHAR(3),
    DataNascimento DATE,
    Sexo CHAR(1) 
);

CREATE TABLE IF NOT EXISTS Categoria (
    CodCategoria INT PRIMARY KEY,
    Descricao VARCHAR(105)
);
 
CREATE TABLE IF NOT EXISTS Carro (
    Numero INT PRIMARY KEY,
    DescMotor VARCHAR(90),
    PotenciaCV INT,
    CodCategoria_CE INT,
    FOREIGN KEY (CodCategoria_CE) REFERENCES Categoria(CodCategoria)
);

CREATE TABLE IF NOT EXISTS Corrida (
    Numero INT PRIMARY KEY,
    DtaHorLargada TIMESTAMP, 
    CodCategoria_CE INT,
    FOREIGN KEY (CodCategoria_CE) REFERENCES Categoria(CodCategoria)
);

CREATE TABLE IF NOT EXISTS InscricoesCorrida (
    NumInscricao INT PRIMARY KEY,
    NumCorrida_CE INT,
    NumCarro_CE INT,
    DtaHorInscricao TIMESTAMP, 
    FOREIGN KEY (NumCorrida_CE) REFERENCES Corrida(Numero),
    FOREIGN KEY (NumCarro_CE) REFERENCES Carro(Numero)
);




INSERT INTO Piloto (CPF, Nome, TipoSanguineo, DataNascimento, Sexo)
VALUES ('459.737.870-79', 'Ronaldo Lombardi de Souza',  'O+', '1995-09-29', 'M'),
        ('354.992.540-95', 'Maria Elizabeth Henrique Porter',  'A-', '1942-10-15', 'F'),
        ('504.893.740-69', 'Italo Pereira Café',  'O-', '2000-03-27', 'M'),
        ('431.964.130-20', 'Julice Cristiane Arruda Bastos',  'AB+', '1970-02-23', 'F');

INSERT INTO Categoria (CodCategoria, Descricao)
VALUES (1, 'NASCAR patrocinado pela Ferrari'),
        (2, 'NASCAR patrocinado pela Aston Martin'),
       (3, 'NASCAR patrocinado pela Red Bull');

INSERT INTO Carro (Numero, DescMotor, PotenciaCV, CodCategoria_CE)
VALUES (1, 'Motor H12', 1340, 1),
        (2, 'Motor V8', 1200, 3),
       (3, 'Motor V6', 900, 2);

INSERT INTO Corrida (Numero, DtaHorLargada, CodCategoria_CE)
VALUES (101, '2024-07-16 16:00:02', 1),
        (102, '2024-07-16 16:00:04', 2),
        (103, '2024-07-16 16:00:08', 3);

INSERT INTO InscricoesCorrida (NumInscricao, NumCorrida_CE, NumCarro_CE, DtaHorInscricao)
VALUES (1, 101, 1, '2024-04-10 18:04:05'),
        (2, 101, 3, '2024-04-30 12:36:27'),
        (3, 101, 2, '2024-04-25 10:30:45');




SELECT * FROM Piloto;


SELECT * FROM Categoria;

SELECT * FROM Carro;

SELECT * FROM Corrida;

SELECT * FROM InscricoesCorrida;



DELETE FROM Piloto WHERE Nome = 'Julice Cristiane Arruda Bastos';

UPDATE Piloto
SET Nome = 'USEI O UPDATE'
WHERE Nome = 'Maria Elizabeth Henrique Porter';

SELECT * FROM Piloto;
