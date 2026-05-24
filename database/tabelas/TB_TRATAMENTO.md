# TB_TRATAMENTO

## OBJETIVO
Armazenar os tratamentos prescritos para os pets, permitindo acompanhar medicações, frequência, período de tratamento e evolução clínica.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_TRATAMENTO | NUMBER | PK | Identificador único do tratamento. |
| ID_PET | NUMBER | FK | Identificador do pet em tratamento. |
| ID_CONSULTA | NUMBER | FK | Identificador da consulta que originou o tratamento. |
| ID_VETERINARIO | NUMBER | FK | Identificador do veterinário responsável pelo tratamento. |
| DS_MEDICAMENTO | VARCHAR2(100) | | Nome do medicamento indicado. |
| DS_DOSAGEM | VARCHAR2(50) | | Dosagem recomendada do medicamento. |
| DS_FREQUENCIA | VARCHAR2(50) | | Frequência de uso, como a cada 8 horas, 12 horas ou 24 horas. |
| DT_INICIO | DATE | NOT NULL | Data de início do tratamento. |
| DT_FIM | DATE | | Data prevista ou real de término do tratamento. |
| DS_ORIENTACOES | VARCHAR2(500) | | Orientações do veterinário para o responsável. |
| DS_STATUS | VARCHAR2(20) | | Status do tratamento, como ativo, concluído, suspenso ou abandonado. |
| NR_ADESAO | NUMBER(5,2) | | Percentual de adesão do responsável ao tratamento. |
| DS_EVOLUCAO | VARCHAR2(500) | | Evolução geral observada durante o tratamento. |

---

## RELACIONAMENTOS

TB_PET 1 → N TB_TRATAMENTO

TB_CONSULTA 1 → N TB_TRATAMENTO

TB_VETERINARIO 1 → N TB_TRATAMENTO

---

## REGRAS DE NEGÓCIO

- Um pet pode possuir vários tratamentos ao longo da vida.
- Um tratamento deve estar vinculado a uma consulta.
- O tratamento pode conter medicação, orientações clínicas ou acompanhamento sem medicamento.
- O tratamento pode registrar informações relacionadas à adesão e evolução clínica do pet.
- Tratamentos podem estar relacionados à geração de alertas clínicos e preventivos.