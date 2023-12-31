CREATE OR REPLACE TRIGGER TRIGGER_01_OCORRENCIAS_ESTAGIO_INSERT_UPDATE
    AFTER INSERT OR UPDATE ON OCORRENCIAS_ESTAGIO
    FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    BEGIN
        INSERT INTO FILA_TRIAGEM_VAGA_ESTAGIO (ID, ID_VAGA, DATA_CRIACAO) VALUES (SEQ_FILA_TRIAGEM_VAGA_ESTAGIO_01.NEXTVAL, :NEW.ID_VAGA_ESTAGIO, SYSDATE);
        COMMIT;
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
END;