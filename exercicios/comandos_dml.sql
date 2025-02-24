-- INÍCIO DOS COMANDOS PARA A TAREFA 01
INSERT INTO Pessoa (cpf, email, nome, data_nasc, endereco, telefone)
VALUES 
    ('002', 'pp@email.com', 'Pedro I', '1479-01-10', 'R. Vasco', ''),
    ('003', 'ps@email.com', 'Pedro II', '1516-02-10', 'R. Flamengo', '5501'),
    ('001', 'dj@email.com', 'D João VI', '1415-12-01', 'R. Portugal', ''),
    ('004', 'jj@email.com', 'JJ Xavier', '1746-11-12', 'R. Minas', '5502');

INSERT INTO Paciente (cpf_pessoa, senha, plano_saude)
VALUES 
    ('002', 'senha1', FALSE),
    ('003', 'senha2', TRUE);

INSERT INTO Medico (cpf_pessoa, crm)
VALUES 
    ('001', '111'),
    ('004', '112');

INSERT INTO Especialidade (id, descricao)
VALUES 
    ('11', 'Pediatria'),
    ('12', 'Cardiologia'),
    ('13', 'Ortopedista');

INSERT INTO Medico_Especialidade (cpf_medico, id_especialidade)
VALUES 
    ('001', '11'),
    ('004', '11'),
    ('004', '12');

INSERT INTO Agendamento (cpf_paciente, cpf_medico, dh_consulta, dh_agendamento, valor_consulta)
VALUES 
    ('002', '001', '1782-04-14 16:00', '1782-03-14 10:04:45', 80.00),
    ('002', '004', '1782-04-15 10:00:00', '1782-03-14 10:04:45', 100.00),
    ('002', '004', '1783-05-17 08:00:00', '1783-05-10 16:32:00', 100.00),
    ('003', '001', '1783-05-17 08:30:00', '1783-05-09 09:05:56', 0.00);
-- FIM DOS COMANDOS PARA A TAREFA 01



-- INÍCIO DOS COMANDOS PARA A TAREFA 02
-- COMANDOS DA TAREFA 02.a
UPDATE Pessoa
SET data_nasc = '1416-12-01'
WHERE cpf = '001';

-- COMANDOS DA TAREFA 02.b
UPDATE Pessoa
SET telefone = '5503', email = 'pf@email.com'
WHERE cpf_pessoa = '002';

-- COMANDOS DA TAREFA 02.c
UPDATE Pessoa
SET telefone = '9' || telefone
WHERE telefone IS NOT NULL AND telefone <> '';

-- COMANDOS DA TAREFA 02.d
UPDATE Agendamento
SET dh_consulta = dh_consulta + INTERVAL '2 days', valor_consulta = 150.00
WHERE DATE(dh_consulta) = '1783-05-17';

-- COMANDOS DA TAREFA 02.e
UPDATE Medico_Especialidade
SET id_especialidade = '13'
WHERE cpf_medico = '004' AND id_especialidade = '12';
-- FIM DOS COMANDOS PARA A TAREFA 02



-- INÍCIO DOS COMANDOS PARA A TAREFA 03
-- COMANDOS DA TAREFA 03.a
DELETE FROM Agendamento
WHERE cpf_paciente = '002' AND DATE(dh_consulta) = '1783-05-17';

-- COMANDOS DA TAREFA 03.b
DELETE FROM Agendamento
WHERE cpf_medico = '001' AND valor_consulta = 0.00;

-- COMANDOS DA TAREFA 03.c
DELETE FROM Paciente
WHERE cpf_pessoa IN (
    SELECT cpf FROM Pessoa
    WHERE telefone IS NULL OR telefone = ''
) OR plano_saude = TRUE;

-- COMANDOS DA TAREFA 03.d
DELETE FROM Pessoa
WHERE cpf = '004';

DELETE FROM Medico
WHERE cpf_pessoa = '004';

DELETE FROM Medico_Especialidade
WHERE cpf_medico = '004';

DELETE FROM Agendamento
WHERE cpf_medico = '004';
-- FIM DOS COMANDOS PARA A TAREFA 03