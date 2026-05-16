# TB_DOCUMENTO

## OBJETIVO
Armazenar referências de documentos relacionados ao pet, consultas, exames ou tratamentos, como PDFs, laudos, exames externos, contratos, atestados e arquivos enviados pela clínica ou responsável.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_DOCUMENTO | NUMBER | PK | Identificador único do documento. |
| ID_PET | NUMBER | FK | Pet relacionado ao documento. |
| ID_CONSULTA | NUMBER | FK / NULL | Consulta relacionada ao documento, quando aplicável. |
| ID_EXAME | NUMBER | FK / NULL | Exame relacionado ao documento, quando aplicável. |
| ID_TRATAMENTO | NUMBER | FK / NULL | Tratamento relacionado ao documento, quando aplicável. |
| DT_ENVIO | DATE | NOT NULL | Data e horário em que o documento foi enviado ou registrado. |
| DS_TIPO_DOCUMENTO | VARCHAR2(40) | NOT NULL | Tipo do documento, como laudo, exame externo, contrato, atestado ou receita digitalizada. |
| NM_ARQUIVO | VARCHAR2(150) | | Nome original do arquivo. |
| DS_URL_DOCUMENTO | VARCHAR2(500) | NOT NULL | URL ou caminho onde o documento está armazenado. |
| DS_DESCRICAO | VARCHAR2(300) | | Descrição resumida do conteúdo do documento. |
| DS_ORIGEM_ENVIO | VARCHAR2(30) | | Origem do envio, como responsável, veterinário, clínica ou laboratório. |
| DS_STATUS | VARCHAR2(20) | | Status do documento, como enviado, analisado, validado ou descartado. |

---

## RELACIONAMENTOS

TB_PET 1 → N TB_DOCUMENTO

TB_CONSULTA 1 → N TB_DOCUMENTO

TB_EXAME 1 → N TB_DOCUMENTO

TB_TRATAMENTO 1 → N TB_DOCUMENTO

---

## REGRAS DE NEGÓCIO

- Todo documento deve estar vinculado a um pet.
- O documento pode estar vinculado a uma consulta, exame ou tratamento.
- O arquivo deve ser armazenado fora do banco de dados, mantendo apenas a URL ou caminho no Oracle.
- Documentos podem representar laudos, exames externos, contratos, atestados ou arquivos clínicos relevantes.
- Documentos validados podem auxiliar o veterinário na análise do histórico clínico do pet.