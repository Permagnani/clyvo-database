# TB_RESPONSAVEL

## OBJETIVO
Armazenar os dados do responsável/tutor do pet.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_RESPONSAVEL | NUMBER | PK | Identificador único do responsável. |
| NM_RESPONSAVEL | VARCHAR2(100) | NOT NULL | Nome completo do responsável. |
| DS_TIPO_DOCUMENTO | VARCHAR2(10) | NOT NULL | Tipo do documento do responsável: CPF ou CNPJ. |
| NR_DOCUMENTO | VARCHAR2(14) | UNIQUE NOT NULL | Número do documento do responsável. |
| DT_NASCIMENTO | DATE | | Data de nascimento do responsável. |
| DS_EMAIL | VARCHAR2(150) | UNIQUE | E-mail de contato do responsável. |
| NR_TELEFONE | VARCHAR2(15) | NOT NULL | Telefone principal de contato. |
| DS_TIPO_RESPONSAVEL | VARCHAR2(30) | NOT NULL | Tipo do responsável, como tutor, ONG ou abrigo. |
| DS_PREFERENCIA_CONTATO | VARCHAR2(20) | | Canal preferido para contato, como WhatsApp, telefone ou e-mail. |
| ST_RECEBE_NOTIFICACAO | CHAR(1) | CHECK (S/N) | Indica se o responsável aceita receber notificações. |
| ST_AUTORIZACAO_MONITORAMENTO | CHAR(1) | CHECK (S/N) | Indica se o responsável autoriza o monitoramento contínuo do pet. |
| DS_LOGRADOURO | VARCHAR2(100) | | Rua, avenida ou logradouro do endereço. |
| NR_ENDERECO | VARCHAR2(10) | | Número do endereço. |
| DS_BAIRRO | VARCHAR2(60) | | Bairro do responsável. |
| DS_CIDADE | VARCHAR2(60) | | Cidade do responsável. |
| DS_ESTADO | VARCHAR2(2) | | Estado/UF do responsável. |
| NR_CEP | VARCHAR2(8) | | CEP do endereço. |
| DS_STATUS | VARCHAR2(20) | | Status do cadastro, como ativo ou inativo. |
| DT_CADASTRO | DATE | DEFAULT SYSDATE | Data de cadastro do responsável na plataforma. |
| DT_ULTIMO_ACESSO | DATE | | Data do último acesso do responsável. |

---

## RELACIONAMENTOS

TB_RESPONSAVEL 1 → N TB_PET

Um responsável pode possuir vários pets cadastrados, mas cada pet deve estar vinculado a um responsável principal.

---

## REGRAS DE NEGÓCIO

- Um responsável pode possuir vários pets.
- O responsável pode autorizar o monitoramento contínuo dos pets.
- O responsável pode receber notificações preventivas.
- A tabela não armazena dados dos pets, consultas, exames, tratamentos ou monitoramentos.
- Dados relacionados ao animal devem ser armazenados em tabelas específicas.