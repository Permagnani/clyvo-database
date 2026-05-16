# TB_ACOMPANHAMENTO_TRATAMENTO

## OBJETIVO
Armazenar os acompanhamentos realizados durante um tratamento, permitindo monitorar adesão, evolução clínica, envio de imagens e cumprimento das orientações veterinárias.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_ACOMPANHAMENTO | NUMBER | PK | Identificador único do acompanhamento do tratamento. |
| ID_TRATAMENTO | NUMBER | FK | Identificador do tratamento relacionado. |
| DT_REGISTRO | DATE | NOT NULL | Data do registro do acompanhamento. |
| ST_MEDICACAO_REALIZADA | CHAR(1) | CHECK (S/N) | Indica se a medicação foi administrada corretamente. |
| DS_OBSERVACAO | VARCHAR2(500) | | Observações registradas pelo responsável ou veterinário. |
| DS_EVOLUCAO | VARCHAR2(200) | | Evolução observada no pet durante o tratamento. |
| NR_TEMPERATURA | NUMBER(4,2) | | Temperatura corporal registrada durante o acompanhamento. |
| ST_ENVIO_FOTO | CHAR(1) | CHECK (S/N) | Indica se houve envio de imagem para acompanhamento clínico. |
| DS_URL_FOTO | VARCHAR2(500) | | URL da imagem enviada para análise e histórico clínico. |
| ST_RETORNO_REALIZADO | CHAR(1) | CHECK (S/N) | Indica se o retorno veterinário previsto foi realizado. |
| DS_STATUS_PET | VARCHAR2(30) | | Situação observada do pet, como melhorando, estável ou piorando. |
| NR_TAMANHO_LESAO_CM | NUMBER(5,2) | | Tamanho aproximado da lesão observada em centímetros. |
| DS_ASPECTO_LESAO | VARCHAR2(100) | | Aspecto visual da lesão, como vermelha, escura, inchada, com secreção ou ferida aberta. |

---

## RELACIONAMENTOS

TB_TRATAMENTO 1 → N TB_ACOMPANHAMENTO_TRATAMENTO

Um tratamento pode possuir vários registros de acompanhamento ao longo do tempo.

---

## REGRAS DE NEGÓCIO

- O acompanhamento deve estar vinculado a um tratamento.
- Um tratamento pode possuir vários acompanhamentos.
- O responsável pode registrar informações de evolução do pet durante o tratamento.
- O sistema pode utilizar os registros para calcular adesão ao tratamento.
- A ausência de registros pode gerar alertas preventivos.
- Imagens devem ser armazenadas externamente, mantendo apenas a URL no banco de dados.