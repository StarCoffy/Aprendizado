create or replace PROCEDURE {{user}}.proc_atualizar_triagem_estudante_remove_inativo
(
    V_IDS_ESTUDANTES IN OUT {{user}}.IDS_TYP
)
AS
    V_IDS_ESTUDANTES_EXCLUIR {{user}}.IDS_TYP;
BEGIN
    -- BUSCA OS ESTUDANTES QUE DEVE EXCLUIR
    SELECT
        CAST(collect(E.ID) as {{user}}.IDS_TYP) INTO V_IDS_ESTUDANTES_EXCLUIR
    FROM
        {{user}}.rep_estudantes E
    WHERE
      --UTILIZA EXISTS POIS É MAIS RÁPIDO QUE MEMBER OF
        EXISTS(SELECT 1 FROM TABLE(V_IDS_ESTUDANTES) t WHERE e.ID = t.column_value)
      AND (e.FLAG_ATIVO = 0 OR e.DELETADO = 1);

    -- EXCLUI OS ESTUDANTES INATIVOS DA TRIAGEM
    DELETE FROM {{user}}.TRIAGENS_ESTUDANTES WHERE
        EXISTS(SELECT 1 FROM TABLE(V_IDS_ESTUDANTES_EXCLUIR) t WHERE ID_ESTUDANTE = t.column_value);

    --ATUALIZA A LISTA DE ESTUDANTES ATIVOS (REMOVE OS INATIVOS OU EXCLUÍDOS)
    V_IDS_ESTUDANTES := V_IDS_ESTUDANTES MULTISET EXCEPT V_IDS_ESTUDANTES_EXCLUIR;
END;
/
