# TB_PET

## OBJETIVO
Armazenar os dados principais do animal acompanhado pela plataforma.

A tabela representa o paciente veterinário e será usada como base para consultas, exames, tratamentos, monitoramentos, alertas e cálculo de score de risco.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_PET | NUMBER | PK | Identificador único do pet. |
| NM_PET | VARCHAR2(80) | NOT NULL | Nome do pet. |
| DS_ESPECIE | VARCHAR2(50) | NOT NULL | Espécie do animal, como cachorro, gato, ave etc. |
| DS_RACA | VARCHAR2(80) | | Raça do pet. |
| DT_NASCIMENTO | DATE | | Data de nascimento do pet. |
| NR_PESO | NUMBER(5,2) | | Peso atual do pet em quilogramas. |
| NR_ALTURA | NUMBER(5,2) | | Altura do pet em centímetros. |
| DS_SEXO | CHAR(1) | CHECK (M/F) | Sexo do pet: M para macho e F para fêmea. |
| DS_PORTE | VARCHAR2(20) | | Porte do pet, como pequeno, médio ou grande. |
| DS_ALERGIAS | VARCHAR2(300) | | Alergias conhecidas do pet, como medicamentos, alimentos ou vacinas. |
| DS_STATUS_SAUDE | VARCHAR2(30) | | Situação geral de saúde do pet. |
| ST_CASTRADO | CHAR(1) | CHECK (S/N) | Indica se o pet é castrado: S para sim e N para não. |
| DS_COR_PELAGEM | VARCHAR2(50) | | Cor predominante da pelagem do pet. |
| DS_MICROCHIP | VARCHAR2(50) | UNIQUE | Código do microchip de identificação, caso exista. |
| DT_CADASTRO | DATE | DEFAULT SYSDATE | Data em que o pet foi cadastrado na plataforma. |
| ID_RESPONSAVEL | NUMBER | FK | Identificador do responsável vinculado ao pet. |

---

## RELACIONAMENTO

TB_RESPONSAVEL 1 → N TB_PET

Um responsável pode ter vários pets cadastrados, mas cada pet pertence a um responsável principal.

---

## REGRAS DE NEGÓCIO

- Todo pet deve estar vinculado a um responsável.
- Um responsável pode possuir mais de um pet.
- A tabela não armazena consultas, exames, tratamentos, monitoramentos ou alertas.
- Dados clínicos e históricos devem ficar em tabelas específicas.
- Peso e altura ajudam em análises futuras de saúde, porte, obesidade e risco.

---

## OBSERVAÇÕES

A TB_PET é uma das tabelas centrais do sistema, pois conecta o animal ao restante da jornada de cuidado veterinário.