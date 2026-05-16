# TB_ALERTA

## OBJETIVO
Armazenar os alertas preventivos, clínicos e comportamentais gerados pela plataforma com base nos dados de monitoramento, exames, tratamentos, acompanhamento e vacinação do pet.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_ALERTA | NUMBER | PK | Identificador único do alerta. |
| ID_PET | NUMBER | FK | Identificador do pet relacionado ao alerta. |
| ID_MONITORAMENTO | NUMBER | FK / NULL | Monitoramento que originou o alerta, quando aplicável. |
| ID_TRATAMENTO | NUMBER | FK / NULL | Tratamento relacionado ao alerta, quando aplicável. |
| ID_ACOMPANHAMENTO | NUMBER | FK / NULL | Acompanhamento de tratamento relacionado ao alerta, quando aplicável. |
| ID_EXAME | NUMBER | FK / NULL | Exame relacionado ao alerta, quando aplicável. |
| ID_PET_VACINA | NUMBER | FK / NULL | Vacinação relacionada ao alerta, quando aplicável. |
| DT_ALERTA | DATE | NOT NULL | Data e horário da geração do alerta. |
| DS_TIPO_ALERTA | VARCHAR2(50) | NOT NULL | Tipo do alerta, como temperatura elevada, baixa atividade, medicação não confirmada, retorno não realizado ou vacina atrasada. |
| DS_NIVEL_RISCO | VARCHAR2(20) | | Nível de risco identificado, como baixo, moderado, alto ou crítico. |
| DS_DESCRICAO | VARCHAR2(500) | | Descrição detalhada do alerta gerado. |
| DS_STATUS | VARCHAR2(20) | | Status do alerta, como ativo, resolvido, ignorado ou em análise. |
| ST_NOTIFICADO | CHAR(1) | CHECK (S/N) | Indica se o responsável ou veterinário foi notificado. |

---

## RELACIONAMENTOS

TB_PET 1 → N TB_ALERTA

TB_MONITORAMENTO 1 → N TB_ALERTA

TB_TRATAMENTO 1 → N TB_ALERTA

TB_ACOMPANHAMENTO_TRATAMENTO 1 → N TB_ALERTA

TB_EXAME 1 → N TB_ALERTA

TB_PET_VACINA 1 → N TB_ALERTA

Um pet pode possuir vários alertas ao longo do tempo.

---

## REGRAS DE NEGÓCIO

- O alerta deve estar vinculado a um pet.
- Um alerta pode ser gerado por monitoramento, exame, tratamento, acompanhamento de tratamento ou vacinação.
- Alterações críticas podem gerar alertas automáticos.
- Falta de confirmação de medicação, ausência de retorno, vacina atrasada ou exame pendente podem gerar alertas preventivos.
- O sistema pode enviar notificações ao responsável ou veterinário com base no alerta gerado.