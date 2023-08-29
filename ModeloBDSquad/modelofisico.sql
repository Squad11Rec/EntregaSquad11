-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Faz (
idCurso INTEGER,
MatriculaAluno INTEGER
)

CREATE TABLE Dar Aula (
idCurso INTEGER,
MatriculaVoluntario INTEGER
)

CREATE TABLE Voluntario (
MatriculaVoluntario INTEGER PRIMARY KEY,
Nome VARCHAR(50),
Especialidade VARCHAR(30),
Telefone NUMERIC(11),
Endereco VARCHAR(50)
)

CREATE TABLE Aluno (
MatriculaAluno INTEGER PRIMARY KEY,
Nome VARCHAR(50),
Endereço VARCHAR(50),
Telefone NUMERIC(11)
)

CREATE TABLE Candidatar (
idVagas INTEGER,
MatriculaAluno INTEGER,
FOREIGN KEY(MatriculaAluno) REFERENCES Aluno (MatriculaAluno)
)

CREATE TABLE Vagas (
idVagas INTEGER PRIMARY KEY,
Freelance VARCHAR(100),
CLT VARCHAR(100),
PJ VARCHAR(100)
)

CREATE TABLE Gerencia (
CNPJ CHAR(10),
idVagas INTEGER,
FOREIGN KEY(idVagas) REFERENCES Vagas (idVagas)
)

CREATE TABLE Empresa (
CNPJ CHAR(14) PRIMARY KEY,
Nome VARCHAR(50),
Ramo VARCHAR(30)
)

CREATE TABLE Efetua (
CNPJ CHAR(10),
idPatrocinador INTEGER,
FOREIGN KEY(CNPJ) REFERENCES Empresa (CNPJ)
)

CREATE TABLE Patrocinio (
idPatrocinador INTEGER PRIMARY KEY,
ValorInvestido DECIMAL(30),
RegistroPatrocinio VARCHAR(50)
)

CREATE TABLE Curso (
idCurso INTEGER PRIMARY KEY,
Nome VARCHAR(30),
Turma CHAR(10),
Conteudo VARCHAR(100),
CargaHoraria NUMERIC(10)
)

ALTER TABLE Faz ADD FOREIGN KEY(idCurso) REFERENCES Curso (idCurso)
ALTER TABLE Faz ADD FOREIGN KEY(MatriculaAluno) REFERENCES Aluno (MatriculaAluno)
ALTER TABLE Dar Aula ADD FOREIGN KEY(idCurso) REFERENCES Curso (idCurso)
ALTER TABLE Dar Aula ADD FOREIGN KEY(MatriculaVoluntario) REFERENCES Voluntario (MatriculaVoluntario)
ALTER TABLE Candidatar ADD FOREIGN KEY(idVagas) REFERENCES Vagas (idVagas)
ALTER TABLE Gerencia ADD FOREIGN KEY(CNPJ) REFERENCES Empresa (CNPJ)
ALTER TABLE Efetua ADD FOREIGN KEY(idPatrocinador) REFERENCES Patrocinio (idPatrocinador)
