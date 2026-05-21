CREATE TABLE TB_LOG_ERRO (
    ID_LOG_ERRO NUMBER PRIMARY KEY,
    NM_PROCEDURE VARCHAR2(100),
    NM_USUARIO VARCHAR2(100),
    DT_ERRO DATE DEFAULT SYSDATE,
    CD_ERRO NUMBER,
    DS_MENSAGEM_ERRO VARCHAR2(500)
);

CREATE SEQUENCE SQ_LOG_ERRO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE PR_INSERIR_RESPONSAVEL (
    P_ID_RESPONSAVEL IN NUMBER,
    P_NM_RESPONSAVEL IN VARCHAR2,
    P_DS_TIPO_DOCUMENTO IN VARCHAR2,
    P_NR_DOCUMENTO IN VARCHAR2,
    P_NR_TELEFONE IN VARCHAR2,
    P_DS_EMAIL IN VARCHAR2,
    P_DS_ENDERECO IN VARCHAR2,
    P_DS_PREFERENCIA_CONTATO IN VARCHAR2,
    P_ST_RECEBE_NOTIFICACAO IN CHAR
) AS
    V_CODIGO_ERRO NUMBER;
    V_MENSAGEM_ERRO VARCHAR2(500);
BEGIN
    INSERT INTO TB_RESPONSAVEL (
        ID_RESPONSAVEL,
        NM_RESPONSAVEL,
        DS_TIPO_DOCUMENTO,
        NR_DOCUMENTO,
        NR_TELEFONE,
        DS_EMAIL,
        DS_ENDERECO,
        DS_PREFERENCIA_CONTATO,
        ST_RECEBE_NOTIFICACAO
    ) VALUES (
        P_ID_RESPONSAVEL,
        P_NM_RESPONSAVEL,
        P_DS_TIPO_DOCUMENTO,
        P_NR_DOCUMENTO,
        P_NR_TELEFONE,
        P_DS_EMAIL,
        P_DS_ENDERECO,
        P_DS_PREFERENCIA_CONTATO,
        P_ST_RECEBE_NOTIFICACAO
    );

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        V_CODIGO_ERRO := SQLCODE;
        V_MENSAGEM_ERRO := 'Erro: responsável já cadastrado. Verifique se o ID ou documento informado já existe.';

        INSERT INTO TB_LOG_ERRO VALUES (
            SQ_LOG_ERRO.NEXTVAL,
            'PR_INSERIR_RESPONSAVEL',
            USER,
            SYSDATE,
            V_CODIGO_ERRO,
            V_MENSAGEM_ERRO
        );

    WHEN VALUE_ERROR THEN
        V_CODIGO_ERRO := SQLCODE;
        V_MENSAGEM_ERRO := 'Erro: valor inválido ou incompatível com o tipo/tamanho do campo.';

        INSERT INTO TB_LOG_ERRO VALUES (
            SQ_LOG_ERRO.NEXTVAL,
            'PR_INSERIR_RESPONSAVEL',
            USER,
            SYSDATE,
            V_CODIGO_ERRO,
            V_MENSAGEM_ERRO
        );

    WHEN OTHERS THEN
        V_CODIGO_ERRO := SQLCODE;
        V_MENSAGEM_ERRO := 'Erro inesperado na procedure PR_INSERIR_RESPONSAVEL: ' || SQLERRM;

        INSERT INTO TB_LOG_ERRO VALUES (
            SQ_LOG_ERRO.NEXTVAL,
            'PR_INSERIR_RESPONSAVEL',
            USER,
            SYSDATE,
            V_CODIGO_ERRO,
            V_MENSAGEM_ERRO
        );
END;
/

CREATE OR REPLACE PROCEDURE PR_INSERIR_PET (
    P_ID_PET IN NUMBER,
    P_NM_PET IN VARCHAR2,
    P_DS_ESPECIE IN VARCHAR2,
    P_DS_RACA IN VARCHAR2,
    P_DT_NASCIMENTO IN DATE,
    P_NR_PESO IN NUMBER,
    P_NR_ALTURA IN NUMBER,
    P_DS_SEXO IN CHAR,
    P_DS_ALERGIAS IN VARCHAR2,
    P_ST_CASTRADO IN CHAR,
    P_DS_COR_PELAGEM IN VARCHAR2,
    P_DS_MICROCHIP IN VARCHAR2,
    P_ID_RESPONSAVEL IN NUMBER
) AS
    V_CODIGO_ERRO NUMBER;
    V_MENSAGEM_ERRO VARCHAR2(500);
BEGIN
    INSERT INTO TB_PET (
        ID_PET,
        NM_PET,
        DS_ESPECIE,
        DS_RACA,
        DT_NASCIMENTO,
        NR_PESO,
        NR_ALTURA,
        DS_SEXO,
        DS_ALERGIAS,
        ST_CASTRADO,
        DS_COR_PELAGEM,
        DS_MICROCHIP,
        ID_RESPONSAVEL
    ) VALUES (
        P_ID_PET,
        P_NM_PET,
        P_DS_ESPECIE,
        P_DS_RACA,
        P_DT_NASCIMENTO,
        P_NR_PESO,
        P_NR_ALTURA,
        P_DS_SEXO,
        P_DS_ALERGIAS,
        P_ST_CASTRADO,
        P_DS_COR_PELAGEM,
        P_DS_MICROCHIP,
        P_ID_RESPONSAVEL
    );

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        V_CODIGO_ERRO := SQLCODE;
        V_MENSAGEM_ERRO := 'Erro: pet já cadastrado ou microchip duplicado.';

        INSERT INTO TB_LOG_ERRO VALUES (
            SQ_LOG_ERRO.NEXTVAL,
            'PR_INSERIR_PET',
            USER,
            SYSDATE,
            V_CODIGO_ERRO,
            V_MENSAGEM_ERRO
        );

    WHEN VALUE_ERROR THEN
        V_CODIGO_ERRO := SQLCODE;
        V_MENSAGEM_ERRO := 'Erro: valor inválido ou incompatível com o tipo/tamanho do campo no cadastro do pet.';

        INSERT INTO TB_LOG_ERRO VALUES (
            SQ_LOG_ERRO.NEXTVAL,
            'PR_INSERIR_PET',
            USER,
            SYSDATE,
            V_CODIGO_ERRO,
            V_MENSAGEM_ERRO
        );

    WHEN OTHERS THEN
        V_CODIGO_ERRO := SQLCODE;
        V_MENSAGEM_ERRO := 'Erro inesperado na procedure PR_INSERIR_PET: ' || SQLERRM;

        INSERT INTO TB_LOG_ERRO VALUES (
            SQ_LOG_ERRO.NEXTVAL,
            'PR_INSERIR_PET',
            USER,
            SYSDATE,
            V_CODIGO_ERRO,
            V_MENSAGEM_ERRO
        );
END;
/

CREATE OR REPLACE PROCEDURE PR_INSERIR_ALERTA (
    P_ID_ALERTA IN NUMBER,
    P_ID_PET IN NUMBER,
    P_ID_CONSULTA IN NUMBER,
    P_ID_TRATAMENTO IN NUMBER,
    P_DT_ALERTA IN DATE,
    P_DS_TIPO_ALERTA IN VARCHAR2,
    P_DS_NIVEL_RISCO IN VARCHAR2,
    P_DS_DESCRICAO IN VARCHAR2,
    P_DS_STATUS IN VARCHAR2,
    P_ST_NOTIFICADO IN CHAR
) AS
    V_CODIGO_ERRO NUMBER;
    V_MENSAGEM_ERRO VARCHAR2(500);
BEGIN
    INSERT INTO TB_ALERTA (
        ID_ALERTA,
        ID_PET,
        ID_CONSULTA,
        ID_TRATAMENTO,
        DT_ALERTA,
        DS_TIPO_ALERTA,
        DS_NIVEL_RISCO,
        DS_DESCRICAO,
        DS_STATUS,
        ST_NOTIFICADO
    ) VALUES (
        P_ID_ALERTA,
        P_ID_PET,
        P_ID_CONSULTA,
        P_ID_TRATAMENTO,
        P_DT_ALERTA,
        P_DS_TIPO_ALERTA,
        P_DS_NIVEL_RISCO,
        P_DS_DESCRICAO,
        P_DS_STATUS,
        P_ST_NOTIFICADO
    );

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        V_CODIGO_ERRO := SQLCODE;
        V_MENSAGEM_ERRO := 'Erro: já existe um alerta cadastrado com esse ID.';

        INSERT INTO TB_LOG_ERRO VALUES (
            SQ_LOG_ERRO.NEXTVAL,
            'PR_INSERIR_ALERTA',
            USER,
            SYSDATE,
            V_CODIGO_ERRO,
            V_MENSAGEM_ERRO
        );

    WHEN VALUE_ERROR THEN
        V_CODIGO_ERRO := SQLCODE;
        V_MENSAGEM_ERRO := 'Erro: valor inválido ou incompatível com o tipo/tamanho do campo no cadastro do alerta.';

        INSERT INTO TB_LOG_ERRO VALUES (
            SQ_LOG_ERRO.NEXTVAL,
            'PR_INSERIR_ALERTA',
            USER,
            SYSDATE,
            V_CODIGO_ERRO,
            V_MENSAGEM_ERRO
        );

    WHEN OTHERS THEN
        V_CODIGO_ERRO := SQLCODE;
        V_MENSAGEM_ERRO := 'Erro inesperado na procedure PR_INSERIR_ALERTA: ' || SQLERRM;

        INSERT INTO TB_LOG_ERRO VALUES (
            SQ_LOG_ERRO.NEXTVAL,
            'PR_INSERIR_ALERTA',
            USER,
            SYSDATE,
            V_CODIGO_ERRO,
            V_MENSAGEM_ERRO
        );
END;
/

