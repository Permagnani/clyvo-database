# TB_VINCULO_CLINICA_VET

## OBJETIVO
Armazenar o vínculo entre veterinários e clínicas, permitindo representar profissionais vinculados a uma ou mais clínicas e vínculos ativos ou encerrados.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_VINCULO_CLINICA_VET | NUMBER | PK | Identificador único do vínculo entre clínica e veterinário. |
| ID_VETERINARIO | NUMBER | FK | Identificador do veterinário vinculado. |
| ID_CLINICA | NUMBER | FK | Identificador da clínica vinculada. |
| DT_INICIO_VINCULO | DATE | | Data de início do vínculo entre o veterinário e a clínica. |
| DT_FIM_VINCULO | DATE | | Data de encerramento do vínculo, caso exista. |
| DS_TIPO_VINCULO | VARCHAR2(30) | | Tipo de vínculo, como funcionário, prestador, plantonista ou parceiro. |
| DS_STATUS | VARCHAR2(20) | | Status do vínculo, como ativo ou inativo. |

---

## RELACIONAMENTOS

TB_VETERINARIO 1 → N TB_VINCULO_CLINICA_VET

TB_CLINICA 1 → N TB_VINCULO_CLINICA_VET

A tabela TB_VINCULO_CLINICA_VET resolve o relacionamento N → N entre TB_VETERINARIO e TB_CLINICA.

---

## REGRAS DE NEGÓCIO

- Um veterinário pode estar vinculado a nenhuma, uma ou várias clínicas.
- Uma clínica pode possuir vários veterinários vinculados.
- O vínculo pode ser ativo ou encerrado.
- Veterinários autônomos podem existir sem registro nessa tabela.
- A data de fim só deve ser preenchida quando o vínculo for encerrado.