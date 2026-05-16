# TB_MIDIA_PET

## OBJETIVO
Armazenar referências de fotos, vídeos ou arquivos de mídia relacionados ao pet, permitindo acompanhar evolução clínica, feridas, sintomas visuais e registros enviados pelo responsável ou pela clínica.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_MIDIA_PET | NUMBER | PK | Identificador único da mídia. |
| ID_PET | NUMBER | FK | Pet relacionado à mídia. |
| ID_CONSULTA | NUMBER | FK / NULL | Consulta relacionada à mídia, quando aplicável. |
| ID_TRATAMENTO | NUMBER | FK / NULL | Tratamento relacionado à mídia, quando aplicável. |
| ID_ACOMPANHAMENTO | NUMBER | FK / NULL | Acompanhamento relacionado à mídia, quando aplicável. |
| DT_ENVIO | DATE | NOT NULL | Data e horário do envio da mídia. |
| DS_TIPO_MIDIA | VARCHAR2(20) | NOT NULL | Tipo da mídia, como foto, vídeo ou documento visual. |
| DS_URL_MIDIA | VARCHAR2(500) | NOT NULL | URL ou caminho onde a mídia está armazenada. |
| DS_DESCRICAO | VARCHAR2(300) | | Descrição do conteúdo da mídia. |
| DS_ORIGEM_ENVIO | VARCHAR2(30) | | Origem do envio, como responsável, veterinário ou clínica. |
| DS_STATUS | VARCHAR2(20) | | Status da mídia, como enviada, analisada ou descartada. |

---

## RELACIONAMENTOS

TB_PET 1 → N TB_MIDIA_PET

TB_CONSULTA 1 → N TB_MIDIA_PET

TB_TRATAMENTO 1 → N TB_MIDIA_PET

TB_ACOMPANHAMENTO_TRATAMENTO 1 → N TB_MIDIA_PET

---

## REGRAS DE NEGÓCIO

- Toda mídia deve estar vinculada a um pet.
- A mídia pode estar vinculada a uma consulta, tratamento ou acompanhamento.
- Fotos e vídeos devem ser armazenados fora do banco de dados, mantendo apenas a URL ou caminho no Oracle.
- A mídia pode ser usada para acompanhar evolução de feridas, sintomas visuais ou resposta ao tratamento.