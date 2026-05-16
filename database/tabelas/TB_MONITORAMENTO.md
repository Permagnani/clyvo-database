# TB_MONITORAMENTO

## OBJETIVO
Armazenar os registros contínuos de monitoramento da saúde e comportamento do pet, permitindo identificar padrões de risco, alterações clínicas e evolução ao longo do tempo.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_MONITORAMENTO | NUMBER | PK | Identificador único do monitoramento. |
| ID_PET | NUMBER | FK | Identificador do pet monitorado. |
| DT_MONITORAMENTO | DATE | NOT NULL | Data e horário do registro de monitoramento. |
| NR_TEMPERATURA | NUMBER(4,2) | | Temperatura corporal registrada. |
| NR_BATIMENTOS | NUMBER | | Quantidade de batimentos cardíacos registrados. |
| DS_ATIVIDADE | VARCHAR2(30) | | Nível de atividade do pet, como alta, moderada ou baixa. |
| DS_APETITE | VARCHAR2(30) | | Situação do apetite do pet. |
| DS_HIDRATACAO | VARCHAR2(30) | | Situação da hidratação observada. |
| DS_HUMOR | VARCHAR2(30) | | Estado comportamental do pet, como calmo, agitado ou apático. |
| DS_SONO | VARCHAR2(30) | | Qualidade ou padrão de sono observado. |
| DS_OBSERVACAO | VARCHAR2(500) | | Observações adicionais do responsável ou veterinário. |
| DS_ORIGEM_DADO | VARCHAR2(20) | | Origem do dado, como MANUAL, IOT ou CLINICA. |
| DS_STATUS_RISCO | VARCHAR2(20) | | Classificação momentânea de risco identificada pelo sistema. |

---

## RELACIONAMENTOS

TB_PET 1 → N TB_MONITORAMENTO

Um pet pode possuir vários registros de monitoramento ao longo do tempo.

---

## REGRAS DE NEGÓCIO

- O monitoramento deve estar vinculado a um pet.
- Os dados podem ser enviados manualmente, por dispositivos IoT ou pela clínica.
- Alterações frequentes nos registros podem gerar alertas preventivos.
- Os registros podem ser utilizados no cálculo de score de risco do pet.
- O histórico de monitoramento compõe a linha do tempo clínica do animal.