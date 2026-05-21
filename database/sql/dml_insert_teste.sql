INSERT INTO TB_RESPONSAVEL (
    ID_RESPONSAVEL, NM_RESPONSAVEL, NR_DOCUMENTO, NR_TELEFONE, DS_EMAIL,
    DS_ENDERECO, DS_PREFERENCIA_CONTATO, ST_RECEBE_NOTIFICACAO
) VALUES (
    1, 'Carlos Mendes', '12345678900', '11999990001', 'carlos@email.com',
    'Rua das Flores, 100', 'WHATSAPP', 'S'
);

INSERT INTO TB_RESPONSAVEL VALUES (
    2, 'Fazenda Santa Rita LTDA', '12345678000199', '11999990002',
    'contato@santarita.com', 'Estrada Rural, KM 12', 'EMAIL', 'S', SYSDATE
);

INSERT INTO TB_PET (
    ID_PET, NM_PET, DS_ESPECIE, DS_RACA, DT_NASCIMENTO, NR_PESO, NR_ALTURA,
    DS_SEXO, DS_ALERGIAS, ST_CASTRADO, DS_COR_PELAGEM, DS_MICROCHIP, ID_RESPONSAVEL
) VALUES (
    1, 'Thor', 'CACHORRO', 'Golden Retriever', TO_DATE('2018-04-10','YYYY-MM-DD'),
    34.50, 62.00, 'M', 'Alergia a penicilina', 'S', 'Dourado', 'MC001', 1
);

INSERT INTO TB_PET VALUES (
    2, 'Mia', 'GATO', 'Siamês', TO_DATE('2021-08-20','YYYY-MM-DD'),
    4.20, 28.00, 'F', 'Sem alergias conhecidas', 'S', 'Creme', 'MC002', SYSDATE, 1
);

INSERT INTO TB_VETERINARIO VALUES (
    1, 'Dra. Ana Souza', 'CRMV-SP-12345', 'Clínica Geral', 'CLINICA',
    'ana.souza@vet.com', '11988880001', 'ATIVO', SYSDATE
);

INSERT INTO TB_VETERINARIO VALUES (
    2, 'Dr. João Lima', 'CRMV-SP-67890', 'Dermatologia', 'HIBRIDO',
    'joao.lima@vet.com', '11988880002', 'ATIVO', SYSDATE
);

INSERT INTO TB_CLINICA VALUES (
    1, 'Clínica Animal Care', '11222333000144', 'contato@animalcare.com',
    '1133334444', 'Av. Paulista', '1000', 'Bela Vista', 'São Paulo', 'SP',
    '01310000', 'CLINICA_VETERINARIA', 'Clínica Geral', 'N', 'S', 'ATIVA', SYSDATE
);

INSERT INTO TB_CLINICA VALUES (
    2, 'Hospital Vet Prime', '55666777000188', 'contato@vetprime.com',
    '1144445555', 'Rua Vergueiro', '500', 'Liberdade', 'São Paulo', 'SP',
    '01504000', 'HOSPITAL_VETERINARIO', 'Emergência', 'S', 'S', 'ATIVA', SYSDATE
);

INSERT INTO TB_VINCULO_CLINICA_VET VALUES (
    1, 1, 1, TO_DATE('2025-01-10','YYYY-MM-DD'), NULL, 'FUNCIONARIO', 'ATIVO'
);

INSERT INTO TB_VINCULO_CLINICA_VET VALUES (
    2, 2, 1, TO_DATE('2025-03-15','YYYY-MM-DD'), NULL, 'PRESTADOR', 'ATIVO'
);

INSERT INTO TB_CONSULTA VALUES (
    1, 1, 1, 1, TO_DATE('2026-05-10','YYYY-MM-DD'),
    'EMERGENCIA', 'Febre, apatia e falta de apetite',
    'Suspeita de infecção', 'Solicitado acompanhamento do quadro clínico',
    TO_DATE('2026-05-17','YYYY-MM-DD'), 'REALIZADA'
);

INSERT INTO TB_CONSULTA VALUES (
    2, 2, 2, 1, TO_DATE('2026-05-12','YYYY-MM-DD'),
    'ROTINA', 'Coceira e irritação na pele',
    'Dermatite leve', 'Recomendado tratamento tópico',
    TO_DATE('2026-05-26','YYYY-MM-DD'), 'REALIZADA'
);

INSERT INTO TB_TRATAMENTO VALUES (
    1, 1, 1, 1, 'Antibiótico X', '2 comprimidos',
    '12 em 12 horas', TO_DATE('2026-05-10','YYYY-MM-DD'),
    TO_DATE('2026-05-20','YYYY-MM-DD'),
    'Administrar após alimentação e observar febre.',
    'ATIVO', 80.00, 'Pet apresentou melhora parcial.'
);

INSERT INTO TB_TRATAMENTO VALUES (
    2, 2, 2, 2, 'Pomada Dermatológica', 'Aplicar camada fina',
    '2 vezes ao dia', TO_DATE('2026-05-12','YYYY-MM-DD'),
    TO_DATE('2026-05-22','YYYY-MM-DD'),
    'Aplicar na região afetada e evitar lambedura.',
    'ATIVO', 60.00, 'Irritação apresentou pequena melhora.'
);

INSERT INTO TB_ALERTA VALUES (
    1, 1, 1, 1, TO_DATE('2026-05-18','YYYY-MM-DD'),
    'RETORNO_ATRASADO', 'MODERADO',
    'Pet não retornou na data prevista para reavaliação.',
    'ATIVO', 'S'
);

INSERT INTO TB_ALERTA VALUES (
    2, 2, 2, 2, TO_DATE('2026-05-20','YYYY-MM-DD'),
    'TRATAMENTO_PENDENTE', 'ALTO',
    'Responsável não confirmou evolução adequada do tratamento.',
    'ATIVO', 'S'
);

COMMIT;