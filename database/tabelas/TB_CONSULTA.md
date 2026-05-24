# TB_CONSULTA

## OBJETIVO
Armazenar os atendimentos veterinários realizados para os pets, registrando sintomas, diagnóstico, observações e o profissional responsável pelo atendimento.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_CONSULTA | NUMBER | PK | Identificador único da consulta. |
| ID_PET | NUMBER | FK | Identificador do pet atendido. |
| ID_VETERINARIO | NUMBER | FK | Identificador do veterinário responsável pela consulta. |
| ID_CLINICA | NUMBER | FK / NULL | Identificador da clínica onde a consulta ocorreu, quando aplicável. |
| DT_CONSULTA | DATE | NOT NULL | Data em que a consulta foi realizada. |
| DS_TIPO_CONSULTA | VARCHAR2(40) | NOT NULL | Tipo da consulta, como rotina, emergência, retorno, vacinação, avaliação, teleconsulta ou acompanhamento. |
| DS_SINTOMAS | VARCHAR2(500) | | Sintomas relatados pelo responsável ou observados pelo veterinário. |
| DS_DIAGNOSTICO | VARCHAR2(500) | | Diagnóstico informado pelo veterinário. |
| DS_OBSERVACOES | VARCHAR2(500) | | Observações gerais da consulta. |
| DT_RETORNO_PREVISTO | DATE | | Data prevista para retorno, caso necessário. |
| DS_STATUS | VARCHAR2(20) | | Status da consulta, como realizada, cancelada ou pendente. |

---

## RELACIONAMENTOS

TB_PET 1 → N TB_CONSULTA

TB_VETERINARIO 1 → N TB_CONSULTA

TB_CLINICA 1 → N TB_CONSULTA

Uma consulta sempre pertence a um pet e a um veterinário. A clínica pode ser opcional, pois o atendimento pode ser feito por veterinário autônomo.

---

## REGRAS DE NEGÓCIO

- Toda consulta deve estar vinculada a um pet.
- Toda consulta deve ter um veterinário responsável.
- A clínica pode ser nula quando o atendimento for autônomo, domiciliar ou remoto.
- A consulta pode gerar tratamentos, alertas e retornos clínicos.
- A data de retorno previsto ajuda no monitoramento da continuidade do cuidado.