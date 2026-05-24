# TB_VETERINARIO

## OBJETIVO
Armazenar os dados dos veterinários que realizam atendimentos aos pets, podendo atuar como autônomos, vinculados a clínicas ou em modelo híbrido.

---

## CAMPOS

| CAMPO | TIPO | REGRA | DESCRIÇÃO |
|---|---|---|---|
| ID_VETERINARIO | NUMBER | PK | Identificador único do veterinário. |
| NM_VETERINARIO | VARCHAR2(100) | NOT NULL | Nome completo do veterinário. |
| NR_CRMV | VARCHAR2(20) | UNIQUE NOT NULL | Registro profissional do veterinário. |
| DS_ESPECIALIDADE | VARCHAR2(80) | | Especialidade do veterinário, como clínica geral, cardiologia ou dermatologia. |
| DS_TIPO_ATUACAO | VARCHAR2(20) | NOT NULL | Tipo de atuação: AUTONOMO, CLINICA ou HIBRIDO. |
| DS_EMAIL | VARCHAR2(150) | UNIQUE | E-mail de contato do veterinário. |
| NR_TELEFONE | VARCHAR2(15) | | Telefone de contato do veterinário. |
| DS_STATUS | VARCHAR2(20) | | Status do cadastro, como ativo ou inativo. |
| DT_CADASTRO | DATE | DEFAULT SYSDATE | Data de cadastro do veterinário na plataforma. |


---

## RELACIONAMENTOS

TB_VETERINARIO N → N TB_CLINICA  
Esse relacionamento será feito pela tabela associativa TB_VINCULO_CLINICA_VET.

TB_VETERINARIO 1 → N TB_CONSULTA

Um veterinário pode realizar várias consultas.

---

## REGRAS DE NEGÓCIO

- Um veterinário pode atuar de forma autônoma, em uma clínica ou em mais de uma clínica.
- O veterinário não precisa obrigatoriamente estar vinculado a uma clínica.
- O vínculo com clínicas será controlado por uma tabela própria.
- O veterinário poderá ser responsável por consultas, tratamentos e retornos clínicos.