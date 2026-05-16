# TB_PET_VACINA

## OBJETIVO
Registrar as vacinas aplicadas em cada pet, permitindo controlar o histórico de vacinação, próximas doses, reforços e atrasos.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_PET_VACINA | NUMBER | PK | Identificador único do registro de vacinação do pet. |
| ID_PET | NUMBER | FK | Identificador do pet vacinado. |
| ID_VACINA | NUMBER | FK | Identificador da vacina aplicada. |
| ID_CONSULTA | NUMBER | FK / NULL | Consulta associada à aplicação da vacina, quando existir. |
| DT_APLICACAO | DATE | NOT NULL | Data em que a vacina foi aplicada. |
| DT_PROXIMA_DOSE | DATE | | Data prevista para próxima dose ou reforço. |
| NR_DOSE | NUMBER | | Número da dose aplicada. |
| DS_LOTE | VARCHAR2(50) | | Lote da vacina aplicada. |
| DS_LOCAL_APLICACAO | VARCHAR2(100) | | Local onde a vacina foi aplicada, como clínica, domicílio ou fazenda. |
| DS_STATUS | VARCHAR2(20) | | Status da vacinação, como aplicada, pendente, atrasada ou cancelada. |

---

## RELACIONAMENTOS

TB_PET 1 → N TB_PET_VACINA

TB_VACINA 1 → N TB_PET_VACINA

TB_CONSULTA 1 → N TB_PET_VACINA

Um pet pode possuir várias vacinas registradas ao longo da vida.

---

## REGRAS DE NEGÓCIO

- Toda aplicação de vacina deve estar vinculada a um pet.
- Toda aplicação deve estar vinculada a uma vacina cadastrada.
- A vacina pode ou não estar associada a uma consulta.
- A data da próxima dose pode ser usada para gerar alertas preventivos.
- Vacinas atrasadas podem impactar o score de risco do pet.