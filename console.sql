CREATE DATABASE clinica
GO
USE clinica
GO
CREATE TABLE especialidade (
    ID		            INT 		    NOT NULL,
    especialidade 		VARCHAR(100) 	NOT NULL
    PRIMARY KEY(ID)
)
GO
CREATE TABLE medico (
    codigo			        INT 		    NOT NULL,
    nome				    VARCHAR(100) 	NOT NULL,
    logradouro			    VARCHAR(200)	NOT NULL,
    numero				    INT		        NOT NULL,
    CEP				        CHAR(8)		    NOT NULL,
    complemento			    VARCHAR(255)	NOT NULL,
    contato				    VARCHAR(11)    	NOT NULL,
    especialidadeID		    INT		        NOT NULL
    PRIMARY KEY (codigo)
    FOREIGN KEY (especialidadeID) REFERENCES especialidade(ID)
)
GO
CREATE TABLE paciente (
    num_beneficiario		INT 		    NOT NULL,
    nome				    VARCHAR(100)	NOT NULL,
    logradouro			    VARCHAR(200)	NOT NULL,
    numero				    INT		        NOT NULL,
    cep				        CHAR(8)		    NOT NULL,
    complemento			    VARCHAR(255)	NOT NULL,
    telefone			    VARCHAR(11)	    NOT NULL
    PRIMARY KEY (num_beneficiario)
)
GO
CREATE TABLE consulta (
    pacienteNum_beneficario		INT 		    NOT NULL,
    medicoCodigo			    INT		        NOT NULL,
    data_hora			        DATETIME	    NOT NULL,
    observacao			        VARCHAR(255)	NOT NULL
    PRIMARY KEY (pacienteNum_beneficario, medicoCodigo, data_hora)
    FOREIGN KEY (pacienteNum_beneficario) REFERENCES paciente (num_beneficiario),
    FOREIGN KEY (medicoCodigo) REFERENCES medico (codigo)
)

INSERT INTO paciente
VALUES
    (99901, 'Washinton Silva', 'R. Anhaia', 150, '02345000', 'casa', '922229999'),
    (99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, '03254010', 'Bloco B. Apto 25', '923450987'),
    (99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, '06987020', 'Apto 1208', '912348765'),
    (99904, 'José Araujo', 'R. XV de Novembro', 18, '03678000', 'casa', '945674312'),
    (99905, 'Joana Paula', 'R. 7 de Abril', 97, '01214000', 'Conjunto 3 - Apto 801', '912095674')

INSERT INTO especialidade
VALUES
    (1, 'Otorrinolaringologista'),
    (2, 'Urologista'),
    (3, 'Geriatra'),
    (4, 'Pediatra')

INSERT INTO medico
VALUES
    (100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 'Casa', '915689456', 1),
    (100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', '923235454', 1),
    (100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 'Apto 205', '963698585', 2),
    (100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', '932458745', 3)

INSERT INTO consulta (pacienteNum_beneficario, medicoCodigo, data_hora, observacao)
VALUES
    (99901, 100002, '2021-09-04 13:20', 'Infecção Urina'),
    (99903, 100003, '2021-09-04 13:15', 'Gripe'),
    (99901, 100001, '2021-09-04 12:30', 'Infecção Garganta')



--ADICIONANDO COLUNA

alter table medico
add dia_atendimento     varchar(100)        null

update medico
set dia_atendimento = 'Segunda-Feira'
where codigo = 100001 or codigo = 100003

update medico
set dia_atendimento = 'Quarta-Feira'
where codigo = 100002
go
update medico
set dia_atendimento = 'Quinta-Feira'
where codigo = 100004

delete from especialidade
where ID = 4

exec sp_rename 'medico.dia_atendimento', 'dia_semana_atendimento', 'column'

update medico
set logradouro = 'Av.Bras Leme', numero = 876, complemento = 'apto 504', CEP = '02122000'
where codigo = 100003

alter table consulta
alter column observacao     varchar(200)        not null


