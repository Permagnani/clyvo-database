SET SERVEROUTPUT ON;

-- ============================================================
-- BLOCOS ANÔNIMOS E RELATÓRIOS - CLYVO PETCARE
-- ============================================================

-- ============================================================
-- BLOCO 1: TOTAL DE CONSULTAS POR VETERINÁRIO
-- JOIN + GROUP BY + ORDER BY
-- ============================================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('RELATÓRIO: TOTAL DE CONSULTAS POR VETERINÁRIO');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');

    FOR REG IN (
        SELECT
            V.NM_VETERINARIO,
            COUNT(C.ID_CONSULTA) AS TOTAL_CONSULTAS
        FROM TB_VETERINARIO V
        LEFT JOIN TB_CONSULTA C
            ON V.ID_VETERINARIO = C.ID_VETERINARIO
        GROUP BY V.NM_VETERINARIO
        ORDER BY TOTAL_CONSULTAS DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Veterinário: ' || REG.NM_VETERINARIO ||
            ' | Total de consultas: ' || REG.TOTAL_CONSULTAS
        );
    END LOOP;
END;
/

-- ============================================================
-- BLOCO 2: TOTAL DE ALERTAS POR NÍVEL DE RISCO
-- JOIN + GROUP BY + ORDER BY
-- ============================================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('RELATÓRIO: TOTAL DE ALERTAS POR NÍVEL DE RISCO');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');

    FOR REG IN (
        SELECT
            A.DS_NIVEL_RISCO,
            COUNT(A.ID_ALERTA) AS TOTAL_ALERTAS
        FROM TB_ALERTA A
        JOIN TB_PET P
            ON A.ID_PET = P.ID_PET
        GROUP BY A.DS_NIVEL_RISCO
        ORDER BY TOTAL_ALERTAS DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Nível de risco: ' || REG.DS_NIVEL_RISCO ||
            ' | Total de alertas: ' || REG.TOTAL_ALERTAS
        );
    END LOOP;
END;
/

-- ============================================================
-- BLOCO 3: VALOR ANTERIOR, ATUAL E PRÓXIMO DA ADESÃO
-- ============================================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('RELATÓRIO: ADESÃO ANTERIOR, ATUAL E PRÓXIMA');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

    FOR REG IN (
        SELECT
            ID_TRATAMENTO,
            ID_PET,
            NVL(TO_CHAR(LAG(NR_ADESAO) OVER (ORDER BY ID_TRATAMENTO)), 'Vazio') AS ADESAO_ANTERIOR,
            TO_CHAR(NR_ADESAO) AS ADESAO_ATUAL,
            NVL(TO_CHAR(LEAD(NR_ADESAO) OVER (ORDER BY ID_TRATAMENTO)), 'Vazio') AS ADESAO_PROXIMA
        FROM TB_TRATAMENTO
        ORDER BY ID_TRATAMENTO
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Tratamento: ' || REG.ID_TRATAMENTO ||
            ' | Pet: ' || REG.ID_PET ||
            ' | Anterior: ' || REG.ADESAO_ANTERIOR ||
            ' | Atual: ' || REG.ADESAO_ATUAL ||
            ' | Próximo: ' || REG.ADESAO_PROXIMA
        );
    END LOOP;
END;
/

-- ============================================================
-- BLOCO 4: CURSOR EXPLÍCITO - CONSULTAS
-- ============================================================

DECLARE

    CURSOR C_CONSULTAS IS
        SELECT
            P.NM_PET,
            C.DS_STATUS
        FROM TB_CONSULTA C
        JOIN TB_PET P
            ON C.ID_PET = P.ID_PET;

    V_NOME_PET TB_PET.NM_PET%TYPE;
    V_STATUS TB_CONSULTA.DS_STATUS%TYPE;

BEGIN

    OPEN C_CONSULTAS;

    LOOP

        FETCH C_CONSULTAS
        INTO V_NOME_PET, V_STATUS;

        EXIT WHEN C_CONSULTAS%NOTFOUND;

        IF V_STATUS = 'REALIZADA' THEN
            DBMS_OUTPUT.PUT_LINE(
                'Consulta realizada para o pet: ' || V_NOME_PET
            );
        ELSE
            DBMS_OUTPUT.PUT_LINE(
                'Consulta pendente/cancelada para o pet: ' || V_NOME_PET
            );
        END IF;

    END LOOP;

    CLOSE C_CONSULTAS;

END;
/

-- ============================================================
-- BLOCO 5: CURSOR EXPLÍCITO - TRATAMENTOS
-- ============================================================

DECLARE

    CURSOR C_TRATAMENTOS IS
        SELECT
            DS_MEDICAMENTO,
            DS_STATUS
        FROM TB_TRATAMENTO;

    V_MEDICAMENTO TB_TRATAMENTO.DS_MEDICAMENTO%TYPE;
    V_STATUS TB_TRATAMENTO.DS_STATUS%TYPE;

BEGIN

    OPEN C_TRATAMENTOS;

    LOOP

        FETCH C_TRATAMENTOS
        INTO V_MEDICAMENTO, V_STATUS;

        EXIT WHEN C_TRATAMENTOS%NOTFOUND;

        IF V_STATUS = 'ATIVO' THEN
            DBMS_OUTPUT.PUT_LINE(
                'Tratamento ativo: ' || V_MEDICAMENTO
            );
        ELSE
            DBMS_OUTPUT.PUT_LINE(
                'Tratamento encerrado/suspenso: ' || V_MEDICAMENTO
            );
        END IF;

    END LOOP;

    CLOSE C_TRATAMENTOS;

END;
/

-- ============================================================
-- BLOCO 6: CURSOR EXPLÍCITO - ALERTAS
-- ============================================================

DECLARE

    CURSOR C_ALERTAS IS
        SELECT
            DS_NIVEL_RISCO,
            DS_STATUS
        FROM TB_ALERTA;

    V_RISCO TB_ALERTA.DS_NIVEL_RISCO%TYPE;
    V_STATUS TB_ALERTA.DS_STATUS%TYPE;

BEGIN

    OPEN C_ALERTAS;

    LOOP

        FETCH C_ALERTAS
        INTO V_RISCO, V_STATUS;

        EXIT WHEN C_ALERTAS%NOTFOUND;

        IF V_RISCO = 'CRITICO' THEN
            DBMS_OUTPUT.PUT_LINE(
                'ALERTA CRÍTICO identificado.'
            );
        ELSE
            DBMS_OUTPUT.PUT_LINE(
                'Alerta registrado com nível: ' || V_RISCO
            );
        END IF;

    END LOOP;

    CLOSE C_ALERTAS;

END;
/

-- ============================================================
-- BLOCO 7: CURSOR EXPLÍCITO - PETS CASTRADOS
-- ============================================================

DECLARE

    CURSOR C_PETS IS
        SELECT
            NM_PET,
            ST_CASTRADO
        FROM TB_PET;

    V_NOME TB_PET.NM_PET%TYPE;
    V_CASTRADO TB_PET.ST_CASTRADO%TYPE;

BEGIN

    OPEN C_PETS;

    LOOP

        FETCH C_PETS
        INTO V_NOME, V_CASTRADO;

        EXIT WHEN C_PETS%NOTFOUND;

        IF V_CASTRADO = 'S' THEN
            DBMS_OUTPUT.PUT_LINE(
                'Pet castrado: ' || V_NOME
            );
        ELSE
            DBMS_OUTPUT.PUT_LINE(
                'Pet não castrado: ' || V_NOME
            );
        END IF;

    END LOOP;

    CLOSE C_PETS;

END;
/