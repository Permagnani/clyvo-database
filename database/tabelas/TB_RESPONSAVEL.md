# TB_RESPONSAVEL

## OBJETIVO
Armazenar os dados do responsável vinculado ao pet.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_RESPONSAVEL | NUMBER | PK | Identificador único do responsável. |
| NM_RESPONSAVEL | VARCHAR2(100) | NOT NULL | Nome do responsável pelo pet. |
| DS_TIPO_DOCUMENTO | VARCHAR2(10) | NOT NULL | Tipo do documento, como CPF ou CNPJ. |
| NR_DOCUMENTO | VARCHAR2(20) | UNIQUE | Número do documento do responsável. |
| NR_TELEFONE | VARCHAR2(20) | | Telefone de contato do responsável. |
| DS_EMAIL | VARCHAR2(100) | | E-mail do responsável. |
| DS_ENDERECO | VARCHAR2(200) | | Endereço do responsável. |
| DS_PREFERENCIA_CONTATO | VARCHAR2(30) | | Canal preferido de contato. |
| ST_RECEBE_NOTIFICACAO | CHAR(1) | CHECK (S/N) | Indica se aceita receber notificações. |
| DT_CADASTRO | DATE | DEFAULT SYSDATE | Data de cadastro do responsável. |

---

## RELACIONAMENTOS

TB_RESPONSAVEL 1 → N TB_PET

Um responsável pode possuir vários pets cadastrados, mas cada pet deve estar vinculado a um responsável principal.

---

## REGRAS DE NEGÓCIO

- Um responsável pode possuir vários pets.
- O responsável pode ser pessoa física ou pessoa jurídica.
- O tipo de documento indica se o cadastro utiliza CPF ou CNPJ.
