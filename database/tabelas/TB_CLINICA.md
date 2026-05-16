# TB_CLINICA

## OBJETIVO
Armazenar os dados das clínicas, hospitais veterinários ou instituições que realizam atendimentos aos pets dentro da plataforma.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_CLINICA | NUMBER | PK | Identificador único da clínica. |
| NM_CLINICA | VARCHAR2(100) | NOT NULL | Nome da clínica, hospital ou instituição veterinária. |
| NR_CNPJ | VARCHAR2(14) | UNIQUE | CNPJ da clínica ou instituição. |
| DS_EMAIL | VARCHAR2(150) | UNIQUE | E-mail de contato da clínica. |
| NR_TELEFONE | VARCHAR2(15) | | Telefone de contato da clínica. |
| DS_LOGRADOURO | VARCHAR2(100) | | Rua, avenida ou logradouro da clínica. |
| NR_ENDERECO | VARCHAR2(10) | | Número do endereço. |
| DS_BAIRRO | VARCHAR2(60) | | Bairro da clínica. |
| DS_CIDADE | VARCHAR2(60) | | Cidade da clínica. |
| DS_ESTADO | VARCHAR2(2) | | Estado/UF da clínica. |
| NR_CEP | VARCHAR2(8) | | CEP da clínica. |
| DS_STATUS | VARCHAR2(20) | | Status do cadastro, como ativo ou inativo. |
| DT_CADASTRO | DATE | DEFAULT SYSDATE | Data de cadastro da clínica na plataforma. |
| DS_TIPO_ESTABELECIMENTO | VARCHAR2(40) | | Tipo do estabelecimento, como clínica veterinária, hospital veterinário, laboratório, centro diagnóstico ou atendimento domiciliar. |
| DS_ESPECIALIDADE_PRINCIPAL | VARCHAR2(80) | | Especialidade principal do estabelecimento, como clínica geral, dermatologia, cardiologia, ortopedia ou oncologia. |
| ST_ATENDIMENTO_24H | CHAR(1) | CHECK (S/N) | Indica se o estabelecimento possui atendimento 24 horas. |
| ST_ATENDE_EMERGENCIA | CHAR(1) | CHECK (S/N) | Indica se o estabelecimento realiza atendimentos de emergência. |

---

## RELACIONAMENTOS

TB_CLINICA N → N TB_VETERINARIO  
Esse relacionamento será feito pela tabela associativa TB_VINCULO_CLINICA_VET.

TB_CLINICA 1 → N TB_CONSULTA

Uma clínica pode registrar várias consultas.

---

## REGRAS DE NEGÓCIO

- Uma clínica pode possuir vários veterinários vinculados.
- Um veterinário pode atuar em mais de uma clínica.
- Uma consulta pode estar vinculada a uma clínica ou não, caso seja realizada por veterinário autônomo.
- A clínica poderá consultar estatísticas sobre atendimentos, tratamentos, retornos, pets acompanhados e alertas gerados.