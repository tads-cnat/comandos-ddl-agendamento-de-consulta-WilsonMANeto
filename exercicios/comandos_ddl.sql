CREATE TABLE Pessoa (
    cpf CHAR(11) PRIMARY KEY,
    email VARCHAR(50) UNIQUE NOT NULL,
    nome VARCHAR(150) UNIQUE NOT NULL,
    data_nasc DATE NOT NULL,
    endereco VARCHAR(300) NOT NULL,
    telefone VARCHAR(15) NULL
);

CREATE TABLE Paciente (
    cpf_pessoa CHAR(11) PRIMARY KEY REFERENCES Pessoa(cpf),
    senha VARCHAR(20) NOT NULL CHECK (LENGTH(senha) BETWEEN 5 AND 10),
    plano_saude BOOLEAN NOT NULL
);

CREATE TABLE Medico (
    cpf_pessoa CHAR(11) PRIMARY KEY REFERENCES Pessoa(cpf),
    crm VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE Agendamento (
    cpf_paciente CHAR(11) REFERENCES Paciente(cpf_pessoa) ON DELETE CASCADE,
    cpf_medico CHAR(11) REFERENCES Medico(cpf_pessoa) ON DELETE CASCADE,
    dh_consulta TIMESTAMP,
    dh_agendamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_consulta DECIMAL(10,2) NOT NULL CHECK (valor_consulta >= 0) DEFAULT 0.0,
    PRIMARY KEY (cpf_paciente, cpf_medico, dh_consulta)
);

CREATE TABLE Especialidade (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(300) NOT NULL
);

CREATE TABLE Medico_Especialidade (
    cpf_medico CHAR(11) REFERENCES Medico(cpf_pessoa) ON DELETE CASCADE,
    id_especialidade INT REFERENCES Especialidade(id) ON DELETE CASCADE,
    PRIMARY KEY (cpf_medico, id_especialidade)
);