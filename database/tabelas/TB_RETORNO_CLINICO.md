# TB_RETORNO_CLINICO

## OBJETIVO
Registrar os retornos clínicos previstos ou realizados após consultas e tratamentos, permitindo acompanhar a continuidade do cuidado e verificar a evolução do pet.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_RETORNO_CLINICO | NUMBER | PK | Identificador único do retorno clínico. |
| ID_PET | NUMBER | FK | Identificador do pet relacionado ao retorno. |
| ID_CONSULTA | NUMBER | FK | Consulta que originou a necessidade de retorno. |
| ID_TRATAMENTO | NUMBER | FK / NULL | Tratamento relacionado ao retorno, quando aplicável. |
| ID_VETERINARIO | NUMBER | FK / NULL | Veterinário responsável pelo retorno, quando aplicável. |
| DT_RETORNO_PREVISTO | DATE | NOT NULL | Data prevista para o retorno clínico. |
| DT_RETORNO_REALIZADO | DATE | | Data em que o retorno foi realizado. |
| DS_STATUS_RETORNO | VARCHAR2(20) | | Status do retorno, como pendente, realizado, atrasado ou cancelado. |
| DS_RESULTADO_RETORNO | VARCHAR2(500) | | Resultado observado no retorno clínico. |
| DS_EVOLUCAO_PET | VARCHAR2(100) | | Evolução do pet, como melhorou, estável ou piorou. |

---

## RELACIONAMENTOS

TB_PET 1 → N TB_RETORNO_CLINICO

TB_CONSULTA 1 → N TB_RETORNO_CLINICO

TB_TRATAMENTO 1 → N TB_RETORNO_CLINICO

TB_VETERINARIO 1 → N TB_RETORNO_CLINICO

---

## REGRAS DE NEGÓCIO

- O retorno clínico deve estar vinculado a um pet.
- Um retorno pode estar vinculado a uma consulta e, opcionalmente, a um tratamento.
- Retornos atrasados podem gerar alertas preventivos.
- O retorno permite verificar se o tratamento foi eficaz.
- A ausência de retorno pode indicar abandono do acompanhamento.