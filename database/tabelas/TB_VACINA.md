# TB_VACINA

## OBJETIVO
Armazenar os tipos de vacinas disponíveis na plataforma para diferentes espécies de pets.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_VACINA | NUMBER | PK | Identificador único da vacina. |
| NM_VACINA | VARCHAR2(100) | NOT NULL | Nome da vacina. |
| DS_ESPECIE_INDICADA | VARCHAR2(50) | NOT NULL | Espécie indicada para aplicação da vacina. |
| DS_DESCRICAO | VARCHAR2(300) | | Descrição e finalidade da vacina. |
| NR_INTERVALO_REFORCO_MESES | NUMBER | | Quantidade de meses recomendada para reforço da vacina. |
| DS_STATUS | VARCHAR2(20) | | Status da vacina, como ativa ou inativa. |

---

## RELACIONAMENTOS

TB_VACINA 1 → N TB_PET_VACINA

Uma vacina pode ser aplicada em vários pets.

---

## REGRAS DE NEGÓCIO

- Uma vacina pode ser utilizada em diferentes pets da mesma espécie.
- A vacina pode possuir reforços periódicos.
- O intervalo de reforço poderá ser utilizado para gerar alertas preventivos.
- A tabela armazena apenas os tipos de vacina disponíveis, não as aplicações realizadas.