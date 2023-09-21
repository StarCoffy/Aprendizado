create or replace PROCEDURE PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA
(
  PARAM_ID_ESTUDANTE IN NUMBER
, PARAM_INDICADOR IN VARCHAR2 := null
) AS

QTD_ESTUDANTE NUMBER;
BEGIN
    -- verifica se existe o estudante está ativo e custando su || te
    SELECT COUNT(E.ID) INTO QTD_ESTUDANTE FROM REP_ESCOLARIDADES_ESTUDANTES EE
    INNER JOIN REP_ESTUDANTES E ON E.ID = EE.ID_ESTUDANTE
    WHERE
    E.DELETADO = 0
    AND EE.DELETADO = 0
    AND E.SITUACAO = 'ATIVO'
    AND SIGLA_NIVEL_EDUCACAO IN('SU', 'TE')
    AND STATUS_ESCOLARIDADE IN('CURSANDO')
    AND E.ID = PARAM_ID_ESTUDANTE;

    -- inclue o estudante na fila
    IF(QTD_ESTUDANTE > 0) THEN
        FOR item IN
          (Select id from classificacoes_parametros_itens
            where indicador = PARAM_INDICADOR)
       LOOP
          INSERT INTO ESTUDANTES_PASSIVEIS_CLASSIFICACOES
            (ID, ID_ESTUDANTE, ID_CLASSIFICACOES_PARAMETROS_ITENS, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, DELETADO)
          VALUES(
            SEQ_ESTUDANTES_PASSIVEIS_CLASSIFICACOES.NEXTVAL,
            PARAM_ID_ESTUDANTE,
            item.id,
            CURRENT_DATE,
            CURRENT_DATE,
            'PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA',
            'PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA',
            0
         );
       END LOOP;

    END IF;
END;
/