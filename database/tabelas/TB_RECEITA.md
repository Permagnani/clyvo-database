# TB_RECEITA

## OBJETIVO
Registrar receitas e prescrições emitidas por veterinários durante consultas, armazenando orientações formais sobre medicamentos, doses e uso.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_RECEITA | NUMBER | PK | Identificador único da receita. |
| ID_CONSULTA | NUMBER | FK | Consulta que originou a receita. |
| ID_PET | NUMBER | FK | Pet relacionado à receita. |
| ID_VETERINARIO | NUMBER | FK | Veterinário que emitiu a receita. |
| DT_EMISSAO | DATE | NOT NULL | Data de emissão da receita. |
| DS_MEDICAMENTO | VARCHAR2(100) | NOT NULL | Nome do medicamento prescrito. |
| DS_DOSAGEM | VARCHAR2(50) | | Dosagem indicada pelo veterinário. |
| DS_FREQUENCIA | VARCHAR2(50) | | Frequência de uso do medicamento. |
| DS_DURACAO | VARCHAR2(50) | | Duração recomendada do uso. |
| DS_ORIENTACOES | VARCHAR2(500) | | Orientações adicionais da prescrição. |
| DS_STATUS | VARCHAR2(20) | | Status da receita, como ativa, finalizada ou cancelada. |

---

## RELACIONAMENTOS

TB_CONSULTA 1 → N TB_RECEITA

TB_PET 1 → N TB_RECEITA

TB_VETERINARIO 1 → N TB_RECEITA

---

## REGRAS DE NEGÓCIO

- Toda receita deve estar vinculada a uma consulta.
- Toda receita deve estar vinculada a um pet e a um veterinário.
- Uma consulta pode gerar uma ou várias receitas.
- A receita representa a prescrição formal, enquanto o tratamento representa o acompanhamento da execução.