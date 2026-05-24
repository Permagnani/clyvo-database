# TB_CLINICA

## OBJETIVO
Armazenar os dados das clínicas, hospitais veterinários ou instituições que realizam atendimentos aos pets dentro da plataforma.

---

## CAMPOS

| ID_CLINICA | NUMBER | PK | Identificador único da clínica. |
| NM_CLINICA | VARCHAR2(100) | NOT NULL | Nome da clínica veterinária. |
| NR_CNPJ | VARCHAR2(20) | UNIQUE | CNPJ da clínica. |
| DS_EMAIL | VARCHAR2(100) | UNIQUE | E-mail de contato da clínica. |
| NR_TELEFONE | VARCHAR2(20) | | Telefone da clínica. |
| DS_LOGRADOURO | VARCHAR2(200) | | Endereço completo da clínica. |
| DS_BAIRRO | VARCHAR2(60) | | Bairro da clínica. |
| DS_CIDADE | VARCHAR2(60) | | Cidade da clínica. |
| DS_ESTADO | VARCHAR2(2) | | Estado/UF da clínica. |
| NR_CEP | VARCHAR2(10) | | CEP da clínica. |
| DS_TIPO_ESTABELECIMENTO | VARCHAR2(40) | | Tipo do estabelecimento veterinário. |
| DS_ESPECIALIDADE_PRINCIPAL | VARCHAR2(80) | | Especialidade principal da clínica. |
| ST_ATENDIMENTO_24H | CHAR(1) | CHECK (S/N) | Indica atendimento 24 horas. |
| ST_ATENDE_EMERGENCIA | CHAR(1) | CHECK (S/N) | Indica atendimento emergencial. |
| DS_STATUS | VARCHAR2(20) | | Status do cadastro. |
| DT_CADASTRO | DATE | DEFAULT SYSDATE | Data de cadastro da clínica. |

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
- A clínica poderá registrar consultas, tratamentos e acompanhar os pets atendidos na plataforma.