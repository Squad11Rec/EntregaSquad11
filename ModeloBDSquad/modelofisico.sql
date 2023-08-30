-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Curso (
idCurso INTEGER PRIMARY KEY,
Turma VARCHAR(30),
Conteudo VARCHAR(100),
CargaHoraria NUMERIC(5)
)

CREATE TABLE Dar Aula (
idCurso INTEGER,
MatriculaVoluntario INTEGER,
FOREIGN KEY(idCurso) REFERENCES Curso (idCurso)
)

CREATE TABLE Voluntario (
Especialidade VARCHAR(50),
Telefone NUMERIC(12),
Endereco VARCHAR(50),
Nome VARCHAR(50),
MatriculaVoluntario INTEGER PRIMARY KEY,
CPF NUMERIC(12)
)

CREATE TABLE Faz (
idCurso INTEGER,
MatriculaAluno INTEGER,
FOREIGN KEY(idCurso) REFERENCES Curso (idCurso)
)

CREATE TABLE Aluno (
Nome VARCHAR(50),
Endereço VARCHAR(40),
Telefone NUMERIC(12),
MatriculaAluno INTEGER PRIMARY KEY,
CPF NUMERIC(11)
)

CREATE TABLE Candidatar (
idVagas INTEGER,
MatriculaAluno INTEGER,
FOREIGN KEY(MatriculaAluno) REFERENCES Aluno (MatriculaAluno)
)

CREATE TABLE Vagas (
PJ VARCHAR(50),
Freelance VARCHAR(50),
CLT VARCHAR(50),
idVagas INTEGER PRIMARY KEY
)

CREATE TABLE Gerencia (
idEmpresa INTEGER,
idVagas INTEGER,
FOREIGN KEY(idVagas) REFERENCES Vagas (idVagas)
)

CREATE TABLE Empresa (
Ramo VARCHAR(30),
Nome VARCHAR(50),
idEmpresa INTEGER PRIMARY KEY,
CNPJ NUMERIC(11)
)

CREATE TABLE Efetua (
idEmpresa INTEGER,
idPatrocinador INTEGER,
FOREIGN KEY(idEmpresa) REFERENCES Empresa (idEmpresa)
)

CREATE TABLE Patrocinio (
ValorInvestido DECIMAL(100),
RegistroPatrocinio VARCHAR(30),
idPatrocinador INTEGER PRIMARY KEY
)

ALTER TABLE Dar Aula ADD FOREIGN KEY(MatriculaVoluntario) REFERENCES Voluntario (MatriculaVoluntario)
ALTER TABLE Faz ADD FOREIGN KEY(MatriculaAluno) REFERENCES Aluno (MatriculaAluno)
ALTER TABLE Candidatar ADD FOREIGN KEY(idVagas) REFERENCES Vagas (idVagas)
ALTER TABLE Gerencia ADD FOREIGN KEY(idEmpresa) REFERENCES Empresa (idEmpresa)
ALTER TABLE Efetua ADD FOREIGN KEY(idPatrocinador) REFERENCES Patrocinio (idPatrocinador)
