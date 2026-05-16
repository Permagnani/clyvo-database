# TB_EXAME

## OBJETIVO
Armazenar os exames solicitados ou realizados durante a jornada clínica do pet.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_EXAME | NUMBER | PK | Identificador único do exame. |
| ID_CONSULTA | NUMBER | FK | Identificador da consulta relacionada ao exame. |
| NM_EXAME | VARCHAR2(100) | NOT NULL | Nome do exame realizado ou solicitado. |
| DS_TIPO_EXAME | VARCHAR2(80) | | Tipo do exame, como sangue, imagem, urina, fezes, cardiológico ou dermatológico. |
| DT_SOLICITACAO | DATE | | Data em que o exame foi solicitado. |
| DT_REALIZACAO | DATE | | Data em que o exame foi realizado. |
| DS_RESULTADO | VARCHAR2(500) | | Resultado resumido do exame. |
| DS_CRITICIDADE | VARCHAR2(20) | | Nível de criticidade do resultado, como normal, atenção ou crítico. |
| DS_STATUS | VARCHAR2(20) | | Status do exame, como solicitado, realizado, cancelado ou pendente. |

---

## RELACIONAMENTOS

TB_CONSULTA 1 → N TB_EXAME

Uma consulta pode gerar vários exames.

---

## REGRAS DE NEGÓCIO

- Um exame deve estar vinculado a uma consulta.
- Uma consulta pode ter nenhum, um ou vários exames.
- O resultado do exame pode influenciar o score de risco do pet.
- Exames pendentes ou críticos podem gerar alertas preventivos.